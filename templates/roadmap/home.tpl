{% extends "roadmap/base.tpl" %}

{% block title %}{{ m.rsc[id].title }}{% endblock %}

{% block main %}
    {% include "roadmap/_home.tpl" %}
{% endblock %}

{% block subnavbar %}
    {% include "roadmap/_item_sidebar.tpl" %}
{% endblock %}
