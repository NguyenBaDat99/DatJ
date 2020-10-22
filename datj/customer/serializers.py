from rest_framework import serializers
from .models import *


class SignUpCustomerSerializer(serializers.Serializer):
    username = serializers.CharField(max_length=50)
    password = serializers.CharField(max_length=50)
    name = serializers.CharField(max_length=50)
    email = serializers.CharField(max_length=100)
    gender = serializers.CharField(max_length=10)
    date_of_birth = serializers.CharField(max_length=50)
    tel_number = serializers.CharField(max_length=20)
    number_type = serializers.CharField(max_length=30)


class SignInCustomerSerializer(serializers.Serializer):
    username = serializers.CharField(max_length=50)
    password = serializers.CharField(max_length=50)


class GetCustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Customer
        fields = ('pk', 'username', 'name', 'email', 'gender', 'date_of_birth',)
