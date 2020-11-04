from datetime import timedelta, timezone

from django.conf import settings
from django.shortcuts import render
from django.core.mail import send_mail
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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)
        try:
            product = request.data['product']
            quantity = request.data['quantity']
        except:
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        try:
            if quantity <= 0:
                return Response({
                    "detail": "Invalid quantiy"
                }, status=status.HTTP_400_BAD_REQUEST)
            product = Product.objects.filter(pk=product).first()
            if product is None:
                return Response({
                    "detail": "Invalid product"
                }, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response({
                "detail": "Product and quantiy must be a number"
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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)
        try:
            product = request.data['product']
            quantity = request.data['quantity']
        except:
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        try:
            if quantity <= 0:
                return Response({
                    "detail": "Invalid quantiy"
                }, status=status.HTTP_400_BAD_REQUEST)
            product = Product.objects.filter(pk=product).first()
            if product is None:
                return Response({
                    "detail": "Invalid product"
                }, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response({
                "detail": "Product and quantiy must be a number"
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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        order = Order.objects.all().filter(customer=customer)

        return Response(GetOrderSerializer(order, many=True).data, status=status.HTTP_200_OK)

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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)
        try:
            stage = request.data['stage']
        except:
            return Response({
                "detail": "Stage not found"
            }, status=status.HTTP_400_BAD_REQUEST)

        if stage not in OrderStage:
            return Response({
                "detail": "Invalid stage"
            }, status=status.HTTP_400_BAD_REQUEST)

        customer = Customer.objects.filter(pk=token.customer.pk).first()
        order = Order.objects.all().filter(customer=customer, stage=stage)

        return Response(GetOrderSerializer(order, many=True).data, status=status.HTTP_200_OK)


class GetCustomerOrderDetailAPIView(APIView):

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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)
        try:
            order = request.data['order']
        except:
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        try:
            customer = Customer.objects.filter(pk=token.customer.pk).first()
            order = Order.objects.filter(pk=order, customer=customer).first()
        except:
            return Response({
                "detail": "Invalid Order ID"
            }, status=status.HTTP_400_BAD_REQUEST)

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
        try:
            payment_type = int(request.data['payment_type'])
            ship_by = int(request.data['ship_by'])
            ship_to = int(request.data['ship_to'])
            contact_tel = int(request.data['contact_tel'])
            discount_code = request.data['discount_code']
            description = request.data['description']
        except:
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        payment_type = PaymentService.objects.filter(pk=payment_type).first()
        ship_by = ShipService.objects.filter(pk=ship_by).first()
        ship_to = ShipAddress.objects.filter(pk=ship_to, customer=customer).first()
        contact_tel = TelNumber.objects.filter(pk=contact_tel, customer=customer).first()

        paid_date = None
        shipped_date = datetime.now() + timedelta(days=7)
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
        if contact_tel is None:
            return Response({
                "detail": "Invalid TEL NUMBER"
            }, status=status.HTTP_400_BAD_REQUEST)

        if payment_type.pk != 1:
            paid_date = datetime.now()

        discount = None
        if not discount_code is None:
            discount = Discount.objects.filter(code=discount_code).first()
            if discount is None or not discount.active:
                return Response({
                    "detail": "Invalid DISCOUNT CODE"
                }, status=status.HTTP_400_BAD_REQUEST)

        cart_item = CartItem.objects.filter(cart=cart)
        for item in cart_item:
            product = Product.objects.filter(pk=item.product.pk).first()
            if item.quantity > (product.unit_in_stock - product.unit_in_order):
                return Response({
                    "detail": product.name + " don't have enough quantity for your order",
                    "description": product.name + " have " +
                                   str(product.unit_in_stock - product.unit_in_order) + " unit in stock left"
                }, status=status.HTTP_400_BAD_REQUEST)

        for item in cart_item:
            product = Product.objects.filter(pk=item.product.pk).first()
            product.unit_in_order += item.quantity
            product.save()

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
                discount_amount = item.quantity * item.unit_price * discount.discount_percent
                OrderDetail.objects.create(order=order,
                                           product=item.product,
                                           quantity=item.quantity,
                                           discount_code=discount.code,
                                           unit_price=item.unit_price,
                                           discount_amount=discount_amount,
                                           unit_actual_price=item.unit_price - discount_amount, )
                total_discount += discount_amount
            else:
                OrderDetail.objects.create(order=order,
                                           product=item.product,
                                           quantity=item.quantity,
                                           discount_code=discount,
                                           unit_price=item.unit_price,
                                           discount_amount=0,
                                           unit_actual_price=item.unit_price, )

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

        content = {
            "customer": order.customer.username,
            "payment_type": order.payment_type.name,
            "ship_by": order.ship_by.name,
            "ship_to": str(order.ship_to),
            "shipped_date": order.shipped_date,
            "contact_tel": order.contact_tel.__str__(),
            "paid_date": order.paid_date,
            "discount_code": order.discount_code.__str__(),
            "total_discount": order.total_discount,
            "total_price": order.total_price,
            "total_actual_price": order.total_actual_price,
            "order_date": order.order_date,
            "stage": order.stage,
            "description": order.description,
            "order_detail": GetOrderDetailSerializer(order_detail, many=True).data,
        }
        send_mail(
            "DATJ: Order successful! Your ORDER ID: " + str(order.pk),
            "Order Detail: \n" + str(content),
            settings.EMAIL_HOST_USER,
            [customer.email],
            fail_silently=False,
        )
        return Response(content, status=status.HTTP_200_OK)


class CancelCustomerOrderAPIView(APIView):

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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)
        try:
            order = request.data['order']
        except:
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        try:
            customer = Customer.objects.filter(pk=token.customer.pk).first()
            order = Order.objects.filter(pk=order, customer=customer).first()
        except:
            return Response({
                "detail": "Invalid Order ID"
            }, status=status.HTTP_400_BAD_REQUEST)

        if order is None:
            return Response({
                "detail": "Invalid Order ID"
            }, status=status.HTTP_400_BAD_REQUEST)
        if order.stage != OrderStage.Processing:
            return Response({
                "detail": "Can't CANCEL order! Your ORDER stage: " + order.stage
            }, status=status.HTTP_400_BAD_REQUEST)
        if not order.paid_date is None and order.paid_date < datetime.now(timezone.utc):
            return Response({
                "detail": "ORDER have PAID (" + str(order.paid_date) + "), can't REFUND or CANCEL"
            }, status=status.HTTP_400_BAD_REQUEST)

        order.stage = OrderStage.Cancel
        order.save()

        order_detail = OrderDetail.objects.filter(order=order)
        for item in order_detail:
            product = Product.objects.filter(pk=item.product.pk).first()
            product.unit_in_order -= item.quantity
            product.save()

        content = {
            "stage": order.stage,
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
            "description": order.description,
            "order_detail": GetOrderDetailSerializer(order_detail, many=True).data,
        }
        send_mail(
            "DATJ: Cancel ORDER successful! Your ORDER ID: " + str(order.pk),
            "Order Detail: \n" + str(content),
            settings.EMAIL_HOST_USER,
            [customer.email],
            fail_silently=False,
        )

        return Response(content, status=status.HTTP_200_OK)


class ReturnCustomerOrderAPIView(APIView):

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
        if (token.created + timedelta(hours=1)) < datetime.now(timezone.utc):
            return Response({
                "detail": "Token has expired"
            }, status=status.HTTP_401_UNAUTHORIZED)
        try:
            order = request.data['order']
        except:
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        try:
            customer = Customer.objects.filter(pk=token.customer.pk).first()
            order = Order.objects.filter(pk=order, customer=customer).first()
        except:
            return Response({
                "detail": "Invalid Order ID"
            }, status=status.HTTP_400_BAD_REQUEST)

        if order is None:
            return Response({
                "detail": "Invalid Order ID"
            }, status=status.HTTP_400_BAD_REQUEST)
        if order.stage != OrderStage.Done:
            return Response({
                "detail": "Can't RETURN order! Your ORDER stage: " + order.stage
            }, status=status.HTTP_400_BAD_REQUEST)

        order.stage = OrderStage.Return
        order.paid_date = None
        order.save()

        order_detail = OrderDetail.objects.filter(order=order)
        for item in order_detail:
            product = Product.objects.filter(pk=item.product.pk).first()
            product.unit_in_stock += item.quantity
            product.save()

        content = {
            "stage": order.stage,
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
            "description": order.description,
            "order_detail": GetOrderDetailSerializer(order_detail, many=True).data,
        }
        send_mail(
            "DATJ: Return ORDER successful! Your ORDER ID: " + str(order.pk),
            "Order Detail: \n" + str(content),
            settings.EMAIL_HOST_USER,
            [customer.email],
            fail_silently=False,
        )

        return Response(content, status=status.HTTP_200_OK)


class AdminShipCustomerOrderAPIView(APIView):
    authentication_classes = [SessionAuthentication, BasicAuthentication, TokenAuthentication]
    permission_classes = [IsAuthenticated]

    def put(self, request):
        mydata = ChangeStageOrderSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        order = Order.objects.filter(pk=mydata.data['order']).first()

        if order is None:
            return Response({
                "detail": "Invalid Order ID"
            }, status=status.HTTP_400_BAD_REQUEST)
        if order.stage != OrderStage.Processing:
            return Response({
                "detail": "Can't SHIPPING order! ORDER stage: " + order.stage
            }, status=status.HTTP_400_BAD_REQUEST)

        order.stage = OrderStage.Shipping
        order.save()
        order_detail = OrderDetail.objects.filter(order=order)
        for item in order_detail:
            product = Product.objects.filter(pk=item.product.pk).first()
            product.unit_in_order -= item.quantity
            product.unit_in_stock -= item.quantity
            product.save()

        customer = Customer.objects.filter(pk=order.customer.pk).first()
        content = {
            "stage": order.stage,
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
            "description": order.description,
            "order_detail": GetOrderDetailSerializer(order_detail, many=True).data
        }
        send_mail(
            "DATJ: Your ORDER is SHIPPING! Your ORDER ID: " + str(order.pk),
            "Order Detail: \n" + str(content),
            settings.EMAIL_HOST_USER,
            [customer.email],
            fail_silently=False,
        )

        return Response(content, status=status.HTTP_200_OK)


class AdminDoneCustomerOrderAPIView(APIView):
    authentication_classes = [SessionAuthentication, BasicAuthentication, TokenAuthentication]
    permission_classes = [IsAuthenticated]

    def put(self, request):
        mydata = ChangeStageOrderSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        order = Order.objects.filter(pk=mydata.data['order']).first()

        if order is None:
            return Response({
                "detail": "Invalid Order ID"
            }, status=status.HTTP_400_BAD_REQUEST)
        if order.stage != OrderStage.Shipping:
            return Response({
                "detail": "Can't DONE order! ORDER stage: " + order.stage
            }, status=status.HTTP_400_BAD_REQUEST)

        order.stage = OrderStage.Done
        if order.paid_date is None:
            order.paid_date = datetime.now()
        order.save()
        order_detail = OrderDetail.objects.filter(order=order)

        customer = Customer.objects.filter(pk=order.customer.pk).first()
        content = {
            "stage": order.stage,
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
            "description": order.description,
            "order_detail": GetOrderDetailSerializer(order_detail, many=True).data
        }
        send_mail(
            "DATJ: Your ORDER has DONE! Your ORDER ID: " + str(order.pk),
            "Thank you for choosing us!\nOrder Detail: \n" + str(content),
            settings.EMAIL_HOST_USER,
            [customer.email],
            fail_silently=False,
        )

        return Response(content, status=status.HTTP_200_OK)


class AdminCancelCustomerOrderAPIView(APIView):
    authentication_classes = [SessionAuthentication, BasicAuthentication, TokenAuthentication]
    permission_classes = [IsAuthenticated]

    def put(self, request):
        mydata = ChangeStageOrderSerializer(data=request.data)
        if not mydata.is_valid():
            return Response('Something wrong! Check your data', status=status.HTTP_400_BAD_REQUEST)

        order = Order.objects.filter(pk=mydata.data['order']).first()

        if order is None:
            return Response({
                "detail": "Invalid Order ID"
            }, status=status.HTTP_400_BAD_REQUEST)
        if order.stage != OrderStage.Processing and order.stage != OrderStage.Shipping:
            return Response({
                "detail": "Can't CANCEL order! ORDER stage: " + order.stage
            }, status=status.HTTP_400_BAD_REQUEST)

        order_detail = OrderDetail.objects.filter(order=order)
        for item in order_detail:
            product = Product.objects.filter(pk=item.product.pk).first()
            if order.stage == OrderStage.Processing:
                product.unit_in_order -= item.quantity
            if order.stage == OrderStage.Shipping:
                product.unit_in_stock += item.quantity
            product.save()

        order.stage = OrderStage.Cancel
        order.paid_date = None
        order.save()

        customer = Customer.objects.filter(pk=order.customer.pk).first()
        content = {
            "stage": order.stage,
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
            "description": order.description,
            "order_detail": GetOrderDetailSerializer(order_detail, many=True).data
        }
        send_mail(
            "DATJ: Your ORDER has CANCELED! Your ORDER ID: " + str(order.pk),
            "Sorry for this inconvenient!\nOrder Detail: \n" + str(content),
            settings.EMAIL_HOST_USER,
            [customer.email],
            fail_silently=False,
        )

        return Response(content, status=status.HTTP_200_OK)
