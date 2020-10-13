from django.contrib import admin
from .models import *


class ProductAttributeValueInline(admin.TabularInline):
    model = ProductAttributeValue
    extra = 2


class ProductAdmin(admin.ModelAdmin):
    inlines = [ProductAttributeValueInline]


admin.site.register(Category)
admin.site.register(Manufacturers)
admin.site.register(Product, ProductAdmin)
admin.site.register(ProductAttribute)
admin.site.register(ProductAttributeValue)
admin.site.register(Discount)
admin.site.register(DiscountItem)
# Register your models here.
