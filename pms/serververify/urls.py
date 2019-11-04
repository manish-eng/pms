from django.urls import path
from serververify.views import (
    server_verify,
)

urlpatterns= [
    
    path('server_verify/',view=server_verify, name='server_verify'),
]
