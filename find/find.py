import os
import re
import colorama
colorama.init()


SEARCH_REQUEST = input('Enter search requests: ')


result = list()
count = 0
directories_count = 0
color = colorama.Fore.GREEN


def main(path):
    global count, color, directories_count
    for x in os.listdir(path):
        print(color + f'\r| Iterations count {count} \\|/ Directories count {directories_count} |', end='\r')
        count += 1
        if count == 10000:
            color = colorama.Fore.BLUE
        if count == 20000:
            color = colorama.Fore.YELLOW
        if count == 30000:
            color = colorama.Fore.RED
            
        if os.path.isdir(os.path.join(path, x)):
            directories_count += 1
            main(os.path.join(path, x))

        if re.search(SEARCH_REQUEST, x):
            result.append(os.path.abspath(x))


if __name__ == '__main__':
    main(os.getcwd())
    color = colorama.Fore.RESET
    print(color + '\n\nFound Matches: ')
    print(color + '\n'.join(result))
    input()
