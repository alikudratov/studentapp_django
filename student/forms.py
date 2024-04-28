from django import forms
from .models import Murojaat, Comments
    
class MurojaatForm(forms.ModelForm):
    class Meta:
        model = Murojaat
        fields = '__all__'

class CommentsForm(forms.ModelForm):
    class Meta:
        model = Comments
        fields = '__all__'
        exclude = ['published']
        widgets = {
            'talaba_id': forms.HiddenInput(),
        }

class SearchForm(forms.Form):
    search = forms.CharField(label="Izlash:", max_length=100, required=False)