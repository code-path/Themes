{strip}

<!-- Announcement.Start -->
<div id="announcement" class="announcement border_box">
	<i class="icon icon-dots"></i>
	<div class="ann_title"><span>{lang('announcement', 'theme_auzwow')}</span></div>
	<div class="ann_readmore"><a href="{$announcement['link']}">{lang('global_readmore', 'theme_auzwow')}</a></div>
	<div class="ann_text"><p title="{preg_replace('/<[^>]*>/', '', $announcement['text'][lang('abbreviation', 'main')])}">{$announcement['text'][lang('abbreviation', 'main')]}</p></div>
</div>
<!-- Announcement.End -->

{/strip}