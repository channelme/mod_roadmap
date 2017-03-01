{% extends "roadmap/base.tpl" %}



{% block main %}
    {% cache 600 if_anonymous cat='roadmap_item' %}
<div class="wrapper-roadmap">
<div class="container">
    <div class="row">
		<div class="list col-sm-4">
			<div class="list header"><h2>{_ New Ideas _}</h2></div>
			{% with m.search.paged[{query cat=`roadmap_item` custompivot="mod_roadmap" 
			     filter=["pivot1.is_feedback_needed", `=`, 1] 
				 filter=["pivot1.is_planned", `=`, 0] 
			     filter=["pivot1.is_released", `=`, 0] 
			     sort='-publication_start' page=q.page pagelen=m.config.site.pagelen.value|default:10}]  as result %}
			{% for id in result %}
			<div class="panel panel-default">
				{% include "roadmap/_roadmap_item_summary.tpl" id=id %}
			</div>
                        {% empty %}
                            <p>{_ There are no released new roadmap items _}</p>
			{% endfor %}
			{% endwith %}
		</div>
		<div class="list col-sm-4">
			<div class="list header"><h2>{_ Planned Items _}</h2></div>
			{% with m.search.paged[{query cat=`roadmap_item` custompivot="mod_roadmap" 
			    filter=["pivot1.is_planned", `=`, 1] 
				filter=["pivot1.is_released", `=`, 0] 
				sort='-planned_date_start' page=1 pagelen=m.config.site.pagelen.value|default:10}]  as result %}
			{% for id in result %}
			    <div class="panel panel-default">
					{% include "roadmap/_roadmap_item_summary.tpl" id=id %}
				</div>
                        {% empty %}
                            <p>{_ There are no planned roadmap items _}</p>
			{% endfor %}
			{% endwith %}
		</div>
		<div class="list col-sm-4">
			<div class="list header"><h2>{_ Released Items _}</h2></div>
			{% with m.search.paged[{query cat=`roadmap_item` custompivot="mod_roadmap" 
			    filter=["pivot1.is_released", `=`, 1] 
			    sort="-release_date" page=1 pagelen=m.config.site.pagelen.value|default:10}]  as result %}
			{% for id in result %}
			    <div class="panel panel-default">
		            {% include "roadmap/_roadmap_item_summary.tpl" id=id %}
				</div>
                        {% empty %}
                            <p>{_ There are no released roadmap items _}</p>
			{% endfor %}
			{% endwith %}
		</div>
    </div>
    </div>
    </div>	
	{% endcache %}
{% endblock %}

{% block subnavbar %}
	{% include "roadmap/_item_sidebar.tpl" %}
{% endblock %}
