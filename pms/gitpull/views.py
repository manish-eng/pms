from django.shortcuts import render
from .forms import GitPullForm
import subprocess
import os

def output(request):
    form = GitPullForm()
    return render(request,'gitpull/gitpull.html',{'form':form})

def dashboard(request):
    return render(request,'gitpull/dashboard.html')


def pullutility(request):
    if request.method == 'POST':
        form = GitPullForm(request.POST)
        if form.is_valid():
            GIT_USER = form.cleaned_data['username']
            GIT_PASSWORD = form.cleaned_data['password']
            try:
                os.chdir("/var/www/html/dv5/")
                #var=subprocess.check_output("grep '^url=' /var/www/html/dv5/.git/config | cut -d '/' -f 3- ",shell=True)
                var=subprocess.check_output("grep -i 'url = ' /var/www/html/dv5/.git/config | cut -d '/' -f 3-",shell=True)
                var=var.decode('utf-8')
                subprocess.check_output("git pull --progress http://"+GIT_USER+":"+GIT_PASSWORD+"@"+var+" >> /var/lib/digivalet/digivalet-config/pms/git_status.txt",shell=True) 
                #subprocess.check_output("git pull --progress http://"+GIT_USER+":"+GIT_PASSWORD+"@192.168.0.66:7990/scm/d5/uatblue-dv5.git &> /var/lib/digivalet/digivalet-config/pms/git_status.txt",shell=True) 
                f = open('/var/lib/digivalet/digivalet-config/pms/git_status.txt', 'r')
                file_content = f.read()
                f.close()
                return render(request,'gitpull/gitpull.html',{'file_content': file_content})
            except Exception as ex:
                msg="Sorry Wrong Credentials"
                return render(request,'gitpull/gitpull.html',{'msg':msg})
    else:
        form = GitPullForm()
    return render(request, 'gitpull/gitpull.html', {'form': form})

