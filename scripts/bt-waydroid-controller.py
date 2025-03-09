#!/usr/bin/env python3
import os
import subprocess

CONTROLLER_NAME = "8BitDo Pro 2"

log_output = subprocess.run(["cat", "/proc/bus/input/devices"],
                            stdout=subprocess.PIPE,
                            universal_newlines=True).stdout

on_correct_section = False
controller_event_handler = ""

for l in log_output.split("\n"):
    if CONTROLLER_NAME in l:
        on_correct_section = True
    if on_correct_section and "event" in l:
        controller_event_handler = l.split('=')[1].split(' ')[0]

assert controller_event_handler != "", "Controller not found, try double checking the controller is on, and the correct CONTROLLER_NAME is set."
print(f'{CONTROLLER_NAME} event handler "{controller_event_handler}" found.')
exec_arg = fr'echo add > /sys/class/input/{controller_event_handler}/uevent'
print(f"Executing: `sudo sh -c {exec_arg}`")
subprocess.run(["sudo", "sh", "-c", exec_arg])
