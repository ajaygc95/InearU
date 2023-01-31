from rest_framework import generics, permissions
from .serializers import ( UserSerializer, 
                          RegisterSerializer, 
                          LoginSerializer, 
                          MyTokenObtainPairSerializer,
                          ProfileSerializer
                          )
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from django.core.exceptions import PermissionDenied
from django.contrib.auth.models import User
from .models import Profile, Image, Interest
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework_simplejwt.views import TokenObtainPairView

class RegisterView(APIView):
    def post(self, request, format=None):
        user_serializer = UserSerializer(data=request.data)
        if user_serializer.is_valid():
            user = user_serializer.save()
            profile_data = request.data.copy()
            profile_data['user'] = user.id
            profile_serializer = ProfileSerializer(data=profile_data)
            if profile_serializer.is_valid():
                profile_serializer.save()
                return Response(user_serializer.data, status=status.HTTP_201_CREATED)
            return Response(profile_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        return Response(user_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class UserListView(generics.ListAPIView):
    queryset = User.objects.all()
    permission_classes = [IsAuthenticated]
    serializer_class = UserSerializer


class LoginView(generics.CreateAPIView):
    serializer_class = LoginSerializer

class MyObtainTokenPairView(TokenObtainPairView):
    permission_classes = (AllowAny,)
    serializer_class = MyTokenObtainPairSerializer

class ProfileListView(generics.ListAPIView):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer

class ProfileRetrieveUpdateDeleteView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (IsAuthenticated,)
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer

    def get_object(self):
        user_id = self.request.user.id
        try:
            profile = self.queryset.get(user=user_id)
        except Profile.DoesNotExist:
                return Response({"error": "Profile not found"}, status=404)
        return profile

    def perform_update(self, serializer):
        if self.get_object().user != self.request.user:
            raise PermissionDenied("You cannot update this profile.")
        return super().perform_update(serializer)

    def perform_destroy(self, instance):
        if instance.user != self.request.user:
            raise PermissionDenied("You cannot delete this profile.")
        return super().perform_destroy(instance)
