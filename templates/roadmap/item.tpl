{% extends "roadmap/home.tpl" %}
{# The page looks like the homepage with a modal window over it. #}

{# Fake an open modal #}
{% block page_class %}modal-open{% endblock %}



{% block main %}
    {% inherit %}
	<div id="zmodal" class="modal" style="display: block; padding-right 14px; overflow-x: hidden; overflow-y: auto">
		<div class="modal-dialog" style="display: block; margin-top: 10px;">
			<div id="modal-content" class="modal-content">
			    <div class="modal-header">
				    <a class="close" href="{% url roadmap %}"><span>×</span></a>
                       <h4 class="modal-title">{{ m.rsc[id].title }}</h4>
                        <small>{% include "roadmap/_item_meta.tpl" id=id %}</small>
			    </div>
			    <div class="modal-body">
                    <article class="roadmap-item">
                       {% block summary %}
    	                   {{ m.rsc[id].summary }}
    	               {% endblock %}

                       {% block below_summary %}
    	                   {{ m.rsc[id].body|show_media:"_body_media.roadmap_item.tpl" }}
    	               {% endblock %}
                   </article>
    
	               {% include "_blocks.tpl" %}

                   {% block comments %}
	                   <section id="comments">{% include "roadmap/_item_feedback.tpl" id=id %}</section>
	               {% endblock %}
			    </div>
            </div>
		</div>
    </div>

	<div id="backdrop" class="modal-backdrop"></div>
{% endblock %}