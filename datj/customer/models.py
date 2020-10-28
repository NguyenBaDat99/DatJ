from enum import Enum

from django.db import models

from datetime import datetime


class Gender(models.TextChoices):
    MALE = 1
    FEMALE = 2
    OTHER = 3

class Customer(models.Model):
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=255)
    name = models.CharField(max_length=50)
    email = models.CharField(max_length=100, null=True, blank=True)
    gender = models.CharField(max_length=10, choices=Gender.choices, null=True, blank=True)
    date_of_birth = models.DateField(null=True, blank=True)

    def __str__(self):
        return self.username


class TelNumber(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    tel_number = models.CharField(max_length=20)
    number_type = models.CharField(max_length=30)

    def __str__(self):
        return self.tel_number


class ShipAddress(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    apartment_number = models.CharField(max_length=50)
    street = models.CharField(max_length=50)
    ward = models.CharField(max_length=50)
    district = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    description = models.CharField(max_length=300, null=True, blank=True)

    def __str__(self):
        return self.apartment_number + " " + self.street + " " + self.ward + " " + self.district + " " + self.city


class Token(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
    key = models.CharField(max_length=255, unique=True)
    created = models.DateTimeField(default=datetime.now())

    def __str__(self):
        return self.key
