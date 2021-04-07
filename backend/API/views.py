from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt

#time and system
from datetime import datetime
import platform

#gateway
@require_http_methods(["GET",])
def gateway(request):
    responce = {
        "Application" : "Talk Me",
        "Server time" : datetime.now(),
        "OS" : platform.system()
    }
    return JsonResponse(responce,safe=False)

#get all msgs
@require_http_methods(["GET",])
def msgs(request):
    responce = {
        "id" : "br4GheimsHi78hjdl",
        "owner" : "Stan00",
        "msg" : "this is an example of a msg",
        "posted" : "2020:01:01 12:31"
    }
    return JsonResponse(responce,safe=False)

#post msg
@require_http_methods(["POST",])
@csrf_exempt
def msg_post(request):
    responce = {
        "Luck" :"We are hoping this msg was recived"
    } 
    return JsonResponse(responce,safe=False)
