<div>
	<small>{{ m.rsc[id].publication_start|date:"j F Y"}}</small>

    {% if m.rsc[id].author.id %}{_ written by _} <a href="{% url blog_author id=m.rsc[id].author.id %}">{{ m.rsc[id].author.title }}</a>{% endif %}
    {% if m.rsc[id].is_released %}
        <small><span class="label label-success">{_ released at _} {{ m.rsc[id].release_date|date:"j F Y"}}</span></small>
    {% elif m.rsc[id].is_planned %}
        <small><span class="label label-info">{_ planned from _} {{ m.rsc[id].planned_date_start|date:"j F Y"}}</span></small>
    {% endif %}
    {% with m.comment.rsc[id] as feedback %}
        <small><span class="label label-info">{_ Feedback _} <span class="badge">{{ feedback | length }}</span> </span></small>
    {% endwith %}
</div>
{% include "_edit_button.tpl" %}