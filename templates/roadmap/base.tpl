{% extends "base.tpl" %}

{% block above %}
    <div class="page-title row-fluid">
        <div class="span12">
            {% block roadmap_title %}{% endblock %}
        </div>
    </div>
{% endblock %}

{% block sidebar %}
    {% include "roadmap/_sidebar.tpl" %}
{% endblock %}

{% block html_head_extra %}
    {% lib
        "css/z.modal.css"

        "css/mod_roadmap.css"
    %}
{% endblock %}