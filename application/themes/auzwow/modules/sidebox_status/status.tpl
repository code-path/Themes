{include file="{$theme_path}config/global.tpl" scope="parent"}

{foreach from=$realms key=key item=realm}
	{$realmId  = $realm->getId()}
	{$realmEmu = strtolower(get_class($realm->getEmulator()))}

	{if in_array($realmEmu, array('mangoszero_ra', 'mangoszero_soap'))}
		{$realmEmu = 'Vanilla'}
	{else if in_array($realmEmu, array('oregoncore_ra', 'oregoncore_soap', 'trinity_tbc_ra', 'trinity_tbc_soap', 'trinity_tbc_external', 'blizzlikecore_ra', 'blizzlikecore_soap', 'summitemu'))}
		{$realmEmu = 'TBC'}
	{else if in_array($realmEmu, array('trinity_ra', 'trinity_soap', 'trinity_rbac_ra', 'trinity_rbac_soap', 'mangos_ra', 'mangos_soap', 'mangosr2_ra', 'mangosr2_soap', 'arcemu'))}
		{$realmEmu = 'WoTLK'}
	{else if in_array($realmEmu, array('skyfire_ra', 'skyfire_soap', 'arkcore_ra', 'arkcore_soap', 'trinity_rbac_cata_ra', 'trinity_rbac_cata_soap'))}
		{$realmEmu = 'Cataclysm'}
	{/if}

	<div id="realm_{$realmId}" class="realm_{$realmId} realm_holder {strtolower($realmEmu)} {if $realm->isOnline()}online{else}offline{/if}" {if $key != 0}style="display:none"{/if}>
		<div class="realm_row row-1 border_box">
			<span class="r_name overflow_ellipsis" title="{$realm->getName()}">{if (strpos($realm->getName(), ' ') !== false)}{substr_replace($realm->getName(), '<i>', strpos($realm->getName(), ' ') + 1, 0)|cat:'</i>'}{else}{$realm->getName()}{/if}</span>
			<span class="r_status">{if $realm->isOnline()}{lang('global_online', 'theme_auzwow')}{else}{lang('global_offline', 'theme_auzwow')}{/if}</span>
		</div>

		<div class="realm_row row-2 border_box">
			<span class="r_statistics overflow_ellipsis" title="{if $realm->isOnline()}{$realm->getOnline()} {lang('sidebox_status_onlineplayers', 'theme_auzwow')}{else}{lang('global_offline', 'theme_auzwow')}{/if}">{if $realm->isOnline()}<i>{$realm->getOnline()}</i> {lang('sidebox_status_onlineplayers', 'theme_auzwow')}{else}{lang('global_offline', 'theme_auzwow')}{/if}</span>
		</div>

		<div class="realm_row row-3 border_box">
			<span class="r_list overflow_ellipsis" title="{lang('sidebox_status_setrealmlist', 'theme_auzwow')} {$realmlist}">{lang('sidebox_status_setrealmlist', 'theme_auzwow')} <i>{$realmlist}</i></span>
			{if isset($realm_desc[$realmId])}<span class="r_desc overflow_ellipsis" title="{preg_replace('/<[^>]*>/', '', $realm_desc[$realmId])}">{$realm_desc[$realmId]}</span>{/if}
		</div>
	</div>
{/foreach}

{if count($realms) > 1}
	<div class="realm_pagination">
		{foreach from=$realms key=key item=realm}
			<a {if $key == 0}class="active"{/if} onClick="CustomJS.switchRealm(this, '#realm_{$realm->getId()}')"></a>
		{/foreach}
	</div>
{/if}