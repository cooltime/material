#!/usr/bin/python
# coding=utf-8

import sys
import requests
import json
import time
import matplotlib
matplotlib.use('Cairo')
import matplotlib.pyplot as plot
import sys
import os
import os.path
import math
import argparse
import sys
from datetime import datetime
import matplotlib.dates as mdates
import commands

URL = 'http://dashboard.falcon.dev.changbaops.com/chart/a?cf=AVERAGE&sum=off&id=8379'
COOKIES = dict(Authentication='e02074ca9be74d40d5ca08bcb042588e')
FIGURE_NUM_COL = 2
FILENAME_PREFIX = 'flow_'
INDEX_POSTFIX = 'flow_yyyymmddhhii.png'

def get_parser():
    parser = argparse.ArgumentParser(prog="flow_drawer", description="draw flow status", \
        epilog="Created by cooltime", add_help=True, prefix_chars='-', usage=None, \
        formatter_class=argparse.RawDescriptionHelpFormatter)

    # select some pieces to reuse
    parser.add_argument('-v', '--version', action='version', version='%(prog)s 1.0')
    parser.add_argument('-t', '--truncate', action='store_true', help='just get few high ones, true or false', \
        dest='is_truncate', default=True)

    return parser

def parse_args():
    args = get_parser().parse_args()

    return args

def get_data(is_truncate):
    end = int(time.time()) - 60
    start = end - 3600
    url = URL + "&start=" + str(start) + "&end=" + str(end)
    r = requests.get(url, cookies = COOKIES)
    raw_data = json.loads(r.text)

    raw_series = raw_data['series']
    map_series = {}
    for serie in raw_series:
        if not map_series.has_key(serie['counter']):
            map_series[serie['counter']] = {}
            map_series[serie['counter']]['data'] = {}
            map_series[serie['counter']]['ts'] = []
            map_series[serie['counter']]['max_value'] = 0
            for item in serie['data']:
                map_series[serie['counter']]['ts'].append(item[0])

        map_series[serie['counter']]['data'][serie['endpoint']] = {}
        map_series[serie['counter']]['data'][serie['endpoint']]['ts'] = []
        map_series[serie['counter']]['data'][serie['endpoint']]['value'] = []
        if is_truncate:
            map_series[serie['counter']]['data'][serie['endpoint']]['max_value'] = 0
        for item in serie['data']:
            map_series[serie['counter']]['data'][serie['endpoint']]['ts'].append(item[0])
            if item[1] == None:
                item[1] = 0
            map_series[serie['counter']]['data'][serie['endpoint']]['value'].append(item[1])
            if is_truncate and item[1] > map_series[serie['counter']]['data'][serie['endpoint']]['max_value']:
                map_series[serie['counter']]['data'][serie['endpoint']]['max_value'] = item[1]
            if item[1] > map_series[serie['counter']]['max_value']:
                map_series[serie['counter']]['max_value'] = item[1]

        if is_truncate:
            water_line = map_series[serie['counter']]['max_value'] / 2
            for endpoint, raw_data in map_series[serie['counter']]['data'].items():
                    if raw_data['max_value'] < water_line:
                        del map_series[serie['counter']]['data'][endpoint]

    return map_series

def do_plot(raw_data, is_truncate, file_dir):

    d = datetime.fromtimestamp(time.time())
    file_path = file_dir + "/" + FILENAME_PREFIX + d.strftime("%Y%m%d%H%M") + '.png'


    figure_num = len(raw_data)
    figure_num_col = FIGURE_NUM_COL
    figure_num_row = int(math.ceil(figure_num / figure_num_col))
    fig = plot.figure(figsize=(16.0, 10.0))
    i = 1
    for counter, figure_data in raw_data.items():
        ruler = ''
        base = 0
        if figure_data['max_value'] > 1024 * 1024 * 1024 * 1024:
            ruler = 'T'
            base = 1024 * 1024 * 1024 * 1024
        elif figure_data['max_value'] > 1024 * 1024 * 1024:
            ruler = 'G'
            base = 1024 * 1024 * 1024
        elif figure_data['max_value'] > 1024 * 1024:
            ruler = 'M'
            base = 1024 * 1024
        elif figure_data['max_value'] > 1024:
            ruler = 'K'
            base = 1024

        title = counter
        axs = plot.subplot(figure_num_row, figure_num_col, i)

        for endpoint, line_data in figure_data['data'].items():
            dts = [mdates.date2num(datetime.fromtimestamp(dt / 1000)) for dt in line_data['ts']]
            values = [format_value(value, base) for value in line_data['value']]
            plot.xlabel('time')
            plot.ylabel('flow(' + ruler + 'B)')
            axs.xaxis.set_major_formatter(mdates.DateFormatter('%H:%M:%S'))
            plot.grid(True)
            plot.plot_date(dts, values, '-', label=endpoint)

        # show legend if in truncate mode, for in normal mode the number of legend is too many
        if is_truncate:
            plot.legend(loc=8, ncol=4)
        plot.title(title)
        i += 1

    plot.savefig(file_path)
    return file_path

def format_value(value, base):
    if value == None:
        return None

    return value / base

def post_actions(base_dir, data_path, latest_file):
    index_file = data_path + INDEX_POSTFIX
    if (os.path.islink(index_file)):
        os.remove(index_file)
    os.symlink(latest_file, index_file)
    cmd = "bash " + base_dir + "/bin/clean.sh"
    status = commands.getstatus(cmd)
    if status != 0:
        return False

    return True

def upload_pic(file_path):
    pass

if __name__ == '__main__':
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    DATA_DIR = BASE_DIR + "/data/"
    INDEX_FILE = DATA_DIR + 'flow_yyyymmddhhii.png'

    if not os.path.exists(DATA_DIR):
        os.mkdir(DATA_DIR)

    args = parse_args()
    file_path = do_plot(get_data(args.is_truncate), args.is_truncate, DATA_DIR)
    
    ret_code = post_actions(BASE_DIR, DATA_DIR, file_path)

    upload_pic(file_path)

    sys.exit(ret_code)

