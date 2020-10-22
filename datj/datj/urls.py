"""datj URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from product.views import *
from customer.views import *
from rest_framework.authtoken import views

urlpatterns = [
    path('product/', include('product.urls')),
    path('product/get/', GetProductAPIView.as_view()),
    path('product/category/get/', GetCategoryAPIView.as_view()),
    path('product/manufacturers/get/', GetManufacturersAPIView.as_view()),
    path('product/product-attribute/get/', GetProAttributeAPIView.as_view()),
    path('product/product-attribute-value/get/', GetProAttributeValueAPIView.as_view()),
    path('product/discount/get/', GetDiscountAPIView.as_view()),
    path('product/discount-item/get/', GetDiscountItemAPIView.as_view()),
    # path('product/category/add/', AddCategoryAPIView.as_view()),
    path('order/', include('order.urls')),
    path('customer/', include('customer.urls')),
    path('customer/sign-up/', SignUpCustomerAPIView.as_view()),
    path('customer/sign-in/', SignInCustomerAPIView.as_view()),
    path('admin/', admin.site.urls),
    path('api-token-auth/', views.obtain_auth_token),
]
