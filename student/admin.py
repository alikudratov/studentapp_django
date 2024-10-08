from django.contrib import admin
from django.contrib.auth.models import Group
from import_export.admin import ExportActionMixin
from .models import *
from django.utils.html import format_html
import admin_thumbnails

from django.contrib.sessions.models import Session

admin.site.register(Session)

class QarindoshInline(admin.StackedInline):
    model = Qarindosh
    show_change_link = True
    can_delete = False
    max_num = 4

class CommentsInline(admin.TabularInline):
    model = Comments
    show_change_link = True
    can_delete = False
    max_num = 4
    readonly_fields = ['izoh']

def sozlama_off(modeladmin, request, queryset):
    for sozlama in queryset:
        sozlama.holati = False
        sozlama.save()
sozlama_off.short_description = 'Barcha sozlamalarni o`chirish'

# @admin_thumbnails.thumbnail('image')


class TalabaAdmin(ExportActionMixin, admin.ModelAdmin):
    
    def talaba_rasmi(self, obj):
        return format_html("<img style='border-radius:10px' height='100px' src='" + obj.image.url + "'/>")

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        # Check if the user is in a 'Rahbariyat'
        if request.user.groups.filter(id = 1).exists():
            # Default queryset if the user is in 'Rahbariyat'
            return qs
        else:
            # Modify queryset if not in the group
            return qs.filter(created_by=request.user)
        

    list_filter = ["jinsi", "viloyat", "fanlar"]

    def guruh_rahbari(self, obj):
        return obj.guruh.guruh_rahbari

    list_display = ["fullname", "guruh", "telefon_raqami", "viloyat", "guruh_rahbari"]
    search_fields = ["familiya", "ism", "otasining_ismi"]
    radio_fields = {"jinsi": admin.VERTICAL}
    #autocomplete_fields = ["viloyat", "fanlar"]
    readonly_fields = ['created_by']
    filter_horizontal = ['fanlar']
    fieldsets = [
            ('Asosiy', {'fields': ['familiya', 'ism', 'otasining_ismi', 'tavallud_kuni', 'yashash_manzili', 'telefon_raqami']}),
            ('Ikkinchi', {'fields': ['guruh', 'jinsi', 'viloyat', 'image', 'created_by', 'slug', 'fanlar']}),
                ]
    prepopulated_fields = {"slug": ["familiya","ism","otasining_ismi"]}
    date_hierarchy = "tavallud_kuni"
    save_on_top = True
    #raw_id_fields = ["fanlar"]
    ordering = ['id']
    #list_per_page = 3
    inlines = [
        QarindoshInline,
        CommentsInline,
    ]

class ViloyatlarAdmin(admin.ModelAdmin):
    search_fields = ["viloyat_nomi"]

class FanlarAdmin(admin.ModelAdmin):
    search_fields = ["fanlar_nomi"]
    list_display = ["fanlar_nomi", "pdf_fayl"]

class SozlamalarAdmin(admin.ModelAdmin):
    list_display = ["sozlama_nomi", "kodi", "holati"]
    list_editable = ['holati']
    list_filter = ['kodi']
    search_fields = ['sozlama_nomi']
    actions = [sozlama_off]

admin.site.register(Murojaat)
admin.site.register(Guruh)
admin.site.register(Jinsi)
admin.site.register(Viloyatlar,ViloyatlarAdmin)
admin.site.register(Talaba, TalabaAdmin)
admin.site.register(Fanlar, FanlarAdmin)
admin.site.register(Sozlamalar, SozlamalarAdmin)

class CommentsAdmin(admin.ModelAdmin):
    list_display = ['izoh', 'sanasi', 'published']
    list_filter = ['published']
    readonly_fields = ['talaba']


admin.site.register(Comments, CommentsAdmin)

class ProfileAdmin(admin.ModelAdmin):
    list_display = ['foydalanuvchi', 'lavozimi', 'tavallud_kuni']

admin.site.register(Profile, ProfileAdmin)

admin.site.register(Qarindosh)