{strip}

<div class="main_b_holder">
	<div class="container">
		{if $announcement['enabled']}{include file="{$theme_path}views/parts/announcement.tpl"}{/if}
		{include file="{$theme_path}views/parts/columns.tpl"}
	</div>

	<div class="line_separator"></div>

	<div class="container">
		<div class="body_content self_clear">
			<!-- Body Content start here -->

			{include file="{$theme_path}views/parts/mainside.tpl"}

			{include file="{$theme_path}views/parts/sidebar.tpl"}

			<!-- Body Content ends here -->
		</div>
	</div>
</div>

{/strip}