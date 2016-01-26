import argparse
import sys
import os.path

def get_parser():
    parser = argparse.ArgumentParser(prog="ArgParser", description="ArgParser Example", \
        epilog="Created by cooltime", add_help=True, prefix_chars='-', usage=None)

    # select some pieces to reuse
    parser.add_argument('-v', '--version', action='version', version='%(prog)s 1.0')
    parser.add_argument('-f', '--flag', action='store_true', help='flag, true or false', \
        dest='isRaw')
    parser.add_argument('-u', '--user', help='the user ran as', metavar='username', \
        required=True)
    parser.add_argument('-c', '--conf', help='conf file', metavar='confFile', \
        default='argparser.conf')
    parser.add_argument('-m', '--mode', help='the mode in which to run the program', \
        choices=['single', 'multiple'], default='single')
    parser.add_argument('-n', '--number', help='an integer param', metavar='integer', \
        type=int, nargs='+', required=True)
    parser.add_argument('targets', help='targets of the program', metavar='target', \
        nargs='+')


    return parser

def parse_args():
    args = get_parser().parse_args()

    # do some judgement


    return args

if __name__ == '__main__':
    # Get BASE_DIR, and this file shold be in BASE_DIR/bin/this.py
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

    # Parse command line arguments
    args = parse_args()
    print vars(args)
