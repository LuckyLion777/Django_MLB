# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2018-06-05 01:12
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_auto_20180528_2022'),
    ]

    operations = [
        migrations.AddField(
            model_name='customerprofile',
            name='logo2_large',
            field=models.ImageField(blank=True, upload_to=b'customer_assets'),
        ),
        migrations.AddField(
            model_name='customerprofile',
            name='logo2_small',
            field=models.ImageField(blank=True, upload_to=b'customer_assets'),
        ),
    ]
