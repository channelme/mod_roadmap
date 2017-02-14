{% extends "base.tpl" %}

{% block banner %}
    <div class="page-title row-fluid">
        <div class="span12">
            {% block roadmap_title %}{% endblock %}
        </div>
    </div>
{% endblock %}

{% block subnavbar %}
    {% include "roadmap/_sidebar.tpl" %}
{% endblock %}

{% block html_head_extra %}
    {% lib
        "css/mod_roadmap.css"
    %}
{% endblock %}