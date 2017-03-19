{%
    with m.rsc[id].media[1],
    m.rsc[id].summary|striptags,
    m.rsc[id].body|striptags|truncate:300
    as
    image_id,
    summary,
    excerpt
%}
<a href="{% url roadmap_item id=id slug=m.rsc[id].slug %}">
	<div class="panel-body">
		<h3>
			{{ m.rsc[id].title }}
		</h3>
		<p>
			{{ summary|default:excerpt }}
		</p>
		
		{% if image_id %}
			{% image m.rsc[id].media[1] mediaclass="roadmap_summary" class="img-responsive" %}
		{% endif %}
		<hr>
		{% include "roadmap/_item_meta.tpl" %}
		
	</div>
</a>
{% endwith %}