# Generated by Django 2.0.13 on 2019-10-07 05:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('changeconfig', '0003_changeconfig_site_fqdn'),
    ]

    operations = [
        migrations.AddField(
            model_name='changeconfig',
            name='currency',
            field=models.CharField(default='', max_length=6),
        ),
        migrations.AddField(
            model_name='changeconfig',
            name='hotel_code',
            field=models.CharField(default='', max_length=10),
        ),
        migrations.AddField(
            model_name='changeconfig',
            name='hotel_id',
            field=models.IntegerField(default=0),
        ),
    ]