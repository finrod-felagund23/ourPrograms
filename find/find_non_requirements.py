import os
import re


search_request = input('Enter search requests: ')


result = list()
count = 0
directories_count = 0


def main(path):
    global count, directories_count
    for x in os.listdir(path):
        print(f'\r| Iterations count {count} \\|/ Directories count {directories_count} |', end='\r')
        count += 1

        if os.path.isdir(os.path.join(path, x)):
            directories_count += 1
            main(os.path.join(path, x))

        if re.search(search_request, x):
            result.append(os.path.abspath(x))


if __name__ == '__main__':
    main(os.getcwd())
    print('\n\nНайденые Совпадения: ')
    print('\n'.join(result))
    input()
