from django.contrib import admin
from .models import *


class OrderAdmin(admin.ModelAdmin):
    delete_confirmation_template = False;
    delete_selected_confirmation_template = False;


admin.site.register(PaymentService)
admin.site.register(ShipService)
admin.site.register(Order, OrderAdmin)
admin.site.register(OrderDetail)

# Register your models here.
