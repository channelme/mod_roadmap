<div>
    {% if m.rsc[id].author.id %}
        {_ written by _} <a href="{% url blog_author id=m.rsc[id].author.id %}">{{ m.rsc[id].author.title | default:_"Anonymous" }}</a>
    {% endif %}
    {% if m.rsc[id].is_released %}
        <span class="label label-success">{{ m.rsc[id].release_date|date:"F Y"}}</span>
    {% elif m.rsc[id].is_planned %}
        <span class="label label-info">{{ m.rsc[id].planned_date_end|date:"F Y"}}</span>
    {% endif %}
    {% with m.comment.rsc[id] as feedback %}
        <span class="label label-default">{_ Feedback _} ({{ feedback | length }})</span>
    {% endwith %}
</div>
{% include "_edit_button.tpl" %}
