from django.shortcuts import render
import requests
from django.http import JsonResponse

def home(request):
    return render(request, "index.html")

def api(request):
    try:
        response = requests.get("https://jsonplaceholder.typicode.com/posts")
        response.raise_for_status()
        data = response.json()
        return JsonResponse(data, safe=False)
    except requests.exceptions.RequestException as e:
        return JsonResponse({"error": str(e)}, status=500)
