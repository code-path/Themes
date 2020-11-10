{strip}

<!-- Header.Start -->
<header id="header" class="header">
	<div class="container">
		<!-- Logo.Start -->
		<div class="logo_holder">
			<h1><a href="{$url}" class="logo" title="{sprintf(lang('logo_title', 'theme_auzwow'), $serverName)}">{$serverName}</a></h1>
		</div>
		<!-- Logo.End -->

		{* Initializing menus to bake them later *}
		{$menus = ['left' => null, 'right' => null]}

		{foreach from=$menu_top item=menu}
			{$menu.name = explode('[|]', $menu.name)}

			{if $menu.name[0] === 'L'}
				{capture assign=html}
					<li><a {$menu.link} class='nav_item type-menu {if preg_match("%{preg_quote($pageURL)}%i", $menu.link)}nav_active{/if}'>{$menu.name[1]}</a></li>
				{/capture}

				{$menus.left = $menus.left|cat:$html}
			{elseif $menu.name[0] === 'R'}
				{capture assign=html}
					<li><a {$menu.link} class='nav_item type-menu {if preg_match("%{preg_quote($pageURL)}%i", $menu.link)}nav_active{/if}'>{$menu.name[1]}</a></li>
				{/capture}

				{$menus.right = $menus.right|cat:$html}
			{/if}
		{/foreach}

		<!-- Navigation.Start -->
		<div class="navigation">
			<ul class="nav_menu left_area">{$menus.left}</ul>
			<ul class="nav_menu right_area">{$menus.right}</ul>
			{if $responsive}<ul class="nav_menu right_area mobile"><li><a href="#my-menu" class="nav_item type-toggle"></a></li></ul>{/if}
		</div>
		<!-- Navigation.End -->
	</div>
</header>
<!-- Header.End -->

{/strip}