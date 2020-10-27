from datetime import timedelta, timezone

from django.shortcuts import render
from django.http import HttpResponse
from rest_framework.authentication import TokenAuthentication, BasicAuthentication, SessionAuthentication
from rest_framework.permissions import IsAuthenticated

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from customer.models import Token, Customer, ShipAddress, TelNumber
from product.models import Product, Discount, DiscountItem

from .models import *
from .serializers import *


def index(request):
    return HttpResponse("Welcome to order site.")


class GetCartAPIView(APIView):

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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        cart = Cart.objects.filter(customer=customer).first()
        if cart is None:
            cart = Cart.objects.create(customer=customer)
        cartItem = CartItem.objects.all().filter(cart=cart)
        return Response({
            "pk": cart.pk,
            "customer": cart.customer.username,
            "total_price": cart.total_price,
            "cart_item": GetCartItemSerializer(cartItem, many=True).data
        }, status=status.HTTP_200_OK)


class AddCartItemAPIView(APIView):

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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        product = request.data['product']
        quantity = request.data['quantity']
        if quantity <= 0:
            return Response({
                "detail": "Invalid quantiy"
            }, status=status.HTTP_400_BAD_REQUEST)
        product = Product.objects.filter(pk=product).first()
        if product is None:
            return Response({
                "detail": "Invalid product"
            }, status=status.HTTP_400_BAD_REQUEST)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        cart = Cart.objects.filter(customer=customer).first()
        if cart is None:
            cart = Cart.objects.create(customer=customer)

        cartItem = CartItem.objects.filter(cart=cart, product=product).first()
        if cartItem is None:
            cartItem = CartItem.objects.create(product=product, quantity=quantity, cart=cart,
                                               unit_price=quantity * product.price)
            Cart.objects.filter(pk=cart.pk).update(total_price=cart.total_price + quantity * product.price)
            cart = Cart.objects.filter(pk=cart.pk).first()
        else:
            Cart.objects.filter(pk=cart.pk).update(total_price=cart.total_price + quantity * product.price)
            cart = Cart.objects.filter(pk=cart.pk).first()
            CartItem.objects.filter(pk=cartItem.pk).update(quantity=cartItem.quantity + quantity,
                                                           unit_price=((cartItem.quantity + quantity) * product.price))
        cartItem = CartItem.objects.all().filter(cart=cart)

        return Response({
            "pk": cart.pk,
            "customer": cart.customer.username,
            "total_price": cart.total_price,
            "cart_item": GetCartItemSerializer(cartItem, many=True).data
        }, status=status.HTTP_200_OK)


class DelCartItemAPIView(APIView):

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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        product = request.data['product']
        quantity = request.data['quantity']
        if quantity <= 0:
            return Response({
                "detail": "Invalid quantiy"
            }, status=status.HTTP_400_BAD_REQUEST)
        product = Product.objects.filter(pk=product).first()
        if product is None:
            return Response({
                "detail": "Invalid product"
            }, status=status.HTTP_400_BAD_REQUEST)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        cart = Cart.objects.filter(customer=customer).first()
        if cart is None:
            return Response({
                "detail": "Nothing in cart yet!"
            }, status=status.HTTP_400_BAD_REQUEST)

        cartItem = CartItem.objects.filter(cart=cart, product=product).first()
        if cartItem is None:
            return Response({
                "detail": "Product not in cart yet!"
            }, status=status.HTTP_400_BAD_REQUEST)
        else:
            if quantity >= cartItem.quantity:
                Cart.objects.filter(pk=cart.pk).update(total_price=cart.total_price - cartItem.unit_price)
                cart = Cart.objects.filter(pk=cart.pk).first()
                cartItem.delete()
            else:
                Cart.objects.filter(pk=cart.pk).update(total_price=cart.total_price - quantity * product.price)
                cart = Cart.objects.filter(pk=cart.pk).first()
                CartItem.objects.filter(pk=cartItem.pk).update(quantity=cartItem.quantity - quantity,
                                                               unit_price=((
                                                                                       cartItem.quantity - quantity) * product.price))
        cartItem = CartItem.objects.all().filter(cart=cart)

        return Response({
            "pk": cart.pk,
            "customer": cart.customer.username,
            "total_price": cart.total_price,
            "cart_item": GetCartItemSerializer(cartItem, many=True).data
        }, status=status.HTTP_200_OK)


class GetCustomerOrderAPIView(APIView):

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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        order = Order.objects.all().filter(customer=customer)

        return Response(GetOrderSerializer(order, many=True).data, status=status.HTTP_200_OK)


class GetCustomerOrderDetailAPIView(APIView):

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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        order = request.data['order']
        order = Order.objects.filter(pk=order, customer=customer).first()
        if order is None:
            return Response({
                "detail": "Invalid Order ID"
            }, status=status.HTTP_400_BAD_REQUEST)

        order_detail = OrderDetail.objects.filter(order=order)

        return Response({
            "customer": order.customer.username,
            "payment_type": order.payment_type.name,
            "ship_by": order.ship_by.name,
            "ship_to": str(order.ship_to),
            "shipped_date": order.shipped_date,
            "contact_tel": order.contact_tel.__str__(),
            "paid_date": order.paid_date,
            "discount_code": order.discount_code,
            "total_discount": order.total_discount,
            "total_price": order.total_price,
            "total_actual_price": order.total_actual_price,
            "order_date": order.order_date,
            "stage": order.stage,
            "description": order.description,
            "order_detail": GetOrderDetailSerializer(order_detail, many=True).data
        }, status=status.HTTP_200_OK)


