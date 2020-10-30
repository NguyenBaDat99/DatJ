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


class ChangeStageOrderSerializer(serializers.Serializer):
    order = serializers.IntegerField(default=0)


class GetCustomerOrderSerializer(serializers.Serializer):
    stage = serializers.CharField(max_length=20)

