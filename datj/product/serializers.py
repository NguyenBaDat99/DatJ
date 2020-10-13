from rest_framework import serializers
from .models import *


class GetAllProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ('name', 'category', 'manufacturers',)


class AddCategorySerializer(serializers.Serializer):
    name = serializers.CharField(max_length=50)
    description = serializers.CharField(max_length=200)
