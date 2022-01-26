#!/usr/bin/python3

# TODO: above needs updating
# Python program to calculate RTT
 
import time
import requests
 
# Function to calculate the RTT
def RTT(url):
 
    # time when the signal is sent
    t1 = time.time()
 
    r = requests.get(url)
 
    # time when acknowledgement of signal
    # is received
    t2 = time.time()
 
    # total time taken
    tim = str(t2-t1)
 
    print("Time in seconds :" + tim)
    time.sleep(1) 
# driver program
# url address
#url = "http://www.google.com"
url = "https://httpbin.org/anything/helloworld"
RTT(url)
