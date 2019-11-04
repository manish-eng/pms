from django import forms
from .models import GitPull

class GitPullForm(forms.ModelForm):
    class Meta:
        model= GitPull
        widgets = {
        'password': forms.PasswordInput(attrs={

                'style': 'border-color: skyblue;',
            }),
        'username': forms.TextInput(attrs={

                'style': 'border-color: skyblue;',   
            }
  )
    }
        fields= ('__all__')







        forms.TextInput(attrs={

                'style': 'border-color: skyblue;',
                'placeholder': 'Write your IP here'
            }
  )