{# Cache the sidebar, depending on the stuff in the 'article' category #}
{% cache 3600 cat='roadmap_item' %}

{# TODO add some navigation #}

{% include "_edit_button.tpl" %}

{% endcache %}