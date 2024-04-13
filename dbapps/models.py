from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from django.core.validators import RegexValidator


class MyModel(models.Model):
    decimal_field = models.DecimalField(max_digits=10, decimal_places=2)
    duration_field = models.DurationField()
    email_field = models.EmailField()
    file_path_field = models.FilePathField(path="C:\ladies")
    float_field = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(100.0)])
    generic_ip_address_field = models.GenericIPAddressField(protocol='both')
    json_field = models.JSONField()
    url_field = models.URLField()
    uuid_field = models.UUIDField()

    def __str__(self):
        return f"Model ID: {self.id}, Decimal Field: {self.decimal_field}"