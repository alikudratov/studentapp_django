from django.db import models
from tinymce import models as tinymce_models
from django_currentuser.db.models import CurrentUserField
from django.contrib.auth.models import User

class Profile(models.Model):
    #id = models.IntegerField()
    lavozimi = models.CharField(max_length=50)
    tavallud_kuni = models.DateField()
    foydalanuvchi = models.OneToOneField(User, on_delete=models.CASCADE)

    class Meta:
        managed = True
        db_table = 'profile'


class Fanlar(models.Model):
    fanlar_nomi = models.CharField(max_length=50)
    tarkibi = tinymce_models.HTMLField()
    pdf_fayl = models.FileField(upload_to="uploads")
    kitob_narxi = models.IntegerField()

    class Meta:
        managed = True
        db_table = 'fanlar'
        verbose_name_plural = 'Fanlar'

    def __str__(self):
        return self.fanlar_nomi

class Guruh(models.Model):
    guruh_raqami = models.CharField(max_length=100)
    guruh_rahbari = models.CharField(max_length=200)

    class Meta:
        managed = True
        db_table = 'guruh'
        verbose_name = "Guruh"
        verbose_name_plural = "Guruhlar"

    def __str__(self):
        # return self.guruh_raqami + ' - ' + self.guruh_rahbari
        return self.guruh_raqami

class Jinsi(models.Model):
    jins = models.CharField(max_length=5)

    class Meta:
        managed = True
        db_table = 'jinsi'
        verbose_name = "Jins"
        verbose_name_plural = "Jinslar"

    def __str__(self):
        return self.jins

class Viloyatlar(models.Model):
    viloyat_nomi = models.CharField(max_length=100)

    class Meta:
        managed = True
        db_table = 'viloyatlar'
        verbose_name = "Viloyat"
        verbose_name_plural = "Viloyatlar"

    def __str__(self):
        return self.viloyat_nomi

class Talaba(models.Model):
    familiya = models.CharField(max_length=50)
    ism = models.CharField(max_length=50)
    otasining_ismi = models.CharField(max_length=50)
    tavallud_kuni = models.DateField()
    yashash_manzili = models.CharField(max_length=200)
    telefon_raqami = models.CharField(max_length=100)
    guruh = models.ForeignKey('Guruh', on_delete=models.DO_NOTHING, db_column='guruh', related_name='talabalar')
    jinsi = models.ForeignKey('Jinsi', on_delete=models.DO_NOTHING, db_column='jinsi', related_name='talabalar')
    viloyat = models.ForeignKey('Viloyatlar', on_delete=models.DO_NOTHING, db_column='viloyat', related_name='talabalar')
    fanlar = models.ManyToManyField('Fanlar')
    image = models.ImageField(upload_to='images')
    created_by = CurrentUserField()
    slug = models.SlugField()


    class Meta:
        managed = True
        db_table = 'talaba'
        ordering = ["familiya"]
        verbose_name = "Talaba"
        verbose_name_plural = "Talabalar"

    def __str__(self):
        return self.familiya
    
    def fullname(self):
        return f"{self.familiya} {self.ism} {self.otasining_ismi}"
    
    def full_url(self):
        return f"http://127.0.0.1:8001/talaba/{self.id}.jspx"
    
class Murojaat(models.Model):
    fio = models.CharField(max_length=50, verbose_name='Familiya Ismingiz')
    telefon = models.CharField(max_length=50)
    viloyat = models.ForeignKey('Viloyatlar', on_delete=models.DO_NOTHING, db_column='viloyat')
    time = models.DateTimeField(db_comment="Yaratish (o'zgartirish) vaqti", auto_now_add=True)

    class Meta:
        managed = True
        db_table = 'murojaat'
        verbose_name = "Murojaat"
        verbose_name_plural = "Murojaatlar"

    def __str__(self):
        return self.fio
    
class Sozlamalar(models.Model):
    sozlama_nomi = models.CharField(max_length=50)
    kodi = models.IntegerField()
    holati = models.BooleanField()

    class Meta:
        managed = True
        db_table = 'sozlamalar'
        verbose_name = 'Sozlama'
        verbose_name_plural = 'Sozlamalar'

    def __str__(self):
        return self.sozlama_nomi

class Comments(models.Model):
    talaba = models.ForeignKey(Talaba, on_delete=models.CASCADE)
    ismingiz = models.CharField(max_length=50)
    izoh = models.TextField()
    sanasi = models.DateTimeField(auto_now_add = True)
    published = models.BooleanField(default = False)
    
    STATUS_CHOICES = [
        (0, 'Zo`r'),
        (1, 'O`rtacha'),
        (2, 'Qoniqarsiz'),
    ]
    
    bahosi = models.IntegerField(choices=STATUS_CHOICES, default=0)

    class Meta:
        managed = True
        db_table = 'comments'
        verbose_name_plural = 'Izohlar'

    def __str__(self):
        return self.izoh
    
#class Qarindosh(models.Model):
    #talaba = models.ForeignKey(Talaba, on_delete=models.CASCADE)
    #fish = models.CharField(max_length=100)
    #telefon = models.CharField(max_length=30)

class Qarindosh(models.Model):
    talaba = models.ForeignKey(Talaba, on_delete=models.CASCADE)
    fish = models.CharField(max_length=100)
    telefon = models.CharField(max_length=100)

    class Meta:
        managed = True
        db_table = 'qarindosh'
        verbose_name_plural = 'Qarindoshlar'

    def __str__(self):
        return self.fish

class PageVisits(models.Model):
    ip_address = models.TextField(editable=False)
    path = models.TextField(editable=False)
    username = models.TextField(editable=False)
    time = models.DateTimeField(auto_now_add=True, editable=False)

    class Meta:
        managed = True
        db_table = 'page_visits'

class Maktablar(models.Model):
    hudud = models.TextField(blank=True, null=True) 
    tuman = models.TextField(blank=True, null=True) 
    maktab = models.TextField(blank=True, null=True)
    sinf = models.TextField(blank=True, null=True)  
    fish = models.TextField(blank=True, null=True)  
    id = models.TextField(primary_key=True)
    stir = models.TextField(blank=True, null=True)  

    class Meta:
        managed = False
        db_table = 'maktablar'

class Stir(models.Model):
    stir = models.TextField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'stir'