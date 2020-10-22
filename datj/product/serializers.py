from rest_framework import serializers
from .models import *


class GetCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('pk', 'name', 'description', 'category_belong',)


class GetManufacturersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Manufacturer
        fields = ('pk', 'name', 'description',)


class GetProAttributeSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductAttribute
        fields = ('pk', 'name', 'description',)


class GetProAttributeValueSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductAttributeValue
        fields = ('pk', 'product', 'product_attribute', 'value',)


class GetDiscountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount
        fields = ('pk', 'code', 'discount_percent', 'on_bill',
                  'active', 'apply_date', 'end_date',)


class GetDiscountItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount
        fields = ('pk', 'discount', 'product',)


class GetProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ('pk', 'category', 'manufacturer',
                  'price', 'unit_in_stock', 'unit_in_order', 'active', 'description',)


class AddCategorySerializer(serializers.Serializer):
    name = serializers.CharField(max_length=50)
    description = serializers.CharField(max_length=200)


class KeywordSerializer(serializers.Serializer):
    pk = serializers.IntegerField(default=0)
    keyword = serializers.CharField(max_length=100)


class KeywordAttributeValueSerializer(serializers.Serializer):
    pk = serializers.IntegerField(default=0)
    product = serializers.IntegerField(default=0)
    product_attribute = serializers.IntegerField(default=0)
    value = serializers.CharField(max_length=100, default="null")


class KeywordDiscountSerializer(serializers.Serializer):
    pk = serializers.IntegerField(default=0)
    code = serializers.CharField(max_length=30, default="null")
    on_bill = serializers.BooleanField(default=0)
    active = serializers.BooleanField(default=0)


class KeywordDiscountItemSerializer(serializers.Serializer):
    pk = serializers.IntegerField(default=0)
    discount = serializers.CharField(max_length=30, default="null")
    product = serializers.IntegerField(default=0)


class KeywordProductSerializer(serializers.Serializer):
    pk = serializers.IntegerField(default=0)
    category = serializers.IntegerField(default=0)
    manufacturer = serializers.IntegerField(default=0)
    name = serializers.CharField(max_length=50, default="null")
    from_price = serializers.FloatField(default=0)
    to_price = serializers.FloatField(default=0)
    from_in_stock = serializers.IntegerField(default=0)
    to_in_stock = serializers.IntegerField(default=0)
    from_in_order = serializers.IntegerField(default=0)
    to_in_order = serializers.IntegerField(default=0)
