from django.contrib import admin
from .models import *


class OrderAdmin(admin.ModelAdmin):
    list_per_page = 12
    list_filter = ('stage', 'order_date', 'shipped_date', 'paid_date', 'ship_by', 'payment_type',
                   'discount_code', 'customer',)


class OrderDetailAdmin(admin.ModelAdmin):
    list_per_page = 12


class PaymentServiceAdmin(admin.ModelAdmin):
    list_per_page = 12
    search_fields = ('name', )
    list_filter = ('active',)


class ShipServiceAdmin(admin.ModelAdmin):
    list_per_page = 12
    search_fields = ('name', )
    list_filter = ('active',)


admin.site.register(PaymentService, PaymentServiceAdmin)
admin.site.register(ShipService, ShipServiceAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(OrderDetail, OrderDetailAdmin)

# Register your models here.
