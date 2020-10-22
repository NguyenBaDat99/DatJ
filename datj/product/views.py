from django.http import HttpResponse

from rest_framework.authentication import SessionAuthentication, BasicAuthentication, TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from .models import *
from .serializers import *


def index(request):
    return HttpResponse("Welcome to product site.")


class GetProductAPIView(APIView):
    authentication_classes = [SessionAuthentication, BasicAuthentication, TokenAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        list_product = Product.objects.all()
        mydata = GetProductSerializer(list_product, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)

    def post(self, request):
        mydata = KeywordProductSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        pk = mydata.data['pk']
        category = mydata.data['category']
        manufacturer = mydata.data['manufacturer']
        name = mydata.data['name']
        from_price = mydata.data['from_price']
        to_price = mydata.data['to_price']
        from_in_stock = mydata.data['from_in_stock']
        to_in_stock = mydata.data['to_in_stock']
        from_in_order = mydata.data['from_in_order']
        to_in_order = mydata.data['to_in_order']
        list_product = Product.objects.all()
        list_product = list_product.filter(active=True)

        if pk != 0:
            list_product = list_product.filter(pk=pk)
        else:
            if category != 0:
                list_product = list_product.filter(category=category)
            if manufacturer != 0:
                list_product = list_product.filter(manufacturer=manufacturer)
            if name != "null":
                list_product = list_product.filter(name=name)
            if from_price != 0:
                list_product = list_product.filter(price__gt=from_price - 1)
            if to_price != 0:
                list_product = list_product.filter(price__lt=to_price + 1)
            if from_in_stock != 0:
                list_product = list_product.filter(unit_in_stock__gt=from_in_stock - 1)
            if to_in_stock != 0:
                list_product = list_product.filter(unit_in_stock__lt=to_in_stock + 1)
            if from_in_order != 0:
                list_product = list_product.filter(unit_in_order__gt=from_in_order - 1)
            if to_in_order != 0:
                list_product = list_product.filter(unit_in_order__lt=to_in_order + 1)

        mydata = GetProductSerializer(list_product, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)


class GetCategoryAPIView(APIView):

    def get(self, request):
        list_category = Category.objects.all()
        mydata = GetCategorySerializer(list_category, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)

    def post(self, request):
        mydata = KeywordSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        pk = mydata.data['pk']
        keyword = mydata.data['keyword']
        list_category = Category.objects.all()

        if pk != 0:
            list_category = list_category.filter(pk=pk)
        else:
            list_category = list_category.filter(name__icontains=keyword)

        mydata = GetCategorySerializer(list_category, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)


class GetManufacturersAPIView(APIView):

    def get(self, request):
        list_manufacturers = Manufacturer.objects.all()

        mydata = GetCategorySerializer(list_manufacturers, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)

    def post(self, request):
        mydata = KeywordSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        pk = mydata.data['pk']
        keyword = mydata.data['keyword']
        list_manufacturers = Manufacturer.objects.all()

        if pk != 0:
            list_manufacturers = list_manufacturers.filter(pk=pk)
        else:
            list_manufacturers = list_manufacturers.filter(name__icontains=keyword)

        mydata = GetManufacturersSerializer(list_manufacturers, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)


class GetProAttributeAPIView(APIView):

    def get(self, request):
        list_product_attribute = ProductAttribute.objects.all()

        mydata = GetProAttributeSerializer(list_product_attribute, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)

    def post(self, request):
        mydata = KeywordSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        pk = mydata.data['pk']
        keyword = mydata.data['keyword']
        list_product_attribute = ProductAttribute.objects.all()

        if pk != 0:
            list_product_attribute = list_product_attribute.filter(pk=pk)
        else:
            list_product_attribute = list_product_attribute.filter(name__icontains=keyword)

        mydata = GetManufacturersSerializer(list_product_attribute, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)


class GetProAttributeValueAPIView(APIView):

    def get(self, request):
        list_product_attribute_value = ProductAttributeValue.objects.all()

        mydata = GetProAttributeValueSerializer(list_product_attribute_value, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)

    def post(self, request):
        mydata = KeywordAttributeValueSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        pk = mydata.data['pk']
        product = mydata.data['product']
        product_attribute = mydata.data['product_attribute']
        value = mydata.data['value']
        list_product_attribute_value = ProductAttributeValue.objects.all()

        if pk != 0:
            list_product_attribute_value = list_product_attribute_value.filter(pk=pk)
        else:
            if product != 0:
                list_product_attribute_value = list_product_attribute_value.filter(product=product)
            if product_attribute != 0:
                list_product_attribute_value = list_product_attribute_value.filter(product_attribute=product_attribute)
            if value != "null":
                list_product_attribute_value = list_product_attribute_value.filter(value__icontains=value)

        mydata = GetProAttributeValueSerializer(list_product_attribute_value, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)


class GetDiscountAPIView(APIView):

    def get(self, request):
        list_discount = Discount.objects.all()

        mydata = GetDiscountSerializer(list_discount, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)

    def post(self, request):
        mydata = KeywordAttributeValueSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        pk = mydata.data['pk']
        code = mydata.data['code']
        on_bill = mydata.data['on_bill']
        active = mydata.data['active']
        list_discount = Discount.objects.all()

        if pk != 0:
            list_discount = list_discount.filter(pk=pk)
        else:
            if code != "null":
                list_discount = list_discount.filter(code__icontains=code)
            if on_bill != 0:
                list_discount = list_discount.filter(on_bill=on_bill)
            if active != 0:
                list_discount = list_discount.filter(active=active)

        mydata = GetProAttributeValueSerializer(list_discount, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)


class GetDiscountItemAPIView(APIView):

    def get(self, request):
        list_discount_item = DiscountItem.objects.all()

        mydata = GetDiscountItemSerializer(list_discount_item, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)

    def post(self, request):
        mydata = KeywordDiscountItemSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        pk = mydata.data['pk']
        discount = mydata.data['discount']
        product = mydata.data['product']
        list_discount_item = DiscountItem.objects.all()

        if pk != 0:
            list_discount_item = list_discount_item.filter(pk=pk)
        else:
            if discount != "null":
                list_discount_item = list_discount_item.filter(discount__icontains=discount)
            if product != 0:
                list_discount_item = list_discount_item.filter(product=product)

        mydata = GetProAttributeValueSerializer(list_discount_item, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)


class AddCategoryAPIView(APIView):

    def post(self, request):
        mydata = AddCategorySerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)
        name = mydata.data['name']
        description = mydata.data['description']
        cate = Category.objects.create(name=name, description=description)
        return Response(data=cate.id, status=status.HTTP_200_OK)

# Create your views here.
