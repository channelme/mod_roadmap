{% with m.comment.rsc[id] as feedback %}
{% if feedback %}

<h2>{_ Feedback _}</h2>
{% with m.rsc[id].creator_id as creator_id %}
<ul id="comments-list" class="comments-list">
{% for comment in feedback %}
   {% if comment.is_visible %}
      {% include "_comments_comment.tpl" %}
   {% endif %}
{% endfor %}
</ul>
{% endwith %}

{% endif %}
{% if m.rsc[id].is_feedback_needed %}
    {% include "_comments_form.tpl" %}
{% else %}
   <p>{_ Comments are closed _}</p>
{% endif %}
{% endwith %}
