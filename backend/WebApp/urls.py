from . import views
from django.urls import path

urlpatterns = [
    path("", views.landing), #landing page
    path("chatroom/<str:username>",views.chatroom), #chatroom 
]