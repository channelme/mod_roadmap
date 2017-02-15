{% extends "roadmap/base.tpl" %}

{% block roadmap_title %}
    {% include "roadmap/_item_meta.tpl" id=id %}
    <h1>{{ m.rsc[id].title }}</h1>
{% endblock %}

{% block main %}
    {% cache 600 cat='roadmap_item' %}
    <div class="row">
		<div class="col-md-4">
			{_ New _}
			{% with m.search.paged[{query cat=`roadmap_item` custompivot="mod_roadmap" 
			     filter=["pivot1.is_feedback_needed", `=`, 1] 
				 filter=["pivot1.is_planned", `=`, 0] 
			     filter=["pivot1.is_released", `=`, 0] 
			     sort='-publication_start' page=q.page pagelen=m.config.site.pagelen.value|default:10}]  as result %}
			{% for id in result %}
			<div class="panel panel-default">
					<div class="panel-body">
			            {% include "roadmap/_roadmap_item_summary.tpl" id=id %}
					</div>
			</div>
			{% endfor %}
			{% endwith %}
		</div>
		<div class="col-md-4">
			{_ Planned Items _}
			{% with m.search.paged[{query cat=`roadmap_item` custompivot="mod_roadmap" 
			    filter=["pivot1.is_planned", `=`, 1] 
				filter=["pivot1.is_released", `=`, 0] 
				sort='-planned_date_start' page=1 pagelen=m.config.site.pagelen.value|default:10}]  as result %}
			{% for id in result %}
			    <div class="panel panel-default">
					<div class="panel-body">
			           {% include "roadmap/_roadmap_item_summary.tpl" id=id %}
					</div>
				</div>
			{% endfor %}
			{% endwith %}
		</div>
		<div class="col-md-4">
			{_ Released Items _}
			{% with m.search.paged[{query cat=`roadmap_item` custompivot="mod_roadmap" 
			    filter=["pivot1.is_released", `=`, 1] 
			    sort="-release_date" page=1 pagelen=m.config.site.pagelen.value|default:10}]  as result %}
			{% for id in result %}
			    <div class="panel panel-default">
					<div class="panel-body">
			            {% include "roadmap/_roadmap_item_summary.tpl" id=id %}
				    </div>
				</div>
			{% endfor %}
			{% endwith %}
		</div>
    </div>
	{% endcache %}
{% endblock %}

{% block subnavbar %}
	{% include "roadmap/_item_sidebar.tpl" %}
{% endblock %}