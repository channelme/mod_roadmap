{% extends "roadmap/base.tpl" %}

{% block roadmap_title %}
    {% include "roadmap/_item_meta.tpl" id=id %}
    <h1>{{ m.rsc[id].title }}</h1>
{% endblock %}

{% block main %}
    <article class="roadmap-article">
        {% block below %}
    	    {{ m.rsc[id].body | show_media }}
    	{% endblock %}
    </article>
    
	{% include "_blocks.tpl" %}

    {% block comments %}
	    <section id="comments">{% include "roadmap/_item_comments.tpl" id=id %}</section>
	{% endblock %}
	
	{# include "roadmap/_article_prevnext.tpl" id=id #}

{% endblock %}

{#
{% block subnavbar %}
	{% include "blog/_article_sidebar.tpl" %}
{% endblock %}
#}