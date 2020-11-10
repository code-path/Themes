{strip}

<!-- Sidebar -->
<aside id="left" class="sidebar">
	{if $social['facebook']['enabled'] || $social['twitter']['enabled'] || $social['youtube']['enabled']}{include file="{$theme_path}views/parts/socials.tpl"}{/if}

	{foreach from=$sideboxes key=key item=sidebox}
		{$row = $CI->db->query("select type from sideboxes where displayName like '%{$sidebox.name}%' limit 1")->row()}
		{if $row->type == 'status' || $row->type == 'online_players_extended'}{continue}{/if}
		<section {if $row->type != 'custom'}id="sidebox_{$row->type}"{/if} class="sidebox {if $row->type == 'custom'}custom{/if} {if !isset($sideboxes[$key + 1])}lastrow{/if}">
			<h4 class="sidebox_title dotted_separator border_box">{if (strpos($sidebox.name, ' ') !== false)}{substr_replace($sidebox.name, '<i>', strpos($sidebox.name, ' ') + 1, 0)|cat:'</i>'}{else}{$sidebox.name}{/if}</h4>
			<div class="sidebox_body">{$sidebox.data}</div>
		</section>
	{/foreach}
</aside>
<!-- Sidebar.End -->

{/strip}