from django import forms

class PostForm(forms.Form):
  your_IP = forms.GenericIPAddressField(widget=forms.TextInput(attrs={

                'style': 'border-color: skyblue;',
                'placeholder': 'Write your IP here'
            }
  )
  )