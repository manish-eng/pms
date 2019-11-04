from django.contrib import admin
from changeconfig.models import ChangeConfig

class ChangeConfigAdmin(admin.ModelAdmin):
    list_display=["username", "password", "site_fqdn", "hotel_id"]

admin.site.register(ChangeConfig,ChangeConfigAdmin)