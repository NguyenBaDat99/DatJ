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
                # mydata = GetCustomerSerializer(list_customer.filter(username=username), many=True)
                customer = list_customer.filter(username=username).first()
                token = Token.objects.filter(customer=customer).first()
                key = hashlib.sha256((customer.username + str(datetime.now())).encode("utf-8")).hexdigest()
                if token is None:
                    token = Token.objects.create(key=key, created=datetime.now(), customer=customer)
                else:
                    Token.objects.filter(pk=token.pk).update(key=key, created=datetime.now())
                    token = Token.objects.filter(pk=token.pk).first()

                return Response({
                    'username': customer.username,
                    'email': customer.email,
                    'token': token.key
                }, status=status.HTTP_200_OK)
            else:
                return Response('Wrong password!', status=status.HTTP_400_BAD_REQUEST)

        else:
            return Response('Username not exists!', status=status.HTTP_400_BAD_REQUEST)


class AddAddressAPIView(APIView):

    def post(self, request):
        try:
            token = request.data['token']
        except:
            return Response({
                "detail": "Token not found"
            }, status=status.HTTP_203_NON_AUTHORITATIVE_INFORMATION)
        token = Token.objects.filter(key=token).first()
        if token is None:
            return Response({
                "detail": "Invalid token"
            }, status=status.HTTP_401_UNAUTHORIZED)

        data = AddAddressSerializer(data=request.data)
        if not data.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        address = ShipAddress.objects.create(apartment_number=data.data['apartment_number'],
                                             street=data.data['street'],
                                             ward=data.data['ward'],
                                             district=data.data['district'],
                                             city=data.data['city'],
                                             description=data.data['description'],
                                             customer=customer)
        return Response({
            "detail": "Add new ship address successful"
        }, status=status.HTTP_200_OK)


