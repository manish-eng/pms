from django.db import models

class ChangeConfig(models.Model):
    username=models.CharField(max_length=30)
    password=models.CharField(max_length=50)
    hotel_id=models.CharField(max_length=1, default= '')
    site_fqdn=models.CharField(max_length=50, default='')
