{% ifequal align "block" %}
        <span>block</span>


	{% ifequal m.rsc[id].medium.mime "text/html-video-embed" %}
		<section class="video-wrapper">
			{% media m.rsc[id].medium %}
		</section>
	{% else %}

		<figure class="image-wrapper block-level-image">
                    {% media m.rsc[id].medium mediaclass=("roadmap_thumb_" ++ sizename) alt=m.rsc[id].title class=align link=link %}
			{% with id|summary as summary %}{% if summary %}<small class="muted image-caption">{{ summary }}</small>{% endif %}{% endwith %}
		</figure>

	{% endifequal %}

{% else %}
{% media m.rsc[id].medium mediaclass=("roadmap_thumb_" ++ sizename) alt=m.rsc[id].title class=align link=link %}
{% endifequal %}
