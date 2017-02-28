 {% lib "components/bubble.css" %}
 
<li {% ifequal comment.user_id creator_id %}class="comment-author"{% endifequal %} {% if hidden %}style="display: none"{% endif %} id="comment-{{ comment.id }}">
	<!--	<span class="pull-left">{% include "_comment_avatar.tpl" size=28 %}</span>-->
	<p>
		<span class="bubble left"><span class="bubble-text">
			<strong><a name="#comment-{{ comment.id }}"></a>{{ comment.name|default:m.rsc[comment.user_id].title }}</strong><br>
			{{ comment.message }}
			<small class="text-muted">{_ Posted _} {{ comment.created|timesince }}.</small>
		</span></span>
	</p>
</li>