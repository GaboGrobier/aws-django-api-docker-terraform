from django.urls import path
from . import views

urlpatterns = [
    path("", views.home, name="inicio"),
    path("api/", views.api, name="api"),
]
