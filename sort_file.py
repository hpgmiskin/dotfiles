import re
import sys
import argparse


def parse_args(args):
    argument_parser = argparse.ArgumentParser(description="Sort all the lines in a file")
    argument_parser.add_argument("file_path", help="Path to file to sort")
    argument_parser.add_argument("--write", action="store_true")
    return argument_parser.parse_args(args)


def read_lines(file_path):
    with open(file_path, "r") as open_file:
        return open_file.readlines()


def write_lines(file_path, lines):
    with open(file_path, "w") as open_file:
        open_file.writelines(lines)


def print_lines(lines):
    for line in lines:
        print(line, end="")


def sort_lines_by_block(lines):
    blocks = [[]]
    last_line_index = len(lines) - 1
    for index,line in enumerate(lines):
        if re.match(r"^\s*$", line):
            if index < last_line_index:
                blocks.append([])
        else:
            block = blocks[-1]
            block.append(line)
    sorted_blocks = [
        sorted(set(block), key=lambda line:line.lower())
        for block in blocks
    ]
    sorted_lines = []
    last_block_index = len(sorted_blocks) - 1
    for index, block in enumerate(sorted_blocks):
        sorted_lines += block
        if len(block) and index < last_block_index:
            sorted_lines.append("\n")
    return sorted_lines


def sort_file(file_path, write=False):
    lines = read_lines(file_path)
    sorted_lines = sort_lines_by_block(lines)
    if write:
        write_lines(file_path, sorted_lines)
    else:
        print_lines(sorted_lines)


def main():
    args = parse_args(sys.argv[1:])
    sort_file(args.file_path, args.write)

if __name__ == "__main__":
    main()
