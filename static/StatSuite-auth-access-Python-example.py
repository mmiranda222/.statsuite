import sys
import os
import argparse
import requests
from time import sleep
# By using this package, if you try to update the constant value, ConstantError will be raised
from pconst import const
 
 
# Declare constants
const.ERROR_MESSAGE = "An error occurred: "
const.EXECUTION_IN_PROGRESS = "InProgress"
 
 
# parameters:
#  url_digi_certificates: url of the SSL certificates
#  url_token: url of authentication service
#  user: user name for .Stat authentication
#  pwd: user name's password
#  client_id: the client id
#  client_secret: the client secret
def authenticate(url_digi_certificates, url_token, user, pwd, client_id, client_secret):
   try:
      Returned_Message = ""
      payload = {
           'grant_type': 'password',
           'client_id': client_id,
           'client_secret': client_secret,
           'username': user,
           'password': pwd
           }
 
      proxies = {
        "http": url_digi_certificates,
        "https": url_digi_certificates
      }
 
      response = requests.post(url_token, verify=True, proxies=proxies,
                     headers={"Content-Type": "application/x-www-form-urlencoded"},
                     data=payload
                     )
 
   except Exception as err:
      Returned_Message = const.ERROR_MESSAGE + str(err)
   else:
      if response.status_code != 200:
         Returned_Message = const.ERROR_MESSAGE + 'Error code: ' + str(response.status_code) + ' Reason: ' + str(response.reason)
         if len(response.text) > 0:
            Returned_Message = Returned_Message + os.linesep + 'Text: ' + response.text
      else:
         Returned_Message = response.json()['access_token']
 
   return Returned_Message
 
 
# parameters:
#  url_transfer: url of transfer service
#  file: SDMX-CSV file name
#  space: data space where the file is uploaded
#  token: token received from the authenticate function
def upload_csv_data(url_transfer, file, space, token):
   try:
      Returned_Message = ""
      headers = {
         'accept': 'application/json',
         'authorization': "Bearer "+token
         }
      payload = {
         "dataspace": space,
         }
      files = {
         'dataspace': (None, payload['dataspace']),
         'file': (file, open(file, 'rb'), 'text/csv', '')
         }
 
      response = requests.post(url_transfer, headers=headers, files=files)
 
   except Exception as err:
      Returned_Message = const.ERROR_MESSAGE + str(err)
   else:
      if response.status_code != 200:
         Returned_Message = const.ERROR_MESSAGE + 'Error code: ' + str(response.status_code) + ' Reason: ' + str(response.reason)
         if len(response.text) > 0:
            Returned_Message = Returned_Message + os.linesep + 'Text: ' + response.text
      else:
         try:
            Returned_Message = response.json()['message']
         except Exception as err:
            if len(response.text) > 0:
               Returned_Message = const.ERROR_MESSAGE + 'Text: ' + response.text
 
   return Returned_Message
 
 
# parameters:
#  url_transfer: url of transfer service
#  requestId: registration request Id
#  space: data space where the file is uploaded
#  token: token received from the authenticate function
# This is a recursive function to check the execution status
def check_request_status(url_transfer, requestId, space, token):
   try:
      Returned_Message = ""
      
      headers = {
         'accept': 'application/json',
         'authorization': "Bearer "+token
         }
 
      payload = {
         'dataspace': space,
         'id': requestId
         }
 
      url_transfer = url_transfer.replace("import", "status")
      url_transfer = url_transfer.replace("sdmxFile", "request")
 
      response = requests.post(url_transfer, headers=headers, data=payload)
  
   except Exception as err:
      Returned_Message = const.ERROR_MESSAGE + str(err)
   else:
      if response.status_code != 200:
         Returned_Message = const.ERROR_MESSAGE + 'Error code: ' + str(response.status_code) + ' Reason: ' + str(response.reason)
         if len(response.text) > 0:
            Returned_Message = Returned_Message + os.linesep + 'Text: ' + response.text
      else:
         executionStatus = 'Execution status: ' + response.json()['executionStatus']
         if executionStatus == const.EXECUTION_IN_PROGRESS:
            check_request_status(url, requestId, space, token)
         else:
            Returned_Message = executionStatus + os.linesep + 'Outcome: ' + response.json()['outcome']
            index = 0
            while index < len(response.json()['logs']):
               Returned_Message = Returned_Message + os.linesep + 'Log' + str(index) + ': ' + response.json()['logs'][index]['message']
               index += 1
 
   return Returned_Message
 
 
