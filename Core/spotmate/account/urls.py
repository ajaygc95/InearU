from django.urls import path
from .views import( RegisterView, 
                   UserListView, 
                   ProfileListView, 
                   ProfileRetrieveUpdateDeleteView, 
                   
                   )
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('register/', RegisterView.as_view(), name='register'),
    path('users/', UserListView.as_view(), name='user-list'),
    path('profiles/', ProfileListView.as_view(), name='user-list'),
    path('profile/', ProfileRetrieveUpdateDeleteView.as_view(), name='current-profile'),
    path('profiles/<int:pk>/', ProfileRetrieveUpdateDeleteView.as_view(), name='profile-detail'),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
