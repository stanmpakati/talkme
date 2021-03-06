from django.urls import path
from . import views

urlpatterns = [
    path('gateway/',views.gateway), #gateway
    path("get_msgs/",views.msgs), #get msgs
    path("post_msg/", views.msg_post), #post msg
    path("join/",views.join), #join API
    path("get_profile/",views.get_profile), #get profile
]
