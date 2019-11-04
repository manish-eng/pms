from django import forms
from .models import ChangeConfig

class ChangeConfigForm(forms.ModelForm):
    class Meta:
        model= ChangeConfig
        widgets = {
        'password': forms.PasswordInput(attrs={

                'style': 'border-color: skyblue; width: 100%; ',
            }),
        'username': forms.TextInput(attrs={

                'style': 'border-color: skyblue; width: 100%;; ',   
            }),
        'hotel_id': forms.TextInput(attrs={

                'style': 'border-color: skyblue; width: 100%;; ',   
            }),
        'site_fqdn':forms.TextInput(attrs={

                'style': 'border-color: skyblue; width: 100%;; ',   
            })
    }
        fields= ('__all__')
