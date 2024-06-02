from django.contrib import admin
from django.urls import path, include
from student.views import *

urlpatterns = [
    path('manager/', admin.site.urls),
    path('update_example', update_talaba),
    path('', index, name='index'),
    path('fanlar.jspx', fanlarpage),
    path('talaba/<int:id>.jspx', talabapage, name="talabalink"),
    path('webservice/<int:id>.jsondata', webservice, name = "webservice"),
    path('media/<path:filename>', download_file, name='download'),
    path('tinymce/', include('tinymce.urls')),
    path('talaba/<int:pk>/update/', TalabaUpdateView.as_view(), name='your_model_update'),
    #path('talaba/list/', TalabaListView.as_view(), name='talaba'),
    path('datatable', datatable),
    path('pdf', generate_pdf),
    path('qr_code/', include('qr_code.urls', namespace="qr_code")),
    path('login/',  login_view, name='login'),
    path('logout/', logout_view, name='logout'),

]

admin.site.site_header = "Talabalar MB"
admin.site.site_title = "Talabalar MB"
admin.site.index_title = "Talabalar MB"