# Generated by Django 3.1.2 on 2020-10-19 08:12

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0004_auto_20201013_2325'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='order_date',
            field=models.DateTimeField(default=datetime.datetime(2020, 10, 19, 15, 12, 18, 861254)),
        ),
    ]
