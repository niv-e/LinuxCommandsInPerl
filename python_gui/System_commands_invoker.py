from PyQt5 import QtCore

import GuiUtils


class System_commands_invoker:
    @staticmethod
    @QtCore.pyqtSlot()
    def select_kill(self):
        self.stackedWidget_commands.setCurrentIndex(5)


    @staticmethod
    @QtCore.pyqtSlot()
    def select_ps(self):
        self.stackedWidget_commands.setCurrentIndex(6)
        exe_command = ['./myps.pl']
        # if process_output:
        #     self.setText(process_output)

        if exe_command:
            GuiUtils.append_to(self.textBrowser_terminal, exe_command.__str__())


    @staticmethod
    @QtCore.pyqtSlot()
    def select_whoami(self):
        self.stackedWidget_commands.setCurrentIndex(6)
        exe_command = ['./mywhoami.pl']
        # if process_output:
        #     self.setText(process_output)

        if exe_command:
            GuiUtils.append_to(self.textBrowser_terminal, exe_command.__str__())


    @staticmethod
    @QtCore.pyqtSlot()
    def execute_kill(self):

        #change_working_directory(GuiConsts.shell_commands_path)

        exe_command = ['./mykill.pl']
        exe_command.append(self.lineEdit_src_kill.text())
        # if process_output:
        #     self.setText(process_output)

        if exe_command:
            GuiUtils.append_to(self.textBrowser_terminal, exe_command.__str__())


    @staticmethod
    @QtCore.pyqtSlot()
    def execute_ps(self):

        #change_working_directory(GuiConsts.shell_commands_path)

        exe_command = ['./mykill.pl']
        # if process_output:
        #     self.setText(process_output)

        if exe_command:
            GuiUtils.append_to(self.textBrowser_terminal, exe_command.__str__())


    @staticmethod
    @QtCore.pyqtSlot()
    def execute_whoami(self):

        #change_working_directory(GuiConsts.shell_commands_path)

        exe_command = ['./mywhoami.pl']
        # if process_output:
        #     self.setText(process_output)

        if exe_command:
            GuiUtils.append_to(self.textBrowser_terminal, exe_command.__str__())
