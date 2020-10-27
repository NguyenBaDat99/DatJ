from rest_framework import serializers
from .models import *


class GetCartItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = CartItem
        fields = ('pk', 'cart', 'product', 'quantity', 'unit_price',)


class GetOrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ('pk', 'customer', 'payment_type', 'ship_by', 'ship_to', 'contact_tel', 'shipped_date', 'paid_date', 'discount_code',
                  'total_discount', 'total_price', 'total_actual_price', 'order_date', 'stage', 'description')


class GetOrderDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderDetail
        fields = ('pk', 'order', 'product', 'quantity', 'discount_code',
                  'unit_price', 'discount_amount', 'unit_actual_price',)


class KeywordCartItemSerializer(serializers.Serializer):
    product = serializers.IntegerField(default=0)
    quantity = serializers.IntegerField(default=1)


class AddCustomerOrderSerializer(serializers.Serializer):
    payment_type = serializers.IntegerField(default=0)
    ship_by = serializers.IntegerField(default=0)
    ship_to = serializers.IntegerField(default=0)
    contact_tel = serializers.IntegerField(default=0)
    discount_code = serializers.CharField(max_length=30, allow_null=True, allow_blank=True)
    description = serializers.CharField(max_length=300)
