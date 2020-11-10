{strip}

<!-- Footer.Start -->
<footer id="footer" class="footer">
	<div class="row row-1">
		<div class="container">
			<div class="col col-1">
				<div class="box">
					<div class="box_title">{sprintf(lang('footer_msg_title', 'theme_auzwow'), $serverName)}</div>
					<div class="box_content">{$footer['text'][lang('abbreviation', 'main')]}</div>
				</div>
			</div>

			<div class="col col-2">
				<div class="box">
					<div class="box_title">{sprintf(lang('footer_nav_title', 'theme_auzwow'), $serverName)}</div>
					<div class="box_content">
						<ul class="footer_nav">
							{foreach from=$menu_side key=key item=foot_nav}
								<li><a {$foot_nav.link} class='nav_item {if preg_match("%{preg_quote($pageURL)}%i", $foot_nav.link)}nav_active{/if} {if !isset($menu_side[$key + 1])}nav_last{/if}'>{$foot_nav.name}</a></li>
							{/foreach}
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row row-2">
		<a href="#top" class="nice_button nice_active_2 back-to-top"></a>

		<div class="container">
			<div class="col col-1">
				<span class="zafire">{lang('footer_zafire', 'theme_auzwow')}</span>
				<span class="darksider">{lang('footer_darksider', 'theme_auzwow')}</span>
			</div>

			<div class="col col-2">
				<span class="copyright">{sprintf(lang('footer_copyright', 'theme_auzwow'), $serverName)} <i>{$footer['since']} - {date('Y')}</i></span>
			</div>
		</div>
	</div>
</footer>
<!-- Footer.End -->

{/strip}