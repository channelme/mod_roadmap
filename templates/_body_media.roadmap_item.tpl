{% ifequal align "block" %}
	{% ifequal m.rsc[id].medium.mime "text/html-video-embed" %}
		<section class="video-wrapper">
			{% media m.rsc[id].medium %}
		</section>
	{% else %}
		<figure class="image-wrapper block-level-image">
			{% media m.rsc[id].medium mediaclass="roadmap_article" alt=m.rsc[id].title %}
			{% with id|summary as summary %}{% if summary %}<small class="muted image-caption">{{ summary }}</small>{% endif %}{% endwith %}
		</figure>
	{% endifequal %}
{% else %}
    <figure class="image-wrapper block-level-image">
    	{% media m.rsc[id].medium mediaclass="roadmap_article" alt=m.rsc[id].title %}
    	{% with id|summary as summary %}{% if summary %}<small class="muted image-caption">{{ summary }}</small>{% endif %}{% endwith %}
    </figure>
{% endifequal %}