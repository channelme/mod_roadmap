{% ifequal align "block" %}
	{% ifequal m.rsc[id].medium.mime "text/html-video-embed" %}
		<section class="video-wrapper">
			{% media m.rsc[id].medium %}
		</section>
	{% else %}
		<figure class="image-wrapper block-level-image">
                    {% media m.rsc[id].medium width=size.width height=size.height mediaclass=("roadmap_thumb_" ++ sizename) alt=m.rsc[id].title class=("do_thumbviewer " ++ align) link=link %}
			{% with id|summary as summary %}{% if summary %}<small class="muted image-caption">{{ summary }}</small>{% endif %}{% endwith %}
		</figure>

	{% endifequal %}

{% else %}
        {% media m.rsc[id].medium mediaclass=("roadmap_thumb_" ++ sizename) width=size.width height=size.height alt=m.rsc[id].title class=("do_thumbviewer " ++ align) link=link %}
{% endifequal %}
