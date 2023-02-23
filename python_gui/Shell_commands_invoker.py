import sys

from PyQt5 import QtCore, QtWidgets
from PyQt5.QtWidgets import QFileDialog, QLineEdit

import GuiUtils
from GuiConsts import GuiConsts
from GuiUtils import change_working_directory


# class Ls:
#     def __init__(self):
#         super().__init__()
#
#     def select_dir(self, output):
#         dir_name = QFileDialog.getExistingDirectory(None, 'Select directory')
#
#         if dir_name:
#             output.
#
#
#     def ls_action(self):
#         change_working_directory(GuiConsts.shell_commands_path)
#
#         exe_command = ['./myls.pl']
#         exe_command.extend(gui.ex.comboBox_ls.currentText().split(' '))
#         exe_command.append(gui.ex.lineEdit_loadfile_ls.text())
#
#         append_to = "textBrowser_terminal_ls.append"
#
#         execute_process(exe_command,append_to)


class Shell_commands_invoker:
    @staticmethod
    @QtCore.pyqtSlot()
    def select_shell(self):
        self.stackedWidget_commands_buttons.setCurrentIndex(0)


    @staticmethod
    @QtCore.pyqtSlot()
    def select_admin(self):
        self.stackedWidget_commands_buttons.setCurrentIndex(1)


    @staticmethod
    @QtCore.pyqtSlot()
    def select_system(self):
        self.stackedWidget_commands_buttons.setCurrentIndex(2)



    @staticmethod
    @QtCore.pyqtSlot()
    def select_command_ls(self):
        self.stackedWidget_commands.setCurrentIndex(0)


    @staticmethod
    @QtCore.pyqtSlot()
    def select_command_mkdir(self):
        self.stackedWidget_commands.setCurrentIndex(1)


    @staticmethod
    @QtCore.pyqtSlot()
    def select_command_mv(self):
        self.stackedWidget_commands.setCurrentIndex(2)


    @staticmethod
    @QtCore.pyqtSlot()
    def select_command_tail(self):
        self.stackedWidget_commands.setCurrentIndex(3)


    @staticmethod
    @QtCore.pyqtSlot()
    def select_command_wc(self):
        self.stackedWidget_commands.setCurrentIndex(4)

    @staticmethod
    @QtCore.pyqtSlot()
    def select_dir(self):
        dir_name = QFileDialog.getExistingDirectory(None, 'Select directory')

        if dir_name:
            self.setText(dir_name)


    @staticmethod
    @QtCore.pyqtSlot()
    def select_file(self):
        file_name, _ = QFileDialog.getOpenFileName(None, 'Select file')

        if file_name:
            self.setText(file_name)



    @staticmethod
    @QtCore.pyqtSlot()
    def execute_ls(self):

        #change_working_directory(GuiConsts.shell_commands_path)

        exe_command = ['./myls.pl']
        exe_command.extend(self.comboBox_ls.currentText().split(' '))
        exe_command.append(self.lineEdit_ls.text())

        #process_output = GuiUtils.execute_process(exe_command)

        # if process_output:
        #     self.setText(process_output)

        if exe_command:
            GuiUtils.append_to(self.textBrowser_terminal, exe_command.__str__())


    @staticmethod
    @QtCore.pyqtSlot()
    def execute_mkdir(self):

        #change_working_directory(GuiConsts.shell_commands_path)

        exe_command = ['./mymkdir.pl']
        dir_full_path = self.lineEdit_mkdir.text() + self.lineEdit_dirname.text()
        exe_command.append(dir_full_path)
        # if process_output:
        #     self.setText(process_output)

        if exe_command:
            GuiUtils.append_to(self.textBrowser_terminal, exe_command.__str__())



    @staticmethod
    @QtCore.pyqtSlot()
    def execute_mv(self):

        #change_working_directory(GuiConsts.shell_commands_path)

        exe_command = ['./myvm.pl']
        exe_command.append(self.lineEdit_mv_src.text())
        exe_command.append(self.lineEdit_mv_dest.text())
        # if process_output:
        #     self.setText(process_output)

        if exe_command:
            GuiUtils.append_to(self.textBrowser_terminal, exe_command.__str__())


    @staticmethod
    @QtCore.pyqtSlot()
    def execute_tail(self):

        #change_working_directory(GuiConsts.shell_commands_path)

        exe_command = ['./mytail.pl']
        exe_command.append(self.lineEdit_tail.text())
        # if process_output:
        #     self.setText(process_output)

        if exe_command:
            GuiUtils.append_to(self.textBrowser_terminal, exe_command.__str__())


    @staticmethod
    @QtCore.pyqtSlot()
    def execute_wc(self):

        #change_working_directory(GuiConsts.shell_commands_path)

        exe_command = ['./mywc.pl']
        exe_command.append(self.lineEdit_src_wc.text())
        # if process_output:
        #     self.setText(process_output)

        if exe_command:
            GuiUtils.append_to(self.textBrowser_terminal, exe_command.__str__())


    @staticmethod
    @QtCore.pyqtSlot()
    def execute_clear_terminal(self):
        self.textBrowser_terminal.setText("")

    @staticmethod
    @QtCore.pyqtSlot()
    def execute_exit(self):
        sys.exit(0)
