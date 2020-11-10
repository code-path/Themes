{strip}

<nav id="my-menu" style="display:none">
	<ul>
		{foreach from=$menu_top item=menu}
			{$menu.name = explode('[|]', $menu.name)}
			<li><a {$menu.link} class='nav_item type-menu {if preg_match("%{preg_quote($pageURL)}%i", $menu.link)}nav_active{/if}'>{if count($menu.name) == 2}{$menu.name[1]}{else}{$menu.name}{/if}</a></li>
		{/foreach}
	</ul>
</nav>

{/strip}