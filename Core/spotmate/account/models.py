from django.db import models
from django.contrib.auth.models import User

class Image(models.Model):
    image = models.ImageField(upload_to='images/')


class Interest(models.Model):
    interest = models.CharField(max_length=100)


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=100, null=True, blank=True)
    last_name = models.CharField(max_length=100, null=True, blank=True)
    job_title = models.CharField(max_length=100, null=True, blank=True)
    bio = models.TextField(null=True, blank=True)
    images = models.ManyToManyField(Image, blank=True)
    interests = models.ManyToManyField(Interest, blank=True)

    def __str__(self):
        return str(self.first_name) 
    
