from django.contrib import admin
from .models import *

admin.site.register(Category)
admin.site.register(Manufacturers)
admin.site.register(Product)
admin.site.register(ProductAttribute)
admin.site.register(ProductAttributeValue)
admin.site.register(Discount)
admin.site.register(DiscountItem)
# Register your models here.
