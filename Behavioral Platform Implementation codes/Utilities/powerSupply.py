# for controlling the powersupply for shocking
# make sure power supply is in serial mode and voltage and current values are set to proper limits
import serial
from serial.tools import list_ports
import time

ports = serial.tools.list_ports.comports()

for i, port in enumerate(ports):
    print(i, port)

port_choice = int(input("Enter port number for power supply: "))

delay = 1  # in seconds
s = serial.Serial()
s.port = str(ports[port_choice][0])
s.baudrate = 9600
s.parity = "N"
s.bytesize = 8
s.stopbits = 1
s.open()
try:
    while True:
        s.write(b"OUT1")
        time.sleep(delay)
        s.write(b"OUT0")
        time.sleep(delay)
except KeyboardInterrupt:
    pass
s.write(b"OUT0")
s.close()
print("done")
