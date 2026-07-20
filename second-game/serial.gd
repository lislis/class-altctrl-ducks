extends Node

var manager: GdSerialManager

func _ready():
	manager = GdSerialManager.new()
	manager.data_received.connect(_on_data)
	manager.port_disconnected.connect(_on_disconnect)

	var ports: Dictionary = manager.list_ports()
	for i in ports:
		var info = ports[i]
		print("- ", info["port_name"], " (", info["device_name"], ")")
	# mode is optional; defaults to MODE_RAW. Use the constants for clarity:
	# MODE_RAW (emit all chunks), MODE_LINE_BUFFERED (wait for \n), MODE_CUSTOM_DELIMITER
	#if manager.open("COM3", 9600, 1000):  # RAW (default)
	#	print("Connected to COM3")

func _process(_delta):
	# This triggers the signals above
	manager.poll_events()

func _on_data(port: String, data: PackedByteArray):
	print("Data from ", port, ": ", data.get_string_from_utf8())

func _on_disconnect(port: String):
	print("Lost connection to ", port)
