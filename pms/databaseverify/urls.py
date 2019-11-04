from django.urls import path
from databaseverify.views import (
    db_verify,
)

urlpatterns= [
    
    path('db_verify/',view=db_verify, name='db_verify'),
]