# 
def main():
   try:
      Returned_Message = ""
 
      parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
      
      # Authenticate arguments
      parser.add_argument('--url_digi_certificates', required=True, help="url of the SSL certificates")
      parser.add_argument('--url_token', required=True, help="url of authentication service")
      parser.add_argument('--user', required=True, help="user name for .Stat authentication")
      parser.add_argument('--pwd', required=True, help="user name's password")
      client_id="yourappid"
      client_secret="yoursecret"
 
      # Upload_csv_data arguments
      parser.add_argument('--url_transfer', required=True, help="url of transfer service")
      parser.add_argument('--sdmxcsv_path', required=True, help="The path of a single SDMX-CSV file or the path of the directory of the SDMX-CSV files")
      parser.add_argument('--space', required=True, help="data space where the file is uploaded")
      
      args = parser.parse_args(sys.argv[1:])
      url_digi_certificates = args.url_digi_certificates
      url_token = args.url_token
      user = args.user
      pwd = args.pwd
      url_transfer = args.url_transfer
      sdmxcsv_path = args.sdmxcsv_path
      space = args.space
 
      # Authentication
      Returned_Message = authenticate(url_digi_certificates, url_token, user, pwd, client_id, client_secret)
 
      # If we get the token: upload csv data
      if (Returned_Message != "" and Returned_Message.find(const.ERROR_MESSAGE ) == -1):
         token = Returned_Message
         
         Sdmxcsv_Path_List = []
         if os.path.isdir(sdmxcsv_path):  
            for sdmxcsv_filename in os.listdir(sdmxcsv_path):
               if os.path.isfile(sdmxcsv_path + '\\' + sdmxcsv_filename) and os.path.splitext(sdmxcsv_filename)[-1].lower() == ".csv":
                  Sdmxcsv_Path_List.append(sdmxcsv_path + '\\' + sdmxcsv_filename)
         elif os.path.isfile(sdmxcsv_path):  
            Sdmxcsv_Path_List.append(sdmxcsv_path)
 
         #
         if len(Sdmxcsv_Path_List) > 0:
            Returned_Message = ""
            for index in range(len(Sdmxcsv_Path_List)):
               sdmxcsv_path = Sdmxcsv_Path_List[index]
 
               Returned_Message = Returned_Message + os.linesep + str(index + 1) + ". UPLOADING: " + sdmxcsv_path
               Result = upload_csv_data(url_transfer, sdmxcsv_path, space, token)
               Returned_Message = Returned_Message + os.linesep + Result
 
               # Sleep a little bit before checking the request status
               sleep(5)
 
               # Check the request status
               if (Result != "" and Result.find(const.ERROR_MESSAGE ) == -1):
                  # Extract the request ID the returned message
                  start = 'with ID'
                  end = 'was successfully'
                  requestId = Result[Result.find(start)+len(start):Result.rfind(end)]
                  # This is a recursive function to check the execution status
                  Result = check_request_status(url_transfer, requestId, space, token)
                  Returned_Message = Returned_Message + os.linesep + Result
         else:
            Returned_Message = const.ERROR_MESSAGE + " No file to be loaded"
   except Exception as err:
      Returned_Message = const.ERROR_MESSAGE + str(err)
   finally:
      return Returned_Message
 
 
if __name__ == '__main__':
    sys.stdout.write(main())
