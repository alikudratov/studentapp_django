from django import forms
from .models import *
from django_recaptcha.fields import ReCaptchaField
from django.contrib.auth.models import User

class UserRegForm(forms.ModelForm):
    #captcha = ReCaptchaField()

    class Meta:
        model = User
        fields = ['username', 'password']
        widgets = {
            'password' : forms.PasswordInput()
        } 

class MurojaatForm(forms.ModelForm):
    captcha = ReCaptchaField()

    class Meta:
        model = Murojaat
        fields = '__all__'

class TalabaUpdateForm(forms.ModelForm):
    class Meta:
        model = Talaba
        fields = '__all__'

class CommentsForm(forms.ModelForm):
    captcha = ReCaptchaField()
    
    class Meta:
        model = Comments
        fields = '__all__'
        exclude = ['published']
        widgets = {
            'talaba': forms.HiddenInput(),
            'bahosi': forms.RadioSelect(),
        }

class SearchForm(forms.Form):
    search = forms.CharField(label="Izlash:", max_length=100, required=False)
    guruh = forms.ModelChoiceField(queryset=Guruh.objects.all())
    captcha = ReCaptchaField()