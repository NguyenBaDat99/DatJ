# Generated by Django 3.1.2 on 2020-10-25 07:34

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0010_auto_20201024_2250'),
    ]

    operations = [
        migrations.AlterField(
            model_name='discount',
            name='apply_date',
            field=models.DateTimeField(default=datetime.datetime(2020, 10, 25, 14, 34, 58, 988962)),
        ),
    ]
