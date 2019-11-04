from django.shortcuts import render
from django.shortcuts import render
import subprocess
import os
from django.http import HttpResponse

def db_verify(request):
    os.system("sh /var/lib/digivalet/digivalet-config/pms/db_verification.sh")
    os.system("cat db_verification.txt? >> db_verification.txt")
    os.system("cp db_verification.txt? db_verification.txt")
    f = open('/var/lib/digivalet/digivalet-config/pms/db_verification.txt', 'r')
    file_content2 = f.read()
    f.close()
    os.system("rm db_verification.txt? db_verification.txt")
    return HttpResponse(file_content2, content_type="text/plain", )

