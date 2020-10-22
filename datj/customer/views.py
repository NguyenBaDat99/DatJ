import hashlib
from datetime import datetime

from django.http import HttpResponse

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.authtoken.models import Token

from .models import *
from .serializers import *

def index(request):
    return HttpResponse("Welcome to customer site.")


class SignUpCustomerAPIView(APIView):

    def post(self, request):
        mydata = SignUpCustomerSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        username = mydata.data['username']
        password = mydata.data['password']
        name = mydata.data['name']
        email = mydata.data['email']
        gender = mydata.data['gender']
        date_of_birth = mydata.data['date_of_birth']
        tel_number = mydata.data['tel_number']
        number_type = mydata.data['number_type']

        list_customer = Customer.objects.all()
        if list_customer.filter(username=username):
            return Response('Username already exists! Try another', status=status.HTTP_400_BAD_REQUEST)

        password = hashlib.sha256(password.strip().encode("utf-8")).hexdigest()
        date_of_birth = datetime.strptime(date_of_birth, '%d-%m-%Y')
        customer = Customer.objects.create(username=username, password=password, name=name, email=email,
                                           gender=gender, date_of_birth=date_of_birth)
        TelNumber.objects.create(customer=customer, tel_number=tel_number, number_type=number_type)
        return Response(data=customer.id, status=status.HTTP_200_OK)


class SignInCustomerAPIView(APIView):

    def post(self, request):
        mydata = SignInCustomerSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        username = mydata.data['username']
        password = mydata.data['password']
        password = hashlib.sha256(password.strip().encode("utf-8")).hexdigest()
        list_customer = Customer.objects.all()
        if list_customer.filter(username=username):
            if list_customer.filter(password=password):
                mydata = GetCustomerSerializer(list_customer.filter(username=username), many=True)

                # token = Token.objects.create(user=None)

                # token = Token.objects.create(=...)
                # print(token.key)

                return Response(data=mydata.data, status=status.HTTP_200_OK)
            else:
                return Response('Wrong password!', status=status.HTTP_400_BAD_REQUEST)

        else:
            return Response('Username not exists!', status=status.HTTP_400_BAD_REQUEST)

