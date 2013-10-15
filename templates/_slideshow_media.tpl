{# This template is used to show a slideshow with the {% media %} tag #}
{% with height|default:width as height %}
    {% if parts %}
        {% if parts|length == 1 %}
            <div class="slideshow-viewer {{ class }}" style="{{ style }}">
		        {% catinclude "_slideshow_part.tpl" parts[1]
			        width=width height=height
			        slide_width=slide_width slide_height=slide_height
			        start_id=start_id
		        %}
	    </div>
    {% else %}
	    <div class="slideshow-viewer do_slidesjs {{ class }}" data-slidesjs="width: {{ slide_width|default:width }}, height: {{ slide_height|default:height }}, play: { effect: 'slide', interval: {{ slide_timeout|default:(m.config.mod_slideshow.timeout.value)|default:2000 }}, auto: true, pauseOnHover: true }, effect: { slide: { speed: {{ slide_speed|default:(m.config.mod_slideshow.speed.value)|default:2000 }} } }, pagination: false" style="width: {{ slide_width|default:width }}px; height: {{ slide_height|default:height }}px; overflow: hidden">
			{% for p_id in parts|is_visible %}
				{% catinclude "_slideshow_part.tpl" p_id
					width=width height=height
					slide_width=slide_width slide_height=slide_height
					start_id=start_id
                    first=forloop.first
				%}
			{% endfor %}
		</div>
        <script type="text/javascript">
            $(function(){setTimeout(function() { $(".do_slidesjs").addClass("loaded"); }, 500);});
        </script>
    {% endif %}
</div>
{% endif %}
{% endwith %}
