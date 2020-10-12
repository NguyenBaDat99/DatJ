from django.db import models

from datetime import datetime


class Category(models.Model):
    category_belong = models.ForeignKey('self', null=True, blank=True, on_delete=models.SET_NULL)
    name = models.CharField(max_length=50)
    description = models.CharField(default=None, blank=True, null=True, max_length=300)

    def __str__(self):
        return self.name


class Manufacturers(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(default=None, blank=True, null=True, max_length=300)

    def __str__(self):
        return self.name


class Product(models.Model):
    category = models.ForeignKey(Category, null=True, blank=True, on_delete=models.SET_NULL)
    manufacturers = models.ForeignKey(Manufacturers, null=True, blank=True, on_delete=models.SET_NULL)
    name = models.CharField(max_length=50)
    price = models.FloatField(blank=True, null=True, default=0)
    unit_in_stock = models.IntegerField(blank=True, null=True, default=0)
    unit_in_order = models.IntegerField(blank=True, null=True, default=0)
    active = models.BooleanField(default=True)
    description = models.CharField(default=None, blank=True, null=True, max_length=300)

    def __str__(self):
        return self.name


class ProductAttribute(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(default=None, blank=True, null=True, max_length=300)

    def __str__(self):
        return self.name


class ProductAttributeValue(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    product_attribute = models.ForeignKey(ProductAttribute, on_delete=models.PROTECT)
    value = models.CharField(max_length=200)

    def __str__(self):
        return self.value


class Discount(models.Model):
    code = models.CharField(max_length=30)
    discount_percent = models.FloatField(default=0)
    on_bill = models.BooleanField(default=False)
    active = models.BooleanField(default=True)
    apply_date = models.DateTimeField(default=datetime.now())
    end_date = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return self.code


class DiscountItem(models.Model):
    discount = models.ForeignKey(Discount, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)




