import time
import systemd.daemon


if __name__ == "__main__":

    systemd.daemon.notify('READY=1')

    while True:
        print('Hello from service')
        time.sleep(5)