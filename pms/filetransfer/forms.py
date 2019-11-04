from django import forms


FOLDER_NAMES= [
    ('pear', 'pear'),
    ('tpm','tpm'),
    ('stateless', 'stateless'),
    ('pms','pms')
]

class SelectForm(forms.Form):
    local_username = forms.CharField(max_length=15)
    local_system_IP = forms.GenericIPAddressField()
    local_password = forms.CharField(widget=forms.PasswordInput())
    folder = forms.CharField(label='Folder Name', widget=forms.Select(choices=FOLDER_NAMES))
