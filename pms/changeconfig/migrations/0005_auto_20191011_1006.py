# Generated by Django 2.0.13 on 2019-10-11 10:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('changeconfig', '0004_auto_20191007_0543'),
    ]

    operations = [
        migrations.AlterField(
            model_name='changeconfig',
            name='currency',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='changeconfig',
            name='hotel_id',
            field=models.CharField(default='', max_length=1),
        ),
    ]
