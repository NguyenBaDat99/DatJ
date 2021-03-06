import hashlib
import random
import string
from datetime import datetime, timezone, timedelta

from django.conf import settings
from django.http import HttpResponse
from django.core.mail import send_mail

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
            return Response({
                "detail": "Something wrong! Check your data"
            }, status=status.HTTP_400_BAD_REQUEST)

        username = mydata.data['username']
        password = mydata.data['password']
        name = mydata.data['name']
        email = mydata.data['email']
        gender = mydata.data['gender']
        date_of_birth = mydata.data['date_of_birth']
        tel_number = mydata.data['tel_number']
        number_type = mydata.data['number_type']
        try:
            date_of_birth = datetime.strptime(date_of_birth, '%d-%m-%Y')
        except:
            return Response({
                "detail": "Wrong date of birth!"
            }, status=status.HTTP_400_BAD_REQUEST)

        list_customer = Customer.objects.all()
        if list_customer.filter(username=username):
            return Response('Username already exists! Try another', status=status.HTTP_400_BAD_REQUEST)
        if list_customer.filter(email=email):
            return Response('Email already sign up! Try another or login', status=status.HTTP_400_BAD_REQUEST)

        password = hashlib.sha256(password.strip().encode("utf-8")).hexdigest()
        customer = Customer.objects.create(username=username, password=password, name=name, email=email,
                                           gender=gender, date_of_birth=date_of_birth)
        TelNumber.objects.create(customer=customer, tel_number=tel_number, number_type=number_type)
        tel_number = TelNumber.objects.filter(customer=customer)
        return Response({
            "username": customer.username,
            "name": customer.name,
            "email": customer.email,
            "gender": customer.gender,
            "date_of_birth": customer.date_of_birth,
            "tel_number": GetTelNumberSerializer(tel_number, many=True).data,
        }, status=status.HTTP_201_CREATED)


class SignInCustomerAPIView(APIView):

    def post(self, request):
        mydata = SignInCustomerSerializer(data=request.data)
        if not mydata.is_valid():
            return Response({
                "detail": "Something wrong! Check your data"
            }, status=status.HTTP_400_BAD_REQUEST)

        username = mydata.data['username']
        password = mydata.data['password']
        password = hashlib.sha256(password.strip().encode("utf-8")).hexdigest()

        customer = Customer.objects.filter(username=username, password=password).first()
        if customer is None:
            return Response('Wrong username or password!', status=status.HTTP_400_BAD_REQUEST)
        else:
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


class SignOutCustomerAPIView(APIView):

    def put(self, request):
        try:
            token = request.headers['Authorization']
        except:
            return Response({
                "detail": "Token not found"
            }, status=status.HTTP_203_NON_AUTHORITATIVE_INFORMATION)
        token = Token.objects.filter(key=token).first()
        if token is None:
            return Response({
                "detail": "Invalid token"
            }, status=status.HTTP_401_UNAUTHORIZED)
        if (token.created + timedelta(hours=1)) < datetime.now():
            return Response({
                "detail": "Token has expired! You already sign out"
            }, status=status.HTTP_200_OK)
        else:
            token.created -= timedelta(hours=1)
            token.save()
            return Response({
                "detail": "Sign out successful"
            }, status=status.HTTP_200_OK)


class GetCustomerInfoAPIView(APIView):

    def get(self, request):
        try:
            token = request.headers['Authorization']
        except:
            return Response({
                "detail": "Token not found"
            }, status=status.HTTP_203_NON_AUTHORITATIVE_INFORMATION)
        token = Token.objects.filter(key=token).first()
        if token is None:
            return Response({
                "detail": "Invalid token"
            }, status=status.HTTP_401_UNAUTHORIZED)
        if (token.created + timedelta(hours=1)) < datetime.now():
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        ship_address = ShipAddress.objects.filter(customer=customer)
        tel_number = TelNumber.objects.filter(customer=customer)

        return Response({
            "username": customer.username,
            "name": customer.name,
            "email": customer.email,
            "gender": customer.gender,
            "date_of_birth": customer.date_of_birth,
            "ship_address": GetShipAddressSerializer(ship_address, many=True).data,
            "tel_number": GetTelNumberSerializer(tel_number, many=True).data
        }, status=status.HTTP_200_OK)


