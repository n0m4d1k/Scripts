import time
import random
import pyautogui
from win32 import win32api
from win32 import win32process
from win32 import win32gui


def callback(hwnd, pid):
    if win32process.GetWindowThreadProcessId(hwnd)[1] == pid:
        # hide window
        win32gui.ShowWindow(hwnd, 0)


# find hwnd of parent process, which is the cmd.exe window
win32gui.EnumWindows(callback, os.getppid())

keyboard = pyautogui

while True:
    delay = random.uniform(15, 90)
    keyboard.press('numlock')
    keyboard.press('numlock')
    time.sleep(delay)