import os, time, logging

def checkSyncinSyncout():
	# Variable initializations
	syncinFile = '/tmp/test.txt'
	syncoutFile = '/tmp/test.txt'
	logFilename = '/tmp/test.log'

	# Get current time
	now = int(time.time())
	strNow = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(now))

	# Initialize logging utility
	logger = logging.getLogger()
	logger.setLevel(logging.INFO)
	loggingFormatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
	
	# Set up the logger
	loggingFileHandler = logging.FileHandler(logFilename)
	loggingFileHandler.setFormatter(loggingFormatter)
	logger.addHandler(loggingFileHandler)

	try:
		
		# Get target files last modification time
		syncinFileEpoch = int(os.path.getmtime(syncinFile))
		syncoutFileEpoch = int(os.path.getmtime(syncoutFile))

		# Compare current with modification time 
		syncinAge = (now - syncinFileEpoch) / 60
		syncoutAge = (now -syncoutFileEpoch) / 60

		# Update the log file
		logger.info("syncin last modified: " + str(time.ctime(os.path.getmtime(syncinFile))) + ", Age: " + str(syncinAge) + " minutes.")
		logger.info("syncout last modified: " + str(time.ctime(os.path.getmtime(syncoutFile))) + ", Age: " + str(syncoutAge) + " minutes.")

		# Return successful execution
		return 0

	except OSError:
		logger.critical("Cannot find the specified file(s)")

		# Return failed execution
		return 1

checkSyncinSyncout()
