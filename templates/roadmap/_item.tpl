<article class="roadmap-article">
        {% block below %}
    	    {{ m.rsc[id].body | show_media }}
    	{% endblock %}
    </article>
    
	{% include "_blocks.tpl" %}

    {% block comments %}
	    <section id="comments">{% include "roadmap/_item_comments.tpl" id=id %}</section>
	{% endblock %}