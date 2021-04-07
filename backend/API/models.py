from django.db import models

class Person(models.Model):
    username = models.CharField(max_length=20,null=False,blank=False,primary_key=True)
    profile = models.ImageField(upload_to="media/profiles",null=False)