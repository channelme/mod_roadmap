{% extends "roadmap/base.tpl" %}

{% block blog_title %}
    {% include "roadmap/_item_meta.tpl" id=id %}
    <h1>{{ m.rsc[id].title }}</h1>
{% endblock %}

{% block main %}

    <article class="roadmap-item">
        {% block below_summary %}
    	    {{ m.rsc[id].body|show_media }}
    	{% endblock %}
    </article>
    
	{% include "_blocks.tpl" %}

    {% block comments %}
	    <section id="comments">{% include "roadmap/_item_comments.tpl" id=id %}</section>
	{% endblock %}
	
	{% include "roadmap/_item_prevnext.tpl" id=id %}

{% endblock %}

{% block subnavbar %}
	{% include "roadmap/_item_sidebar.tpl" %}
{% endblock %}