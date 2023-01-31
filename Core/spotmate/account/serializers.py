from django.contrib.auth.models import User
from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from .models import Profile, Image, Interest

class MyTokenObtainPairSerializer(TokenObtainPairSerializer):

    @classmethod
    def get_token(cls, user):
        token = super(MyTokenObtainPairSerializer, cls).get_token(user)

        # Add custom claims
        token['username'] = user.username
        token['user'] = user.id
        return token

class ImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Image
        fields = ('id', 'image')

class InterestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Interest
        fields = ('id', 'interest')

class ProfileSerializer(serializers.ModelSerializer):
    images = ImageSerializer(required=False, many=True,)

    class Meta:
        model = Profile
        fields = ['id', 'user', 'first_name', 'last_name', 'job_title', 'bio', 'images', 'interests']

    def validate(self, data):
        images = data.get('images', [])
        for image in images:
            image = image.get('image')
            if not image.format.lower() in ['jpeg', 'png', 'jpg']:
                raise serializers.ValidationError({'image': ['Upload a valid image. The file you uploaded was either not an image or a corrupted image.']})

        # Check the number of images for the current profile
        profile = self.instance
        if profile:
            images = profile.images.all()
            if len(images) + len(data.get('images', [])) > 8:
                raise serializers.ValidationError({'images': ['Profile can have maximum 8 images.']})

        return data



class RegisterSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input_type': 'password'}, write_only=True)

    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'password', 'password2']
        extra_kwargs = {'password': {'write_only': True}}

    def validate(self, data):
        if data['password'] != data['password2']:
            raise serializers.ValidationError('Passwords must match.')
        return data
    
    def create(self, validated_data):
        user = User(
            username=validated_data['username'],
            email=validated_data['email']
        )
        user.set_password(validated_data['password'])
        user.save()
        Profile.objects.create(user=user)
        return user


# User serializer
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'


class LoginSerializer(TokenObtainPairSerializer):
    pass
