from django.urls import path
from django.views.generic import TemplateView
from changeconfig.views import (
    diff_show,
    changedash,
    app_file,
    replace,
    no,

)

urlpatterns= [
    path('changedash/',view=changedash, name='changedash'),
    path('diff_show/',view=diff_show, name='diff_show'),
    path('app_file/',view=app_file, name='app_file'),
    path('replace/',view=replace, name='replace'),
    path('no/',view=no, name='no'),


 ]
