from django.shortcuts import render 
import subprocess, os,sys 
from django.core.validators import validate_ipv46_address
from .forms import PostForm
from django.http import HttpResponse

def inputip(request):
  var=subprocess.check_output("grep '^PMS_SERVER=' /var/lib/digivalet/digivalet-config/dgjava | cut -d '=' -f 2- ",shell=True)
  var=var.decode('utf-8')
  form = PostForm() 
  return render(request, 'pms/index.html',{'form':form,'var':var})

def dg_file(request):
    f = open('/var/lib/digivalet/digivalet-config/dgjava', 'r')
    file_content2 = f.read()
    f.close()
    return HttpResponse(file_content2, content_type="text/plain", )

def script(request):
  if request.method == 'POST':
    form = PostForm(request.POST)
    if form.is_valid():
      PmsServerIp = form.cleaned_data['your_IP']
      var=subprocess.check_output("grep '^PMS_SERVER=' /var/lib/digivalet/digivalet-config/dgjava | cut -d '=' -f 2- ",shell=True)
      var=var.decode('utf-8')
      try:
        validate_ipv46_address(PmsServerIp)
      except Exception as ex:
        errmsg="Please Enter Valid IP"
        form = PostForm() 
        return render(request, 'pms/index.html',{'form':form,'errmsg':errmsg})
      cmd="sed -i 's/PMS_SERVER=.*/PMS_SERVER="+PmsServerIp+"/' /var/lib/digivalet/digivalet-config/dgjava"
      response = os.system(cmd)
      if response == 0:
        print("inside block")
        output = subprocess.check_output("systemctl stop digivalet-pmsi",shell = True)
        output = subprocess.check_output("systemctl start digivalet-pmsi",shell = True)
        msg="IP changed Successfully and Services Restarted"
        return render(request, 'pms/index.html',{'form':form, 'msg':msg, 'var':var})
      else:
        return render(request,'pms/error2.html')
    else:
      form = PostForm()
      errmsg="Please Enter Valid IP"
      return render(request, 'pms/index.html', {'errmsg':errmsg, 'form':form}) 
  else:
    form = PostForm()
    return render(request, 'pms/index.html', {'form':form}) 
 
  
