from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from api.views import UserViewSet, ProjectViewSet, TaskViewSet, CommentViewSet

router = DefaultRouter()
router.register(r'users', UserViewSet)
router.register(r'projects', ProjectViewSet)
router.register(r'tasks', TaskViewSet)
router.register(r'comments', CommentViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
]
