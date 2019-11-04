from django.urls import path
from pms.views import (
    inputip,
)

from gitpull.views import (
    dashboard,
    output,
    pullutility,
   
)

urlpatterns= [
    path('', view=dashboard, name='dashboard'),
    path('output/', view=output, name='output'),
    path('pullutility/', view=pullutility, name='pullutility'),
    path('inputip/', view=inputip, name='inputip'),
]
