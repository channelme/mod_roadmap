{% if m.rsc[id].is_feedback_needed %}
    {% include "_comments.tpl" id=id %}
{% endif %}