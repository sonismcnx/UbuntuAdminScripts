import os, time

def checkSyncinSyncout():
	try:
		syncinFile = '/tmp/test.txt'
		syncoutFile = '/tmp/test.txt'
		now = int(time.time())
		strNow = time.strftime('%Y-%m-%d %H:%M.%S', time.localtime(now))
		syncinFileEpoch = int(os.path.getmtime(syncinFile))
		syncoutFileEpoch = int(os.path.getmtime(syncoutFile))
		syncinAge = (now - syncinFileEpoch) / 60
		syncoutAge = (now -syncoutFileEpoch) / 60

		print 'Current Time: ' + strNow
		print "syncin last modified: " + str(time.ctime(os.path.getmtime(syncinFile))) + ", Age: " + str(syncinAge) + " minutes." 
		print "syncout last modified: " + str(time.ctime(os.path.getmtime(syncoutFile))) + ", Age: " + str(syncoutAge) + " minutes."
		return 0
	except OSError:
		print "Cannot find the specified file(s)"
		return 1

checkSyncinSyncout()
