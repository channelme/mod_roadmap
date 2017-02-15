{%
    with m.rsc[id].media[1],
    m.rsc[id].summary|striptags,
    m.rsc[id].body|striptags|truncate:300
    as
    image_id,
    summary,
    excerpt
%}
<h3><a href="{% url roadmap_item id=id slug=m.rsc[id].slug %}">{{ m.rsc[id].title }}</a></h3>
{% include "roadmap/_item_meta.tpl" %}
<p>
    {{ summary|default:excerpt }}
</p>
{% if image_id %}
    <a href="{% url roadmap_item id=id slug=m.rsc[id].slug %}">
        {% image m.rsc[id].media[1] mediaclass="roadmap_summary" %}
   </a>
{% endif %}
<p>
    <a class="btn btn-xs btn-default pull-right" href="{% url roadmap_item id=id slug=m.rsc[id].slug %}">{_ Read more _}</a>
</p>
{% endwith %}