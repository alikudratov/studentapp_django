# Generated by Django 4.2.7 on 2024-02-07 16:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Fanlar',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fanlar_nomi', models.CharField(max_length=50)),
            ],
            options={
                'verbose_name_plural': 'Fanlar',
                'db_table': 'fanlar',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Guruh',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('guruh_raqami', models.CharField(max_length=100)),
                ('guruh_rahbari', models.CharField(max_length=200)),
            ],
            options={
                'verbose_name': 'Guruh',
                'verbose_name_plural': 'Guruhlar',
                'db_table': 'guruh',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Jinsi',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('jins', models.CharField(max_length=5)),
            ],
            options={
                'verbose_name': 'Jins',
                'verbose_name_plural': 'Jinslar',
                'db_table': 'jinsi',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Viloyatlar',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('viloyat_nomi', models.CharField(max_length=100)),
            ],
            options={
                'verbose_name': 'Viloyat',
                'verbose_name_plural': 'Viloyatlar',
                'db_table': 'viloyatlar',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Talaba',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('familiya', models.CharField(max_length=50)),
                ('ism', models.CharField(max_length=50)),
                ('otasining_ismi', models.CharField(max_length=50)),
                ('tavallud_kuni', models.DateField()),
                ('yashash_manzili', models.CharField(max_length=200)),
                ('telefon_raqami', models.CharField(max_length=100)),
                ('fanlar', models.ManyToManyField(to='student.fanlar')),
                ('guruh', models.ForeignKey(db_column='guruh', on_delete=django.db.models.deletion.DO_NOTHING, related_name='all_students', to='student.guruh')),
                ('jinsi', models.ForeignKey(db_column='jinsi', on_delete=django.db.models.deletion.DO_NOTHING, to='student.jinsi')),
                ('viloyat', models.ForeignKey(db_column='viloyat', on_delete=django.db.models.deletion.DO_NOTHING, to='student.viloyatlar')),
            ],
            options={
                'verbose_name': 'Talaba',
                'verbose_name_plural': 'Talabalar',
                'db_table': 'talaba',
                'ordering': ['familiya'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Murojaat',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fio', models.CharField(max_length=50, verbose_name='Familiya Ismingiz')),
                ('telefon', models.CharField(max_length=50)),
                ('time', models.DateTimeField(auto_now_add=True, db_comment="Yaratish (o'zgartirish) vaqti")),
                ('viloyat', models.ForeignKey(db_column='viloyat', on_delete=django.db.models.deletion.DO_NOTHING, to='student.viloyatlar')),
            ],
            options={
                'verbose_name': 'Murojaat',
                'verbose_name_plural': 'Murojaatlar',
                'db_table': 'murojaat',
                'managed': True,
            },
        ),
    ]