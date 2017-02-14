<small class="muted">{{ m.rsc[id].publication_start|date:"j F Y"}}
{% if m.rsc[id].author.id %}{_ written by _} <a href="{% url blog_author id=m.rsc[id].author.id %}">{{ m.rsc[id].author.title }}</a>{% endif %}
</small>