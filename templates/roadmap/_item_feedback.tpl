{% if m.rsc[id].is_feedback_needed %}
<p>Feedback needed</p>
{% endif %}
{% include "roadmap/_feedback.tpl" id=id %}