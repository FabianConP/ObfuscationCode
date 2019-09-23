import sys
sys.path.append('../')
from Utility import *
import time


def test_file(path, params):
    file_name = get_file_name(path)
    dir_out_file =  params[1] + "Out-" + get_file_name(path) + ".txt"
    file_name_report = "{0:20}".format(file_name)

    command = prepare_command(path, [params[0],dir_out_file])
    cmd = os.popen(command)

    time.sleep(0.5)

    cmd_lines = cmd.readlines()
    cmd_lines = "".join([line for line in cmd_lines if '\n' != line])

    result = True
    result_msg = ''

    if not file_exists(dir_out_file):
        result = False
        result_msg = "File couldn't be created or was deleted by the Antivirus"
    elif cmd_lines.find("ScriptContainedMaliciousContent") != -1:
        result = False
        result_msg = "Script detected as malicious"

    result_str = "{0:15}".format("Passed!" if result else "Detected") + " " + result_msg

    print(file_name_report + result_str)

    return (file_name, result)


if __name__ == '__main__':

    # Create temporary out folder 
    DIR_OUT = ".\\out\\"
    restart_directory(DIR_OUT)

    # Get list of files
    DIR_GEN_OBF = ".\gen-obf\\"
    path_files = get_list_files(DIR_GEN_OBF)

    # Define params
    params = ['https://raw.githubusercontent.com/leachim6/hello-world/master/j/Java.java',
                DIR_OUT]

    # Execute and get results
    results = test_files(path_files, params, test_file)