class AddCustomerOrderAPIView(APIView):

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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        cart = Cart.objects.filter(customer=customer).first()
        if cart is None or cart.total_price == 0:
            return Response({
                "detail": "Your cart is empty!"
            }, status=status.HTTP_400_BAD_REQUEST)

        payment_type = request.data['payment_type']
        payment_type = PaymentService.objects.filter(pk=payment_type).first()
        ship_by = request.data['ship_by']
        ship_by = ShipService.objects.filter(pk=ship_by).first()
        ship_to = request.data['ship_to']
        ship_to = ShipAddress.objects.filter(pk=ship_to, customer=customer).first()
        contact_tel = request.data['contact_tel']
        contact_tel = TelNumber.objects.filter(pk=contact_tel, customer=customer).first()
        paid_date = None
        shipped_date = datetime.now() + timedelta(days=7)
        discount_code = request.data['discount_code']
        description = request.data['description']
        total_discount = 0
        total_price = cart.total_price
        total_actual_price = total_price
        order_date = datetime.now()
        stage = OrderStage.Processing

        if ship_by is None:
            return Response({
                "detail": "Invalid SHIP SERVICES"
            }, status=status.HTTP_400_BAD_REQUEST)
        if payment_type is None:
            return Response({
                "detail": "Invalid PAYMENT SERVICES"
            }, status=status.HTTP_400_BAD_REQUEST)
        if ship_to is None:
            return Response({
                "detail": "Invalid SHIP ADDRESS"
            }, status=status.HTTP_400_BAD_REQUEST)
        if ship_to is None:
            return Response({
                "detail": "Invalid SHIP ADDRESS"
            }, status=status.HTTP_400_BAD_REQUEST)
        if contact_tel is None:
            return Response({
                "detail": "Invalid TEL NUMBER"
            }, status=status.HTTP_400_BAD_REQUEST)

        if payment_type.pk != 1:
            paid_date = datetime.now()
        else:
            paid_date = shipped_date

        discount = None
        if not discount_code is None:
            discount = Discount.objects.filter(code=discount_code).first()
            if discount is None or not discount.active:
                return Response({
                    "detail": "Invalid DISCOUNT CODE"
                }, status=status.HTTP_400_BAD_REQUEST)
        order = Order.objects.create(customer=customer,
                                     ship_by=ship_by,
                                     ship_to=ship_to,
                                     contact_tel=contact_tel,
                                     shipped_date=shipped_date,
                                     payment_type=payment_type,
                                     paid_date=paid_date,
                                     discount_code=discount,
                                     total_discount=total_discount,
                                     total_price=total_price,
                                     total_actual_price=total_actual_price,
                                     order_date=order_date,
                                     stage=stage,
                                     description=description, )

        cart_item = CartItem.objects.filter(cart=cart)
        for item in cart_item:
            if not discount is None and \
                    not discount.on_bill and \
                    DiscountItem.objects.filter(discount=discount, product=item.product):
                discount_amout = item.quantity * item.unit_price * discount.discount_percent
                OrderDetail.objects.create(order=order,
                                           product=item.product,
                                           quantity=item.quantity,
                                           discount_code=discount.code,
                                           unit_price=item.unit_price,
                                           discount_amount=discount_amout,
                                           unit_actual_price=item.unit_price - discount_amout,)
                total_discount += discount_amout
            else:
                OrderDetail.objects.create(order=order,
                                           product=item.product,
                                           quantity=item.quantity,
                                           discount_code=discount,
                                           unit_price=item.unit_price,
                                           discount_amount=0,
                                           unit_actual_price=item.unit_price,)

        if not discount is None and discount.on_bill:
            total_discount = discount.discount_percent * total_price

        if total_discount != 0:
            total_actual_price = total_price - total_discount
            Order.objects.filter(pk=order.pk).update(total_discount=total_discount,
                                                     total_actual_price=total_actual_price)
            order = Order.objects.filter(pk=order.pk).first()

        order_detail = OrderDetail.objects.filter(order=order)
        cart.delete()
        cart_item.delete()

        return Response({
            "customer": order.customer.username,
            "payment_type": order.payment_type.name,
            "ship_by": order.ship_by.name,
            "ship_to": str(order.ship_to),
            "shipped_date": order.shipped_date,
            "contact_tel": order.contact_tel.__str__(),
            "paid_date": order.paid_date,
            "discount_code": order.discount_code,
            "total_discount": order.total_discount,
            "total_price": order.total_price,
            "total_actual_price": order.total_actual_price,
            "order_date": order.order_date,
            "stage": order.stage,
            "description": order.description,
            "order_detail": GetOrderDetailSerializer(order_detail, many=True).data
        }, status=status.HTTP_200_OK)


class CancelCustomerOrderAPIView(APIView):

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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        order = request.data['order']
        order = Order.objects.filter(pk=order, customer=customer).first()
        if order is None:
            return Response({
                "detail": "Invalid Order ID"
            }, status=status.HTTP_400_BAD_REQUEST)
        if order.stage != OrderStage.Processing:
            return Response({
                "detail": "Can't cancel ORDER! Your ORDER stage: " + order.stage
            }, status=status.HTTP_400_BAD_REQUEST)

        order.stage = OrderStage.Cancel
        order.save()

        return Response({
            "customer": order.customer.username,
            "payment_type": order.payment_type.name,
            "ship_by": order.ship_by.name,
            "ship_to": str(order.ship_to),
            "shipped_date": order.shipped_date,
            "contact_tel": order.contact_tel.__str__(),
            "paid_date": order.paid_date,
            "discount_code": order.discount_code,
            "total_discount": order.total_discount,
            "total_price": order.total_price,
            "total_actual_price": order.total_actual_price,
            "order_date": order.order_date,
            "stage": order.stage,
            "description": order.description,
        }, status=status.HTTP_200_OK)
