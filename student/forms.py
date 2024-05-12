from django import forms
from .models import *
from django_recaptcha.fields import ReCaptchaField

    
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
            'talaba_id': forms.HiddenInput(),
        }

class SearchForm(forms.Form):
    search = forms.CharField(label="Izlash:", max_length=100, required=False)
    guruh = forms.ModelChoiceField(queryset=Guruh.objects.all())
    captcha = ReCaptchaField()