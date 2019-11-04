from django.shortcuts import render
from .forms import SelectForm
import subprocess
def file_transfer_view(request):
    form = SelectForm()
    return render (request, 'filetransfer/file_transfer_view.html',{'form':form})

def file_transfer(request):
    if request.method == 'POST':
        form = SelectForm(request.POST)
        if form.is_valid():
            local_username = form.cleaned_data['local_username']
            local_password = form.cleaned_data['local_password']
            folder = form.cleaned_data['folder']
            local_system_IP = form.cleaned_data['local_system_IP']
            subprocess.call(['bash', '/var/lib/digivalet/digivalet-config/pms/file_process.sh', str(folder), str(local_username), str(local_password), str(local_system_IP)])
            message="Folder is stored in your local System in tar form "
            return render (request, 'filetransfer/file_transfer_view.html',{'form':form, 'message':message})
        else:
            form = SelectForm()
            return render (request, 'filetransfer/file_transfer_view.html',{'form':form})
