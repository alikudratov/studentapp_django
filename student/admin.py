from django.contrib import admin
from import_export.admin import ExportActionMixin
from .models import Guruh, Jinsi, Viloyatlar, Talaba, Murojaat, Fanlar, Sozlamalar, Comments, Profile
from django.utils.html import format_html
import admin_thumbnails


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
        return qs.filter(created_by=request.user)

    list_filter = ["jinsi", "viloyat", "fanlar"]
    list_display = ["fullname", "guruh", "telefon_raqami", "viloyat", "talaba_rasmi"]
    search_fields = ["familiya", "ism", "otasining_ismi"]
    radio_fields = {"jinsi": admin.HORIZONTAL}
    #autocomplete_fields = ["viloyat", "fanlar"]
    readonly_fields = ['created_by']
    filter_horizontal = ['fanlar']
    prepopulated_fields = {"slug": ["familiya","ism","otasining_ismi"]}
    date_hierarchy = "tavallud_kuni"
    save_on_top = True
    #raw_id_fields = ["fanlar"]
    ordering = ['id']
    list_per_page = 3

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
    readonly_fields = ['talaba_id']


admin.site.register(Comments, CommentsAdmin)

class ProfileAdmin(admin.ModelAdmin):
    list_display = ['foydalanuvchi', 'lavozimi', 'tavallud_kuni']

admin.site.register(Profile, ProfileAdmin)