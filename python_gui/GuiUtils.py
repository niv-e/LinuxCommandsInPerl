import os
import subprocess

from PyQt5 import QtWidgets

from GuiConsts import GuiConsts


def change_working_directory(dir_path):
    if not GuiConsts.base_directory_path.endswith(dir_path.replace('../', '')):
        os.chdir(os.path.join(GuiConsts.base_directory_path, dir_path))


def execute_process(args: list):
    proc = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = proc.communicate()

    try:
        process = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout, stderr = process.communicate()
        output_text = stdout.decode() + stderr.decode()
    except Exception as e:
        output_text = str(e)

    process.terminate()
    return output_text

def append_to(stdout: QtWidgets, output: str):
    stdout.setText(stdout.toPlainText() + '\n' + output)

