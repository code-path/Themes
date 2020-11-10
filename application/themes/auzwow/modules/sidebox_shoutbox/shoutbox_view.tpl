<script type="text/javascript">
	var shoutCount    = {$count},
		shoutsPerPage = {$shoutsPerPage},
		currentShout  = 0,
		msg_short     = '{lang('shoutbox_msg_short', 'theme_auzwow')}',
		ago           = '{lang('ago', 'sidebox_shoutbox')}',
		view_profile  = '{lang('view_profile', 'sidebox_shoutbox')}',
		said          = '{lang('said', 'sidebox_shoutbox')}';

	{literal}
		var Shoutbox = {
			/**
			 * Load more shouts
			 * @param number
			 */
			load: function(number)
			{
				var element = $('#the_shouts');

				currentShout = number;

				element.slideUp(500, function()
				{
					$.get(Config.URL + 'sidebox_shoutbox/shoutbox/get/' + number, function(data)
					{
						element.html(data).slideDown(300);

						if(currentShout != 0)
							$('#shoutbox_newer').show();
						else
							$('#shoutbox_newer').hide();

						if(currentShout + shoutsPerPage >= shoutCount)
							$('#shoutbox_older').hide();
						else
							$('#shoutbox_older').show();
					});
				});
			},

			submit: function()
			{
				var message = $('#shoutbox_content');

				if(message.val().length == 0 || message.val().length > 255)
				{
					UI.alert(msg_short);
				}
				else
				{
					// Disable fields
					message.attr('disabled', 'disabled');
					$('#shoutbox_submit').attr('disabled', 'disabled');

					$.post(Config.URL + 'sidebox_shoutbox/shoutbox/submit', {message: message.val(), csrf_token_name: Config.CSRF}, function(data)
					{
						message.val('');
						message.removeAttr('disabled');
						$('#shoutbox_submit').removeAttr('disabled');
						$('#shoutbox_characters_remaining').html('0 / 255');

						var content = JSON.parse(data);

						$('#the_shouts').prepend('<div class="shout" id="my_shout_' + content.uniqueId + '" style="display:none">'+
												     '<span class="shout_date">' + content.time + ' ' + ago + '</span>' +
												     '<div class="shout_author"><a href="' + Config.URL + 'profile/' + content.id + '" data-tip="' + view_profile + '">' + content.name + '</a> ' + said + ':</div>' +
												     content.message +
												 '</div>');

						$('#my_shout_' + content.uniqueId).slideDown(300, function()
						{
							Tooltip.refresh();
						});
					});
				}
			},

			remove: function(field, id)
			{
				$(field).parent().parent().slideUp(150, function()
				{
					$(this).remove();
				});

				$.get(Config.URL + 'sidebox_shoutbox/shoutbox/delete/' + id, function(data)
				{
					console.log(data);
				});
			}
		};
	{/literal}
</script>

<div id="shoutbox">
	{if $logged_in}
		<form onSubmit="Shoutbox.submit(); return false">
			<textarea id="shoutbox_content" class="shoutbox_content border_box" placeholder="{lang('shoutbox_enter_msg', 'theme_auzwow')}" onkeyup="UI.limitCharacters(this, 'shoutbox_characters_remaining')" maxlength="255" spellcheck="false"></textarea>
			<div class="shout_characters_remaining"><span id="shoutbox_characters_remaining">0 / 255</span></div>
			<input type="submit" name="shoutbox_submit" value="{lang('shoutbox_btn', 'theme_auzwow')}" />
		</form>
	{else}
		<form onSubmit="UI.alert('{lang('shoutbox_login_to', 'theme_auzwow')}'); return false">
			<textarea id="shoutbox_content" class="shoutbox_content border_box" name="shoutbox_content" placeholder="{lang('shoutbox_login_to', 'theme_auzwow')}" disabled="disabled"></textarea>
			<div class="shout_characters_remaining"><span id="shoutbox_characters_remaining">0 / 255</span></div>
			<input type="submit" id="shoutbox_submit" value="{lang('shoutbox_btn', 'theme_auzwow')}" />
		</form>
	{/if}

	<div class="clear"></div>

	{if $shouts}<div class="side_divider"></div>{/if}

	<div id="the_shouts">{$shouts}</div>

	{if $count > $shoutsPerPage}
		<div id="shoutbox_view">
			<a href="javascript:void(0)" onClick="Shoutbox.load(currentShout - shoutsPerPage)" id="shoutbox_newer" style="display:none">{lang('shoutbox_newer', 'theme_auzwow')}</a>
			<a href="javascript:void(0)" onClick="Shoutbox.load(currentShout + shoutsPerPage)" id="shoutbox_older">{lang('shoutbox_older', 'theme_auzwow')}</a>
		</div>
	{/if}
</div>