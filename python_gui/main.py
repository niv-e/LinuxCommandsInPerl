import sys

from PyQt5 import QtWidgets, QtCore

from Signals import Signals
from login import Login_Form
from mainWidget import Main_Widget

if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)

    login_form = QtWidgets.QWidget()
    login_form.setWindowFlags(QtCore.Qt.FramelessWindowHint)
    login_form.setAttribute(QtCore.Qt.WA_TranslucentBackground)

    mainForm = QtWidgets.QWidget()
    mainForm.setWindowFlags(QtCore.Qt.FramelessWindowHint)
    mainForm.setAttribute(QtCore.Qt.WA_TranslucentBackground)

    mainWindow = Main_Widget()
    mainWindow.setupUi(mainForm)

    loginWindow = Login_Form()
    loginWindow.setupUi(login_form, mainForm)
    signal = Signals(loginWindow, mainWindow)

    login_form.show()
    sys.exit(app.exec_())
