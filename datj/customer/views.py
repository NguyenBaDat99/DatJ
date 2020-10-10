from django.shortcuts import render
from django.http import HttpResponse


def index(request):
    return HttpResponse("Welcome to customer site.")
# Create your views here.
