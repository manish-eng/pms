from django.urls import path
from pms.views import (
    script,
    dg_file,
)

urlpatterns= [
    
    path('script/',view=script, name='script'),
    path('dg_file/',view=dg_file, name='dg_file'),
]
