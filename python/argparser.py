import argparse

def get_parser():
    parser = argparse.ArgumentParser(prog="ArgParser", description="ArgParser Example", \
        epilog="Created by cooltime", add_help=True, prefix_chars='-', usage=None)

    parser.add_argument('-v', '--version', action='version', version='%(prog)s 1.0')
    parser.add_argument('-f', '--flag', action='store_true', help='flag, true or false', \
        dest='flag')


    return parser

def parse_args():
    args = get_parser().parse_args()

    # do some judgement


    return args

if __name__ == '__main__':
    args = parse_args()
    print vars(args)
