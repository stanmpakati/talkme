from django.shortcuts import render
from django.http import JsonResponse , HttpResponse
from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt


#serilizers 
from .serializers import MessageSerializer

#models
from .models import Person , Message

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
    messagesUnserialized = Message.objects.all().order_by("posted")
    serializer = MessageSerializer(messagesUnserialized,many=True)
    return JsonResponse(serializer.data,safe=False)

#post msg
@require_http_methods(["POST",])
@csrf_exempt
def msg_post(request):
    try:
        newMessage = Message()
        newMessage.owner = Person.objects.get(username=request.POST["username"])
        newMessage.msg = request.POST["msg"]
        newMessage.save()
        return JsonResponse("200",safe=False)
    except:
        return HttpResponse("400")

@require_http_methods(["POST",])
@csrf_exempt
def join(request):
    try:
        #get image 
        uploaded_image = request.FILES['profile']
        new_user = Person()
        new_user.username = request.POST['username']
        new_user.profile = uploaded_image
        new_user.save()
        return JsonResponse("200",safe=False)
    except:
        return JsonResponse("400",safe=False)

@csrf_exempt
@require_http_methods(["POST",])
def get_profile(request):
    try:
        return HttpResponse(Person.objects.get(username=request.POST["username"]).profile.url)
    except:
        return HttpResponse("400")