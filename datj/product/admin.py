from django.contrib import admin
from .models import *


class ProductAttributeValueInline(admin.TabularInline):
    model = ProductAttributeValue
    extra = 2


class ProductAdmin(admin.ModelAdmin):
    inlines = [ProductAttributeValueInline]


class DiscountItemInline(admin.TabularInline):
    model = DiscountItem
    extra = 3


class DiscountAdmin(admin.ModelAdmin):
    inlines = [DiscountItemInline]


admin.site.register(Category)
admin.site.register(Manufacturer)
admin.site.register(Product, ProductAdmin)
admin.site.register(ProductAttribute)
admin.site.register(ProductAttributeValue)
admin.site.register(Discount, DiscountAdmin)
admin.site.register(DiscountItem)
# Register your models here.