class EditCustomerAPIView(APIView):

    def put(self, request):
        try:
            token = request.headers['Authorization']
        except:
            return Response({
                "detail": "Token not found"
            }, status=status.HTTP_203_NON_AUTHORITATIVE_INFORMATION)
        token = Token.objects.filter(key=token).first()
        if token is None:
            return Response({
                "detail": "Invalid token"
            }, status=status.HTTP_401_UNAUTHORIZED)
        if (token.created + timedelta(hours=1)) < datetime.now():
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        try:
            name = request.data['name']
            email = request.data['email']
            gender = request.data['gender']
            date_of_birth = request.data['date_of_birth']
            password_confirm = request.data['password_confirm']
        except:
            return Response({
                "detail": "Check your data"
            }, status=status.HTTP_400_BAD_REQUEST)

        list_customer = Customer.objects.all()
        if list_customer.filter(email=email):
            return Response({
                "detail": "Email already exists! Try another"
            }, status=status.HTTP_400_BAD_REQUEST)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        password_confirm = hashlib.sha256(password_confirm.encode('utf-8')).hexdigest()
        if customer.password != password_confirm:
            return Response({
                "detail": "Password confirm is incorrect"
            }, status=status.HTTP_400_BAD_REQUEST)

        if not name is None:
            customer.name = name
        if not email is None:
            customer.email = email
        if not gender is None:
            customer.gender = gender
        if not date_of_birth is None:
            try:
                date_of_birth = datetime.strptime(date_of_birth, '%d-%m-%Y')
            except:
                return Response({
                    "detail": "Wrong date of birth!"
                }, status=status.HTTP_400_BAD_REQUEST)
            customer.date_of_birth = date_of_birth

        customer.save()
        return Response({
            "username": customer.username,
            "name": customer.name,
            "email": customer.email,
            "gender": customer.gender,
            "date_of_birth": customer.date_of_birth
        }, status=status.HTTP_200_OK)


class ChangePasswordCustomerAPIView(APIView):

    def put(self, request):
        try:
            token = request.headers['Authorization']
        except:
            return Response({
                "detail": "Token not found"
            }, status=status.HTTP_203_NON_AUTHORITATIVE_INFORMATION)
        token = Token.objects.filter(key=token).first()
        if token is None:
            return Response({
                "detail": "Invalid token"
            }, status=status.HTTP_401_UNAUTHORIZED)
        if (token.created + timedelta(hours=1)) < datetime.now():
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        data = ChangePasswordCutomerSerializer(data=request.data)
        if not data.is_valid():
            return Response({
                "detail": "Something wrong! Check your data"
            }, status=status.HTTP_400_BAD_REQUEST)

        old_password = data.data['old_password']
        new_password = data.data['new_password']
        new_password_confirm = data.data['new_password_confirm']

        if new_password != new_password_confirm:
            return Response({
                "detail": "Password doesn't match!"
            }, status=status.HTTP_400_BAD_REQUEST)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        old_password = hashlib.sha256(old_password.encode('utf-8')).hexdigest()
        if old_password != customer.password:
            return Response({
                "detail": "Password old wrong!"
            }, status=status.HTTP_400_BAD_REQUEST)
        new_password = hashlib.sha256(new_password.encode('utf-8')).hexdigest()
        customer.password = new_password
        customer.save()

        return Response({"Change password successfully!"}, status=status.HTTP_200_OK)


class RequestRestorePasswordAPIView(APIView):

    def post(self, request):
        try:
            email = request.data['email']
        except:
            return Response({
                "detail": "Something wrong! Check your data"
            }, status=status.HTTP_400_BAD_REQUEST)

        customer = Customer.objects.filter(email=email).first()
        if customer is None:
            return Response({
                "detail": "Invalid email!"
            }, status=status.HTTP_400_BAD_REQUEST)
        else:
            otpCode = OTPCode.objects.filter(customer=customer).first()
            letters_and_digits = string.ascii_letters + string.digits
            code = ''.join((random.choice(letters_and_digits) for i in range(6)))
            if otpCode is None:
                otpCode = OTPCode.objects.create(code=code, created=datetime.now(), customer=customer)
            else:
                OTPCode.objects.filter(pk=otpCode.pk).update(code=code, created=datetime.now())
                otpCode = OTPCode.objects.filter(pk=otpCode.pk).first()

            content = "Use this code to restore your password: " + code + "\nThis code will expired in 5 minutes"
            send_mail(
                'DATJ: Reset password code',
                content,
                settings.EMAIL_HOST_USER,
                [email],
                fail_silently=False,
            )
            return Response('Mail successfully sent', status=status.HTTP_200_OK)


