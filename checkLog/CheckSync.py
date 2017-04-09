#!/usr/bin/python

import os
import time
import logging

class CheckSync(object):

    """ docstring """

    def __init__(self, file_to_check, log_filename, ):
        self.file_to_check = file_to_check
        self.log_filename = log_filename

    def do_file_check(self):
        """ the real mccoy """
		# Get current time
        now = int(time.time())

		# Initialize logging utility
        logger = logging.getLogger()
        logger.setLevel(logging.INFO)
        logging_formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
		# Set up the logger
        logging_file_handler = logging.FileHandler(self.log_filename)
        logging_file_handler.setFormatter(logging_formatter)
        logger.addHandler(logging_file_handler)

        try:
			# Get target files last modification time
            file_epoch = int(os.path.getmtime(self.file_to_check))
            # Compare current with modification time
            file_age = (now - file_epoch) / 60

			# Update the log file
            logger.info(self.file_to_check + " last modified: " \
			            + str(time.ctime(os.path.getmtime(self.file_to_check))) \
						+ ", Age: " + str(file_age) + " minutes.")
			# Return successful execution
            return 0

        except OSError:
            logger.critical("Cannot find the specified file(s)")

			# Return failed execution
            return 1

    def get_filename(self):
        """ get the file which you want to check """
        return self.file_to_check

    def get_logname(self):
        """ get the path to the log file """
        return self.log_filename
		