from rest_framework import serializers
from .models import *


class GetCartItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = CartItem
        fields = ('pk', 'cart', 'product', 'quantity', 'unit_price',)


class GetOrderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ('pk', 'customer', 'ship_by', 'ship_to', 'shipped_date', 'payment_type', 'paid_date', 'discount_code',
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
    ship_by = serializers.IntegerField(default=0)
    ship_to = serializers.IntegerField(default=0)
    payment_type = serializers.IntegerField(default=0)
    discount_code = serializers.CharField(max_length=30)
    order_date = serializers.DateTimeField(default=datetime.now())
    description = serializers.CharField(max_length=300)
