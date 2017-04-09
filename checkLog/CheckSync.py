""" Check file age in minutes """
import os
import time
import logging

def do_file_check(file_to_check, log_filename):
    """ the real mccoy """
    # Get current time
    now = int(time.time())
    logger = Logger().get_logger(log_filename)

    try:
		# Get target files last modification time
        file_epoch = int(os.path.getmtime(file_to_check))
    except OSError:
        logger.critical("Cannot find the specified file")
        logger.handlers.pop()
		# Return failed execution
        return 1

	# Compare current with modification time
    file_age = (now - file_epoch) / 60

	# Update the log file
    logger.info(file_to_check + " last modified: " \
	            + str(time.ctime(os.path.getmtime(file_to_check))) \
				+ ", Age: " + str(file_age) + " minutes.")
    logger.handlers.pop()
	# Return successful execution
    return 0

class Logger(object):
    """ set up the logging utility """
    logger = None
    def get_logger(self, log_filename):
        """ get the logger """
        if self.logger is None:
            # Initialize logging utility
            self.logger = logging.getLogger(log_filename)
            self.logger.setLevel(logging.INFO)
            logging_formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    	    # Set up the logger
            logging_file_handler = logging.FileHandler(log_filename)
            logging_file_handler.setFormatter(logging_formatter)
            self.logger.addHandler(logging_file_handler)

        return self.logger
