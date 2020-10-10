from django.contrib import admin
from .models import *

admin.site.register(PaymentService)
admin.site.register(ShipService)
admin.site.register(Order)
admin.site.register(OrderDetail)

# Register your models here.
