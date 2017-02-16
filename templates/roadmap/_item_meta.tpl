<small>{{ m.rsc[id].publication_start|date:"j F Y"}}
    {% if m.rsc[id].author.id %}{_ written by _} <a href="{% url blog_author id=m.rsc[id].author.id %}">{{ m.rsc[id].author.title }}</a>{% endif %}
    {% if m.rsc[id].is_released %}
        <span class="label label-success">{_ released at _} {{ m.rsc[id].release_date|date:"j F Y"}}</span>
    {% elif m.rsc[id].is_planned %}
        <span class="label label-info">{_ planned from _} {{ m.rsc[id].planned_date_start|date:"j F Y"}}</span>
    {% endif %}
    {% with m.comment.rsc[id] as feedback %}
        <span class="label label-info">{_ Feedback _} <span class="badge">{{ feedback | length }}</span> </span>
    {% endwith %}
</small>
{% include "_edit_button.tpl" %}