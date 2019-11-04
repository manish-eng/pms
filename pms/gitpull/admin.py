from django.contrib import admin
from gitpull.models import GitPull

class GitPullAdmin(admin.ModelAdmin):
    list_display=["username","password"]

admin.site.register(GitPull,GitPullAdmin)
