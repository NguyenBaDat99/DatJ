# Generated by Django 3.1.2 on 2020-10-25 16:08

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0011_auto_20201025_1434'),
    ]

    operations = [
        migrations.AlterField(
            model_name='discount',
            name='apply_date',
            field=models.DateTimeField(default=datetime.datetime(2020, 10, 25, 23, 8, 23, 573682)),
        ),
        migrations.AlterField(
            model_name='discount',
            name='code',
            field=models.CharField(max_length=30, unique=True),
        ),
    ]
