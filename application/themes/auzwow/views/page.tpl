{strip}

{include file="{$theme_path}config/global.tpl" scope="parent"}
{$pageName = $CI->router->fetch_class()}
<style type="text/css" id="page-css">.announcement{ display:none}{if in_array($pageName, $full_width_pages)}.sidebar{ display:none}.mainside{ width:100%;float:none}.mainside .page .page_body{ padding:0}{/if}</style>
<div id="page_{$pageName}" class="page page_{$pageName}">
	<div class="content_header dotted_separator self_clear">
		<div class="content_header-left wide"><span class="content_header-title overflow_ellipsis"><i class="icon icon-pageinfo"></i> {if (strpos($headline, '</span>') === false) && (strpos($headline, ' ') !== false)}{'<i>'|cat:substr_replace($headline, '</i>', strpos($headline, ' '), 0)}{else}{$headline}{/if}</span></div>
	</div>

	<div class="page_body border_box self_clear">{$content}</div>
</div>

<script type="text/javascript">
	if(typeof CustomJS !== 'undefined')
		CustomJS.initialize();
</script>

{/strip}