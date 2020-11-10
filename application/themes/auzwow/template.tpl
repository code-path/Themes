{include file="{$theme_path}views/header.tpl" scope="parent"}
	<body class="theme_auzwow">
		{$pageURL = $url|cat:$CI->router->fetch_class()}{if !empty($CI->uri->segment(2))}{$pageURL = $pageURL|cat:'/'|cat:$CI->uri->segment(2)}{/if}

		{if $responsive}{include file="{$theme_path}views/parts/mobile/menu.tpl"}<div id="my-page">{/if}

		{$modals}

		{include file="{$theme_path}views/parts/topbar.tpl"}

		{include file="{$theme_path}views/parts/header.tpl"}

		{include file="{$theme_path}views/parts/slider.tpl"}

		{include file="{$theme_path}views/parts/content.tpl"}

		{include file="{$theme_path}views/parts/footer.tpl"}

		{if $responsive}</div>{/if}

		<!-- Needed Footer JS.Start -->
		<script type="text/javascript" src="{$url}application/{$theme_path}includes/min/b=application/{$theme_path}js&amp;f=selectbox.min.js,icheck.min.js{if $welcome_box['enabled'] || $responsive},jquery.mCustomScrollbar.min.js{/if}{if $countdown['enabled']},jquery.countdown.min.js{/if}{if $responsive},jquery.mmenu.min.js{/if},footer_include.js"></script>
		<!-- Needed Footer JS.End -->

		<script type="text/javascript">
			if(typeof CustomJS !== 'undefined')
				CustomJS.initialize();
		</script>
	</body>
</html>