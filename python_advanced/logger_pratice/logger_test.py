import logging

# logging.warning('watching out!') # will print a message to the console
# logging.info('I told you so') # will not print

# logging.basicConfig(filename='example.log',level=logging.DEBUG))
# logging.debug('This message should go to the log file')
# logging.info('So should this')
# logging.warning('And this, too')
# logging.error('And non-ASCII stuff, too, like Øresund and Malmö')

# logging.basicConfig(filename='example.log', filemode='w', level=logging.DEBUG)

logging.basicConfig(format='%(asctime)s %(message)s',datefmt='%m/%d/%Y %I:%M:%S %p')
logging.warning('is when this event was logged.')