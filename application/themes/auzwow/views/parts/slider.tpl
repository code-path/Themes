{strip}

<!-- Slider/Welcome.Start -->
<div id="slider_welcome" class="slider_welcome" {if !$show_slider}style="display:none"{/if}>
	<div class="container vertical_center">
		<!-- Slider.Start -->
		<div id="slider_container" class="slider_container {if !$welcome_box['enabled']}wide{/if} border_box anti_blur">
			<div id="slider">
				{foreach from=$slider key=key item=image}
					{$image.text = explode('[|]', $image.text)}
					<img src="{$image.image}" width="722" height="326" alt="{reset($image.text)}" title="<span>{reset($image.text)} <i>{next($image.text)}</i></span><a href='{$image.link}'>{next($image.text)}</a>" {if $key != 0}style="display:none"{/if} />
				{/foreach}
			</div>

			<div id="slider_buttons" class="slider_buttons vertical_center"></div>
		</div>
		<!-- Slider.End -->

		{if $welcome_box['enabled']}{include file="{$theme_path}views/parts/welcome_box.tpl"}{/if}
	</div>
</div>
<!-- Slider/Welcome.End -->

{/strip}