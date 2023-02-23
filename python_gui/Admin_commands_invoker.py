from PyQt5 import QtCore


class Admin_commands_invoker:
    @staticmethod
    @QtCore.pyqtSlot()
    def select_add_user(self):
        self.stackedWidget_commands_buttons.setCurrentIndex(0)
