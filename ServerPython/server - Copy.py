import socket
import threading
import os
import time


def main():
    host = '192.168.1.6'
    port = 5000

    s = socket.socket()
    s.bind((host, port))

    s.listen(5)

    print("Server Started.")
    sock, addr = s.accept()
    print("client connedted ip:<" + str(addr) + ">")
    while True:
        sock.send('1.25'.encode())
        time.sleep(1)
        print('data sent')

    # while True:
    #   print('Main Thread')

    # sock.close()


if __name__ == '__main__':
    main()
