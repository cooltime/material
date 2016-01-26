import logging

if __name__ == '__main__':
    log_format = '[%(levelname)s] [%(asctime)s] [PID:%(process)d] \
        [FUNCNAME:%(funcName)s] [LINENO:%(lineno)d] - %(message)s'

    logging.basicConfig(filename = 'access.log', level = logging.INFO, \
        format = log_format)
    logging.debug('debug message')
    logging.info('info message')
    logging.warning('warning message')
    logging.error('error message')
    logging.critical('critical message')
