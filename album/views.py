from django.shortcuts import render
from album.models import Albums

# Create your views here.
def index(request):
    albums = Albums.objects.all()
    return render(request, 'album/index.html', context=locals())

def detail(request, album_id):
    album = Albums.objects.get(pk=album_id)
    tracks = album.tracks.all()
    return render(request, 'album/detail.html', context=locals())
