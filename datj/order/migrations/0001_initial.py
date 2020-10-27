# Generated by Django 3.1.2 on 2020-10-27 16:02

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('customer', '0001_initial'),
        ('product', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('total_price', models.FloatField(default=0)),
                ('customer', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='customer.customer')),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('shipped_date', models.DateTimeField(blank=True, null=True)),
                ('paid_date', models.DateTimeField(blank=True, null=True)),
                ('discount_code', models.CharField(blank=True, max_length=30, null=True)),
                ('total_discount', models.FloatField(default=0)),
                ('total_price', models.FloatField(default=0)),
                ('total_actual_price', models.FloatField(default=0)),
                ('order_date', models.DateTimeField(default=datetime.datetime(2020, 10, 27, 23, 2, 58, 237295))),
                ('stage', models.CharField(choices=[('Processing', 'Processing'), ('Shipping', 'Shipping'), ('Done', 'Done'), ('Cancel', 'Cancel')], default='Processing', max_length=20)),
                ('description', models.CharField(blank=True, max_length=300, null=True)),
                ('contact_tel', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='customer.telnumber')),
                ('customer', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='customer.customer')),
            ],
        ),
        migrations.CreateModel(
            name='PaymentService',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('active', models.BooleanField(default=True)),
            ],
        ),
        migrations.CreateModel(
            name='ShipService',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('active', models.BooleanField(default=True)),
            ],
        ),
        migrations.CreateModel(
            name='OrderDetail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField(default=1)),
                ('discount_code', models.CharField(max_length=30)),
                ('unit_price', models.FloatField(default=0)),
                ('discount_amount', models.FloatField(default=0)),
                ('unit_actual_price', models.FloatField(default=0)),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='order.order')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='product.product')),
            ],
        ),
        migrations.AddField(
            model_name='order',
            name='payment_type',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='order.paymentservice'),
        ),
        migrations.AddField(
            model_name='order',
            name='ship_by',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='order.shipservice'),
        ),
        migrations.AddField(
            model_name='order',
            name='ship_to',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='customer.shipaddress'),
        ),
        migrations.CreateModel(
            name='CartItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField(default=1)),
                ('unit_price', models.FloatField(default=0)),
                ('cart', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='order.cart')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='product.product')),
            ],
        ),
    ]
