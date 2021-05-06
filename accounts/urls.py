from django.conf.urls import url
from django.contrib.auth.views import LoginView,LogoutView
from . import views

app_name = 'accounts'

urlpatterns = [
    url(r'^signup/$', views.SignUp.as_view(), name='signup'),
    url(r'^login/$',
    LoginView.as_view(template_name='accounts/login.html'),
    name='login'),
    url(r'^logout/$',LogoutView.as_view(),name='logout'),
]
