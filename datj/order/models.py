from enum import Enum

from django.db import models

from datetime import datetime

from customer.models import Customer, ShipAddress
from product.models import Product


class PaymentService(models.Model):
    name = models.CharField(max_length=50)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.name


class ShipService(models.Model):
    name = models.CharField(max_length=50)
    active = models.BooleanField(default=True)

    def __str__(self):
        return self.name


class Order(models.Model):
    customer = models.ForeignKey(Customer, null=True, blank=True, on_delete=models.SET_NULL)
    ship_by = models.ForeignKey(ShipService, null=True, blank=True, on_delete=models.SET_NULL)
    ship_to = models.ForeignKey(ShipAddress, null=True, blank=True, on_delete=models.SET_NULL)
    shipped_date = models.DateTimeField(null=True, blank=True)
    payment_type = models.ForeignKey(PaymentService, null=True, blank=True, on_delete=models.SET_NULL)
    paid_date = models.DateTimeField(null=True, blank=True)
    discount_code = models.CharField(max_length=30, null=True, blank=True)
    total_discount = models.FloatField(default=0)
    total_price = models.FloatField
    total_actual_price = models.FloatField
    order_date = models.DateTimeField(default=datetime.now())

    class OrderStage(models.TextChoices):
        Processing = 1
        Shipping = 2
        Done = 3
        Cancel = 4

    stage = models.CharField(max_length=20, choices=OrderStage.choices, default=OrderStage.Processing)
    description = models.CharField(max_length=300, null=True, blank=True)

    def __str__(self):
        return self.customer + "-Order-" + self.order_date


class OrderDetail(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.PROTECT)
    quantity = models.IntegerField(default=1)
    discount_code = models.CharField(max_length=30)
    unit_price = models.FloatField


class Cart(models.Model):
    customer = models.OneToOneField(Customer, on_delete=models.CASCADE, unique=True)
    total_price = models.FloatField(default=0)

    def __str__(self):
        return self.customer + "-Cart"


class CartItem(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.PROTECT)
    quantity = models.IntegerField(default=1)
    unit_price = models.FloatField








