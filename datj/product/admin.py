from re import search

from django.contrib import admin
from .models import *


class CategoryAdmin(admin.ModelAdmin):
    list_per_page = 12
    search_fields = ('name',)
    list_filter = ('category_belong',)


class ManufacturerAdmin(admin.ModelAdmin):
    list_per_page = 12
    search_fields = ('name',)


class ProductAttributeValueInline(admin.TabularInline):
    model = ProductAttributeValue
    extra = 2


class ProductAdmin(admin.ModelAdmin):
    inlines = [ProductAttributeValueInline]
    list_per_page = 12
    search_fields = ('name',)
    list_filter = ('category', 'manufacturer', 'active',)


class ProductAttributeAdmin(admin.ModelAdmin):
    list_per_page = 12
    search_fields = ('name',)


class ProductAttributeValueAdmin(admin.ModelAdmin):
    list_per_page = 12
    search_fields = ('value',)
    list_filter = ('product_attribute', 'product',)


class DiscountItemInline(admin.TabularInline):
    model = DiscountItem
    extra = 3


class DiscountAdmin(admin.ModelAdmin):
    inlines = [DiscountItemInline]
    list_per_page = 12
    search_fields = ('code',)
    list_filter = ('on_bill', 'active', 'apply_date', 'end_date',)


class DiscountItemAdmin(admin.ModelAdmin):
    list_per_page = 12


admin.site.register(Category, CategoryAdmin)
admin.site.register(Manufacturer, ManufacturerAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(ProductAttribute, ProductAttributeAdmin)
admin.site.register(ProductAttributeValue, ProductAttributeValueAdmin)
admin.site.register(Discount, DiscountAdmin)
admin.site.register(DiscountItem, DiscountItemAdmin)
# Register your models here.
