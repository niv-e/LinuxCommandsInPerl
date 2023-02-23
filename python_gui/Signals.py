import threading
from functools import partial

from Admin_commands_invoker import Admin_commands_invoker
import login
import mainWidget
from Shell_commands_invoker import Shell_commands_invoker
from System_commands_invoker import System_commands_invoker


class Signals:
    def __init__(self, login_wig: login, main_wig: mainWidget):
        # Login
        login_wig.pushButton.clicked.connect(login_wig.on_click)

        # navbar
        main_wig.pushButtonShell.clicked.connect(partial(Shell_commands_invoker.select_shell, main_wig))
        main_wig.pushButtonAdmin.clicked.connect(partial(Shell_commands_invoker.select_admin, main_wig))
        main_wig.pushButtonSystem.clicked.connect(partial(Shell_commands_invoker.select_system, main_wig))

        # terminal
        main_wig.pushButton_clear.clicked.connect(partial(Shell_commands_invoker.execute_clear_terminal, main_wig))
        main_wig.pushButton_exit.clicked.connect(partial(Shell_commands_invoker.execute_exit, main_wig))


        # shell commands
        main_wig.pushButton_ls.clicked.connect(partial(Shell_commands_invoker.select_command_ls, main_wig))
        main_wig.pushButton_mkdir.clicked.connect(partial(Shell_commands_invoker.select_command_mkdir, main_wig))
        main_wig.pushButton_mv.clicked.connect(partial(Shell_commands_invoker.select_command_mv, main_wig))
        main_wig.pushButton_tail.clicked.connect(partial(Shell_commands_invoker.select_command_tail, main_wig))
        main_wig.pushButton_wc.clicked.connect(partial(Shell_commands_invoker.select_command_wc, main_wig))

        # admin commands
        # main_wig.pushButton_adduser.clicked.connect(partial(Admin_commands_invoker.select_add_user, main_wig))
        # main_wig.pushButton_addgroup.clicked.connect(partial(Admin_commands_invoker.select_add_group, main_wig))
        # main_wig.pushButton_changepass.clicked.connect(partial(Admin_commands_invoker.select_change_password, main_wig))

        # system commands
        main_wig.pushButton_kill.clicked.connect(partial(System_commands_invoker.select_kill, main_wig))
        main_wig.pushButton_ps.clicked.connect(partial(System_commands_invoker.select_ps, main_wig))
        main_wig.pushButton_whoami.clicked.connect(partial(System_commands_invoker.select_whoami, main_wig))

        # ls
        main_wig.pushButton_ls_browse_.clicked.connect(partial(Shell_commands_invoker.select_dir, main_wig.lineEdit_ls))
        main_wig.pushButton_ls_exe.clicked.connect(partial(Shell_commands_invoker.execute_ls, main_wig))

        # mkdir
        main_wig.pushButton_mkdir_browse.clicked.connect(partial(Shell_commands_invoker.select_dir, main_wig.lineEdit_mkdir))
        main_wig.pushButton_mkdir_exe.clicked.connect(partial(Shell_commands_invoker.execute_mkdir, main_wig))

        # mv
        main_wig.pushButton_mv_src.clicked.connect(partial(Shell_commands_invoker.select_dir, main_wig.lineEdit_mv_src))
        main_wig.pushButton_mv_dest.clicked.connect(partial(Shell_commands_invoker.select_dir, main_wig.lineEdit_mv_dest))
        main_wig.pushButton_mv_exe.clicked.connect(partial(Shell_commands_invoker.execute_mv, main_wig))

        # tail
        main_wig.pushButton_tail_browse.clicked.connect(partial(Shell_commands_invoker.select_file, main_wig.lineEdit_tail))
        main_wig.pushButton_tail_exe.clicked.connect(partial(Shell_commands_invoker.execute_tail, main_wig))

        # wc
        main_wig.pushButton_wc_browse_.clicked.connect(partial(Shell_commands_invoker.select_file, main_wig.lineEdit_src_wc))
        main_wig.pushButton_wc_exe.clicked.connect(partial(Shell_commands_invoker.execute_wc, main_wig))

        ### system ###

        # kill
        main_wig.pushButton_kill_exc.clicked.connect(partial(System_commands_invoker.execute_kill, main_wig))
