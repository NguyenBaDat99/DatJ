from django.http import HttpResponse

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from .models import *
from .serializers import *


def index(request):
    return HttpResponse("Welcome to product site.")


class GetProductAPIView(APIView):

    def get(self, request):
        list_product = Product.objects.all()
        mydata = GetProductSerializer(list_product, many=True)
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
        elif product != 0:
            list_product_attribute_value = list_product_attribute_value.filter(product=product)
        elif product_attribute != 0:
            list_product_attribute_value = list_product_attribute_value.filter(product_attribute=product_attribute)
        else:
            list_product_attribute_value = list_product_attribute_value.filter(value__icontains=value)

        mydata = GetProAttributeValueSerializer(list_product_attribute_value, many=True)
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
        list_manufacturers = Manufacturers.objects.all()

        mydata = GetCategorySerializer(list_manufacturers, many=True)
        return Response(data=mydata.data, status=status.HTTP_200_OK)

    def post(self, request):
        mydata = KeywordSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        pk = mydata.data['pk']
        keyword = mydata.data['keyword']
        list_manufacturers = Manufacturers.objects.all()

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
        elif product != 0:
            list_product_attribute_value = list_product_attribute_value.filter(product=product)
        elif product_attribute != 0:
            list_product_attribute_value = list_product_attribute_value.filter(product_attribute=product_attribute)
        else:
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
            list_product_attribute_value = list_discount.filter(pk=pk)
        elif code != "":
            list_product_attribute_value = list_discount.filter(code__icontains=code)
        elif on_bill != 0:
            list_product_attribute_value = list_discount.filter(on_bill=on_bill)
        else:
            list_product_attribute_value = list_discount.filter(active=active)

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
        elif discount != "":
            list_discount_item = list_discount_item.filter(discount__icontains=discount)
        else:
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
