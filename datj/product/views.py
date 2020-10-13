from django.shortcuts import render
from django.http import HttpResponse

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from .models import *
from .serializers import *


def index(request):
    return HttpResponse("Welcome to product site.")


class GetAllProductAPIView(APIView):

    def post(self, request):
        list_product = Product.objects.all()
        mydata = GetAllProductSerializer(list_product, many=True)
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
