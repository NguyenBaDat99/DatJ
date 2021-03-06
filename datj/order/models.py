from enum import Enum

from django.db import models

from datetime import datetime

from customer.models import Customer, ShipAddress, TelNumber
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


class OrderStage(models.TextChoices):
    Processing = "PROCESSING"
    Shipping = "SHIPPING"
    Done = "DONE"
    Cancel = "CANCEL"
    Return = "RETURN"


class Order(models.Model):
    customer = models.ForeignKey(Customer, null=True, blank=True, on_delete=models.SET_NULL)
    ship_by = models.ForeignKey(ShipService, null=True, blank=True, on_delete=models.SET_NULL)
    ship_to = models.ForeignKey(ShipAddress, null=True, blank=True, on_delete=models.SET_NULL)
    contact_tel = models.ForeignKey(TelNumber, null=True, blank=True, on_delete=models.SET_NULL)
    shipped_date = models.DateTimeField(null=True, blank=True)
    payment_type = models.ForeignKey(PaymentService, null=True, blank=True, on_delete=models.SET_NULL)
    paid_date = models.DateTimeField(null=True, blank=True)
    discount_code = models.CharField(max_length=30, null=True, blank=True)
    total_discount = models.FloatField(default=0)
    total_price = models.FloatField(default=0)
    total_actual_price = models.FloatField(default=0)
    order_date = models.DateTimeField(default=datetime.now())
    stage = models.CharField(max_length=20, choices=OrderStage.choices, default=OrderStage.Processing)
    description = models.CharField(max_length=300, null=True, blank=True)

    def __str__(self):
        return "Order-" + str(self.pk) + "-" + str(self.customer) + "-" + self.order_date.strftime("%m/%d/%Y, %H:%M:%S")


class OrderDetail(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.PROTECT)
    quantity = models.IntegerField(default=1)
    discount_code = models.CharField(max_length=30, null=True, blank=True)
    unit_price = models.FloatField(default=0)
    discount_amount = models.FloatField(default=0)
    unit_actual_price = models.FloatField(default=0)

    def __str__(self):
        return self.order.__str__() + ": " + self.product.__str__() \
               + " (SL: " + self.quantity.__str__() + " | Đơn giá: " + self.unit_actual_price.__str__() + ")"


class Cart(models.Model):
    customer = models.OneToOneField(Customer, on_delete=models.CASCADE, unique=True)
    total_price = models.FloatField(default=0)

    def __str__(self):
        return self.customer.username + "-Cart"


class CartItem(models.Model):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.PROTECT)
    quantity = models.IntegerField(default=1)
    unit_price = models.FloatField(default=0)

    def __str__(self):
        return self.pk
