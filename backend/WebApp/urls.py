from . import views
from django.urls import path

urlpatterns = [
    path("", views.landing), #landing page
    path("chatroom/",views.chatroom), #chatroom 
]