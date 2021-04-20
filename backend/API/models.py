from django.db import models

class Person(models.Model):
    username = models.CharField(max_length=20,null=False,blank=False,primary_key=True)
    profile = models.ImageField(upload_to="media/profiles",null=False)


class Message(models.Model):
    owner = models.ForeignKey(Person,null=False,on_delete=models.CASCADE)
    msg = models.TextField(null=False)
    posted = models.DateTimeField(auto_created=True, auto_now_add=True,null=True,blank=True)
    