from django.urls import path
from filetransfer.views import (
    file_transfer_view,
    file_transfer,
)

urlpatterns= [
    
    path('file_transfer_view/',view=file_transfer_view, name='file_transfer_view'),
    path('file_transfer/',view=file_transfer, name='file_transfer'),

]
