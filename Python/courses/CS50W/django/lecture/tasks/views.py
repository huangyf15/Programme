from django import forms
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse

## TODO:
# fix TypeErrors when running {% url 'tasks:add' %} in index.html

class NewTaskForm(forms.Form):
  task = forms.Field(label="New Task")

# Create your views here.
def index(request):
  if "tasks" not in request.session:
    request.session["tasks"] =[]
  return render(request, "tasks/index.html", {
    "tasks": request.session["tasks"]
  })

def add(request):
  if request.method == "POST":
    form = NewTaskForm(request.POST)
    if form.is_valid():
      task = form.cleaned_data["task"]
      request.session["tasks"] += [task]
      return HttpResponseRedirect('/tasks/')
    else:
      return render(request, "tasks/add.html", {
        "form": form
      })
  return render(request, "tasks/add.html", {
    "form": NewTaskForm()
  })
