{% extends "admin_edit_widget_std.tpl" %}

{% block widget_title %}
{_ Roadmap Item _} 
<div class="widget-header-tools">
    <a href="javascript:void(0)" class="z-btn-help do_dialog" data-dialog="title: '{_ Help about roadmap items. _}', text: '{_  Roadmap items can be planned, released or marked to get feedback. _}'" title="{_ Need more help? _}"></a>
</div>
{% endblock %}

{% block widget_show_minimized %}false{% endblock %}
{% block widget_id %}sidebar-roadmap-item{% endblock %}

{% block widget_content %}
{% if m.acl.is_allowed.use.mod_roadmap %}
{% with m.rsc[id] as r %}

<div class="form-group">
    <label for="is_feedback_needed" class="checkbox-inline">
        <input type="checkbox" id="is_feedback_needed" name="is_feedback_needed" value="1" {% if r.is_feedback_needed %}checked{% endif %} />
        {_ Feedback Needed _}
    </label>
    <label for="is_planned" class="checkbox-inline">
        <input type="checkbox" id="is_planned" name="is_planned" value="1"   {% if r.is_planned %}checked{% endif %} />
        {_ Is Planned _}
    </label>
    <label for="is_released" class="checkbox-inline">
        <input type="checkbox" id="is_released" name="is_released" value="1" {% if r.is_released %}checked{% endif %} />
        {_ Is Released _}
    </label>
</div>

<hr /> {# Planned start and end-dates #}

<div class="planned-date-range">
    <fieldset>
        <div class="row">
            <div class="col-md-6">
                <div>
                    <label class="control-label">{_ Planned from _}</label>
                    <div>
                        {% include "_edit_date.tpl" date=id.planned_date_start name="planned_date_start" is_end=0 %}
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <label class="control-label">{_ Planned till _}</label>
                    <div>
                        {% include "_edit_date.tpl" date=id.planned_date_end name="planned_date_end" is_end=1 %}
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
</div>

<hr /> {# Release date #}

<div class="release-date">
    <fieldset>
        <div class="row">
            <div class="col-md-6"> 
                <div>
                    <label class="control-label">{_ Release Date _}</label>
                        <div>
                            {% include "_edit_date.tpl" date=id.release_date name="release_date" %}
                        </div> 
                    </div> 
                </div>
            </div>
       </fieldset>
</div>

{% endwith %}
{% endif %}
{% endblock %}