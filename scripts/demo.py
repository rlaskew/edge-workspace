#!/usr/bin/python3

# TODO: above needs updating
# Python program to calculate RTT
 
import time
import requests
import json
#!/usr/bin/python3

# TODO: above needs updating
# Python program to calculate RTT
 
import time
import requests
import json
 
# Function to calculate the RTT
def RTT(url):
    # payload
    payload = {
              "key1": "value1"
            }

    # headers
    headers = {
            'key1':"Value1"
            }
    # time when the signal is sent
    t1 = time.time()

    #r = requests.get(url)
    r = requests.post(url,data=payload,headers=headers)
 
    # time when acknowledgement of signal
    # is received
    t2 = time.time()
 
    # total time taken
    tim = str(t2-t1)
 
    print("Time in seconds :" + tim)
    print("Response:" + r.text)
    time.sleep(1) 
    data = json.loads(r.text)
    print(data["form"]["key1"])
# driver program
# url address
#url = "http://www.google.com"
url = "https://httpbin.org/anything/helloworld"
RTT(url)
