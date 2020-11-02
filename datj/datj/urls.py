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
from order.views import *
from rest_framework.authtoken import views

urlpatterns = [
    # path('product/', include('product.urls')),
    path('product/get/', GetProductAPIView.as_view()),
    path('product/category/get/', GetCategoryAPIView.as_view()),
    path('product/manufacturer/get/', GetManufacturerAPIView.as_view()),
    path('product/product-attribute/get/', GetProAttributeAPIView.as_view()),
    path('product/product-attribute-value/get/', GetProAttributeValueAPIView.as_view()),
    path('product/discount/get/', GetDiscountAPIView.as_view()),
    path('product/discount-item/get/', GetDiscountItemAPIView.as_view()),

    # path('order/', include('order.urls')),
    path('order/get-cart/', GetCartAPIView.as_view()),
    path('order/add-cart-item/', AddCartItemAPIView.as_view()),
    path('order/del-cart-item/', DelCartItemAPIView.as_view()),
    path('order/get-order/', GetCustomerOrderAPIView.as_view()),
    path('order/get-order-detail/', GetCustomerOrderDetailAPIView.as_view()),
    path('order/add-customer-order/', AddCustomerOrderAPIView.as_view()),
    path('order/cancel-customer-order/', CancelCustomerOrderAPIView.as_view()),
    path('order/return-customer-order/', ReturnCustomerOrderAPIView.as_view()),
    path('order/admin/ship-order/', AdminShipCustomerOrderAPIView.as_view()),
    path('order/admin/done-order/', AdminDoneCustomerOrderAPIView.as_view()),
    path('order/admin/cancel-order/', AdminCancelCustomerOrderAPIView.as_view()),

    # path('customer/', include('customer.urls')),
    path('customer/sign-up/', SignUpCustomerAPIView.as_view()),
    path('customer/sign-in/', SignInCustomerAPIView.as_view()),
    path('customer/sign-out/', SignOutCustomerAPIView.as_view()),
    path('customer/get-customer-info/', GetCustomerInfoAPIView.as_view()),
    path('customer/edit-customer/', EditCustomerAPIView.as_view()),
    path('customer/change-password-customer/', ChangePasswordCustomerAPIView.as_view()),
    path('customer/request-restore-password/', RequestRestorePasswordAPIView.as_view()),
    path('customer/change-password-otp/', ChangePasswordOTPAPIView.as_view()),
    path('customer/add-address/', AddAddressAPIView.as_view()),
    path('customer/edit-address/', EditAddressAPIView.as_view()),
    path('customer/del-address/', DelAddressAPIView.as_view()),
    path('customer/add-tel-number/', AddTelNumberAPIView.as_view()),
    path('customer/edit-tel-number/', EditTelNumberAPIView.as_view()),
    path('customer/del-tel-number/', DelTelNumberAPIView.as_view()),

    path('admin/', admin.site.urls),
    path('api-token-auth/', views.obtain_auth_token),
]
