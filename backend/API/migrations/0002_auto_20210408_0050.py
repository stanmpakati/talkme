# Generated by Django 3.1.7 on 2021-04-07 22:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('API', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='person',
            name='id',
        ),
        migrations.AlterField(
            model_name='person',
            name='username',
            field=models.CharField(max_length=20, primary_key=True, serialize=False),
        ),
    ]