class ChangePasswordOTPAPIView(APIView):

    def put(self, request):
        try:
            code = request.data['code']
            password = request.data['password']
            password_confirm = request.data['password_confirm']
        except:
            return Response({
                "detail": "Something wrong! Check your data"
            }, status=status.HTTP_400_BAD_REQUEST)

        otpCode = OTPCode.objects.filter(code=code).first()
        if otpCode is None or (otpCode.created + timedelta(minutes=5)) < datetime.now():
            return Response({
                "detail": "Your OTP code is invalid"
            }, status=status.HTTP_400_BAD_REQUEST)
        else:
            if password != password_confirm:
                return Response({
                    "detail": "Password doesn't match!"
                }, status=status.HTTP_400_BAD_REQUEST)

            OTPCode.objects.filter(pk=otpCode.pk).update(created=(datetime.now() - timedelta(minutes=5)))
            customer = Customer.objects.filter(pk=otpCode.customer.pk).first()
            password = hashlib.sha256(password.encode('utf-8')).hexdigest()
            customer.password = password
            customer.save()
            return Response({"Change password successfully!"}, status=status.HTTP_200_OK)


class AddAddressAPIView(APIView):

    def post(self, request):
        try:
            token = request.headers['Authorization']
        except:
            return Response({
                "detail": "Token not found"
            }, status=status.HTTP_203_NON_AUTHORITATIVE_INFORMATION)
        token = Token.objects.filter(key=token).first()
        if token is None:
            return Response({
                "detail": "Invalid token"
            }, status=status.HTTP_401_UNAUTHORIZED)
        if (token.created + timedelta(hours=1)) < datetime.now():
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        data = AddAddressSerializer(data=request.data)
        if not data.is_valid():
            return Response({
                "detail": "Something wrong! Check your data"
            }, status=status.HTTP_400_BAD_REQUEST)

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
        }, status=status.HTTP_201_CREATED)


class EditAddressAPIView(APIView):

    def put(self, request):
        try:
            token = request.headers['Authorization']
        except:
            return Response({
                "detail": "Token not found"
            }, status=status.HTTP_203_NON_AUTHORITATIVE_INFORMATION)
        token = Token.objects.filter(key=token).first()
        if token is None:
            return Response({
                "detail": "Invalid token"
            }, status=status.HTTP_401_UNAUTHORIZED)
        if (token.created + timedelta(hours=1)) < datetime.now():
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        try:
            ship_address = request.data['ship_address']
            apartment_number = request.data['apartment_number']
            street = request.data['street']
            ward = request.data['ward']
            district = request.data['district']
            city = request.data['city']
            description = request.data['description']
        except:
            return Response({
                "detail": "Check your data"
            }, status=status.HTTP_400_BAD_REQUEST)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        ship_address = ShipAddress.objects.filter(pk=ship_address, customer=customer).first()
        if ship_address is None:
            return Response({
                "detail": "Invalid ship address"
            }, status=status.HTTP_400_BAD_REQUEST)

        if not apartment_number is None:
            ship_address.apartment_number = apartment_number
        if not street is None:
            ship_address.street = street
        if not ward is None:
            ship_address.ward = ward
        if not district is None:
            ship_address.district = district
        if not city is None:
            ship_address.city = city
        if not description is None:
            ship_address.description = description
        ship_address.save()
        ship_address = ShipAddress.objects.filter(pk=ship_address.pk)

        return Response({
            "username": customer.username,
            "name": customer.name,
            "email": customer.email,
            "ship_address": GetShipAddressSerializer(ship_address, many=True).data
        }, status=status.HTTP_200_OK)


