from django.shortcuts import render , redirect
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from API.models import Person , Message


# Create your views here.
@csrf_exempt
def landing(request):
    if request.method == "POST":
        try:
            uploaded_image = request.FILES['profile']
            new_user = Person()
            new_user.username = request.POST['username']
            if (len(new_user.username) < 4):
                return HttpResponse("enter a valid username")
            
            new_user.profile = uploaded_image
            new_user.save()

            return redirect('chatroom',new_user.username)
        except:
            return HttpResponse("Problem occured")
        
    return render(request,"landing/landing.html")

@csrf_exempt
def chatroom(request,**kwargs):
    if (request.method == "GET"):
        context = {
            "msgs" : Message.objects.all().order_by("posted")
        }
        return render(request,"chatroom/chatroom.html",context)