# Generated by Django 3.1.2 on 2020-11-02 11:13

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0004_auto_20201102_1612'),
    ]

    operations = [
        migrations.AlterField(
            model_name='discount',
            name='apply_date',
            field=models.DateTimeField(default=datetime.datetime(2020, 11, 2, 18, 13, 30, 511650)),
        ),
    ]
