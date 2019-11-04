from django.shortcuts import render
import subprocess
import os
from django.http import HttpResponse

def server_verify(request):
    os.system("sh /var/lib/digivalet/digivalet-config/pms/Server_verification.sh")
    os.system("cat server_verify.txt? >> server_verify.txt")
    os.system("cp server_verify.txt? server_verify.txt")
    f = open('/var/lib/digivalet/digivalet-config/pms/server_verify.txt', 'r')
    file_content2 = f.read()
    f.close()
    os.system("rm server_verify.txt? server_verify.txt")
    return HttpResponse(file_content2, content_type="text/plain", )