class DelAddressAPIView(APIView):

    def delete(self, request):
        try:
            token = request.headers['Authorization']
        except:
            return Response({
                "detail": "Token not found"
            }, status=status.HTTP_203_NON_AUTHORITATIVE_INFORMATION)
        token = Token.objects.filter(key=token).first()
        if token is None:
            return Response({
                "detail": "Invalid token"
            }, status=status.HTTP_401_UNAUTHORIZED)
        if (token.created + timedelta(hours=1)) < datetime.now():
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        try:
            ship_address = request.data['ship_address']
        except:
            return Response({
                "detail": "Check your data"
            }, status=status.HTTP_400_BAD_REQUEST)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        ship_address = ShipAddress.objects.filter(pk=ship_address, customer=customer).first()
        if ship_address is None:
            return Response({
                "detail": "Invalid ship address"
            }, status=status.HTTP_400_BAD_REQUEST)
        ship_address.delete()

        return Response({
            "detail": "Delete address successfully"
        }, status=status.HTTP_200_OK)


class AddTelNumberAPIView(APIView):

    def post(self, request):
        try:
            token = request.headers['Authorization']
        except:
            return Response({
                "detail": "Token not found"
            }, status=status.HTTP_203_NON_AUTHORITATIVE_INFORMATION)
        token = Token.objects.filter(key=token).first()
        if token is None:
            return Response({
                "detail": "Invalid token"
            }, status=status.HTTP_401_UNAUTHORIZED)
        if (token.created + timedelta(hours=1)) < datetime.now():
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        data = AddTelNumberSerializer(data=request.data)
        if not data.is_valid():
            return Response({
                "detail": "Something wrong! Check your data"
            }, status=status.HTTP_400_BAD_REQUEST)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        tel_number = TelNumber.objects.create(tel_number=data.data['tel_number'],
                                              number_type=data.data['number_type'],
                                              customer=customer)
        return Response({
            "detail": "Add new tel number successful"
        }, status=status.HTTP_201_CREATED)


class EditTelNumberAPIView(APIView):

    def put(self, request):
        try:
            token = request.headers['Authorization']
        except:
            return Response({
                "detail": "Token not found"
            }, status=status.HTTP_203_NON_AUTHORITATIVE_INFORMATION)
        token = Token.objects.filter(key=token).first()
        if token is None:
            return Response({
                "detail": "Invalid token"
            }, status=status.HTTP_401_UNAUTHORIZED)
        if (token.created + timedelta(hours=1)) < datetime.now():
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        try:
            tel = request.data['tel']
            tel_number = request.data['tel_number']
            number_type = request.data['number_type']
        except:
            return Response({
                "detail": "Check your data"
            }, status=status.HTTP_400_BAD_REQUEST)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        tel = TelNumber.objects.filter(pk=tel, customer=customer).first()
        if tel is None:
            return Response({
                "detail": "Invalid tel number"
            }, status=status.HTTP_400_BAD_REQUEST)

        if not tel_number is None:
            tel.tel_number = tel_number
        if not number_type is None:
            tel.number_type = number_type
        tel.save()
        tel = TelNumber.objects.filter(pk=tel.pk)

        return Response({
            "username": customer.username,
            "name": customer.name,
            "email": customer.email,
            "ship_address": GetTelNumberSerializer(tel, many=True).data
        }, status=status.HTTP_200_OK)


class DelTelNumberAPIView(APIView):

    def delete(self, request):
        try:
            token = request.headers['Authorization']
        except:
            return Response({
                "detail": "Token not found"
            }, status=status.HTTP_203_NON_AUTHORITATIVE_INFORMATION)
        token = Token.objects.filter(key=token).first()
        if token is None:
            return Response({
                "detail": "Invalid token"
            }, status=status.HTTP_401_UNAUTHORIZED)
        if (token.created + timedelta(hours=1)) < datetime.now():
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        try:
            tel = request.data['tel']
        except:
            return Response({
                "detail": "Check your data"
            }, status=status.HTTP_400_BAD_REQUEST)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        tel = TelNumber.objects.filter(pk=tel, customer=customer).first()
        if tel is None:
            return Response({
                "detail": "Invalid tel number"
            }, status=status.HTTP_400_BAD_REQUEST)
        tel.delete()

        return Response({
            "detail": "Delete tel number successfully"
        }, status=status.HTTP_200_OK)
