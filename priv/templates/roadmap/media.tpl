{% extends "blog/item.tpl" %}

{% block below_summary %}
    {% if m.rsc[id].depiction %}
        <figure class="image-wrapper block-level-image">
            {% media m.rsc[id].depiction mediaclass="blog_media" alt=m.rsc[id].title %}
        </figure>
    {% endif %}
{% endblock %}

{% block comments %}{% endblock %}