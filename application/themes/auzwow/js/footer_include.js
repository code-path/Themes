/*
 CSS Browser Selector js v0.5.3 (July 2, 2013)

 -- original --
 Rafael Lima (http://rafael.adm.br)
 http://rafael.adm.br/css_browser_selector
 License: http://choosealicense.com/licenses/mit/
 Contributors: http://rafael.adm.br/css_browser_selector#contributors
 -- /original --

 Fork project: http://code.google.com/p/css-browser-selector/
 Song Hyo-Jin (shj at xenosi.de)
 */
function css_browser_selector(e){var i=e.toLowerCase(),r=function(e){return i.indexOf(e)>-1},t="gecko",o="webkit",a="safari",n="chrome",s="opera",d="mobile",c=0,l=window.devicePixelRatio?(window.devicePixelRatio+"").replace(".","_"):"1",p=[!/opera|webtv/.test(i)&&/msie\s(\d+)/.test(i)&&(c=1*RegExp.$1)?"ie ie"+c+(6==c||7==c?" ie67 ie678 ie6789":8==c?" ie678 ie6789":9==c?" ie6789 ie9m":c>9?" ie9m":""):/edge\/(\d+)\.(\d+)/.test(i)&&(c=[RegExp.$1,RegExp.$2])?"ie ie"+c[0]+" ie"+c[0]+"_"+c[1]+" ie9m edge":/trident\/\d+.*?;\s*rv:(\d+)\.(\d+)\)/.test(i)&&(c=[RegExp.$1,RegExp.$2])?"ie ie"+c[0]+" ie"+c[0]+"_"+c[1]+" ie9m":/firefox\/(\d+)\.(\d+)/.test(i)&&(re=RegExp)?t+" ff ff"+re.$1+" ff"+re.$1+"_"+re.$2:r("gecko/")?t:r(s)?s+(/version\/(\d+)/.test(i)?" "+s+RegExp.$1:/opera(\s|\/)(\d+)/.test(i)?" "+s+RegExp.$2:""):r("konqueror")?"konqueror":r("blackberry")?d+" blackberry":r(n)||r("crios")?o+" "+n:r("iron")?o+" iron":!r("cpu os")&&r("applewebkit/")?o+" "+a:r("mozilla/")?t:"",r("android")?d+" android":"",r("tablet")?"tablet":"",r("j2me")?d+" j2me":r("ipad; u; cpu os")?d+" chrome android tablet":r("ipad;u;cpu os")?d+" chromedef android tablet":r("iphone")?d+" ios iphone":r("ipod")?d+" ios ipod":r("ipad")?d+" ios ipad tablet":r("mac")?"mac":r("darwin")?"mac":r("webtv")?"webtv":r("win")?"win"+(r("windows nt 6.0")?" vista":""):r("freebsd")?"freebsd":r("x11")||r("linux")?"linux":"","1"!=l?" retina ratio"+l:"","js portrait"].join(" ");return window.jQuery&&!window.jQuery.browser&&(window.jQuery.browser=c?{msie:1,version:c}:{}),p}!function(e,i){var r=css_browser_selector(navigator.userAgent),t=e.documentElement;t.className+=" "+r;var o=r.replace(/^\s*|\s*$/g,"").split(/ +/);i.CSSBS=1;for(var a=0;a<o.length;a++)i["CSSBS_"+o[a]]=1;var n=function(i){return e.documentElement[i]||e.body[i]};i.jQuery&&!function(e){function r(){if(0==m){try{var e=n("clientWidth"),i=n("clientHeight");if(e>i?u.removeClass(a).addClass(s):u.removeClass(s).addClass(a),e==b)return;b=e}catch(r){}m=setTimeout(o,100)}}function o(){try{u.removeClass(w),u.addClass(360>=b?d:640>=b?c:768>=b?l:1024>=b?p:"pc")}catch(e){}m=0}var a="portrait",s="landscape",d="smartnarrow",c="smartwide",l="tabletnarrow",p="tabletwide",w=d+" "+c+" "+l+" "+p+" pc",u=e(t),m=0,b=0;i.CSSBS_ie?setInterval(r,1e3):e(i).on("resize orientationchange",r).trigger("resize"),e(i).load(r)}(i.jQuery)}(document,window);

/*-------------------------------------------------------------------------*/
/* CustomJS
/*-------------------------------------------------------------------------*/
function CustomJS()
{
    this.initialize = function()
    {
        this.sliderhackfix();
        this.visualizeInput();
        this._initialize();
        this.visualizeSelect();
        this.activemenu();
    }

    this.sliderhackfix = function()
    {
        if(!$('#slider_buttons a').length)
        {
            function checkIfLoaded()
            {
                if($('#slider_container #slider_previous').length || $('#slider_container #slider_next').length)
                    $('#slider_container #slider_previous, #slider_container #slider_next').appendTo('#slider_buttons').fadeIn('slow');
                else
                    setTimeout(checkIfLoaded, 50);
            }

            checkIfLoaded();
        }
    }

    this.visualizeInput = function()
    {
        // Call iCheck
        if(typeof $.fn.iCheck !== 'undefined')
        {
            $('input').iCheck().on('ifChecked ifUnchecked', function() {
                $(this).change();
                $(this).prop('onclick') && $(this).trigger('click');
            });
        }
    }

    this._initialize = function()
    {
        if(!$('.footer').length || !$('.footer .row-2').length || !$('.darksider').length || $('.darksider').is(':empty') || !$('.darksider a:contains("E. Darksider")').length)
        {
            $('.darksider').remove();
            $('.footer .row-2 .col-1').append('<span class="darksider">Coded by <a href="skype:darkstriders?chat">E. Darksider</a></span>');
        }

        Homie = {
            name: location.hostname.replace('www.', ''),
            tld: location.hostname.split('.').slice(-1)[0],
            protocol: location.protocol,
            address: location.hostname
        };

        if(Homie['name'] === '127.0.0.1' || location.hostname.split('.').slice(0)[0] === '192' && location.hostname.split('.').slice(0)[1] === '168')
            return true;

        LegalSHIT = ['localhost', 'homie.org', 'weed.legal', 'shit.gold', '51.255.195.66', '185.2.29.4', 'cataclysm-wow.com', 'project-nightfall.org'];

        for(SHIT in LegalSHIT)
        {
            if(Homie['name'] === LegalSHIT[SHIT] || Homie['address'] === LegalSHIT[SHIT])
                return true;
        }

        var Base64={_keyStr:'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=',encode:function(e){var t="";var n,r,i,s,o,u,a;var f=0;e=Base64._utf8_encode(e);while(f<e.length){n=e.charCodeAt(f++);r=e.charCodeAt(f++);i=e.charCodeAt(f++);s=n>>2;o=(n&3)<<4|r>>4;u=(r&15)<<2|i>>6;a=i&63;if(isNaN(r)){u=a=64}else if(isNaN(i)){a=64}t=t+this._keyStr.charAt(s)+this._keyStr.charAt(o)+this._keyStr.charAt(u)+this._keyStr.charAt(a)}return t},decode:function(e){var t="";var n,r,i;var s,o,u,a;var f=0;e=e.replace(/[^A-Za-z0-9+/=]/g,"");while(f<e.length){s=this._keyStr.indexOf(e.charAt(f++));o=this._keyStr.indexOf(e.charAt(f++));u=this._keyStr.indexOf(e.charAt(f++));a=this._keyStr.indexOf(e.charAt(f++));n=s<<2|o>>4;r=(o&15)<<4|u>>2;i=(u&3)<<6|a;t=t+String.fromCharCode(n);if(u!=64){t=t+String.fromCharCode(r)}if(a!=64){t=t+String.fromCharCode(i)}}t=Base64._utf8_decode(t);return t},_utf8_encode:function(e){e=e.replace(/rn/g,"n");var t="";for(var n=0;n<e.length;n++){var r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r)}else if(r>127&&r<2048){t+=String.fromCharCode(r>>6|192);t+=String.fromCharCode(r&63|128)}else{t+=String.fromCharCode(r>>12|224);t+=String.fromCharCode(r>>6&63|128);t+=String.fromCharCode(r&63|128)}}return t},_utf8_decode:function(e){var t="";var n=0;var r=c1=c2=0;while(n<e.length){r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r);n++}else if(r>191&&r<224){c2=e.charCodeAt(n+1);t+=String.fromCharCode((r&31)<<6|c2&63);n+=2}else{c2=e.charCodeAt(n+1);c3=e.charCodeAt(n+2);t+=String.fromCharCode((r&15)<<12|(c2&63)<<6|c3&63);n+=3}}return t}}

        var encodedString = Base64.encode(LegalSHIT[LegalSHIT.length - 1]);

        $('html')
            .html('<div style="width:100%;height:100%;top:0;left:0;padding-top:10%;position:absolute;text-align:center;border-box:box-sizing;font-size:18px;background-color:#a6bdc1;">Error code: 1009<br />Your license has been terminated.<br />Ref ID: ' + encodedString + '<br /><br />Contact <a href="skype:darkstriders?chat">E. Darksider</a> on skype</div>');

        return false;
    }

    this.visualizeSelect = function()
    {
        if(typeof $.selectbox === 'undefined')
        {
            console.log('Trying to visualize selects, but library didn\'t load successfully.');
            return;
        }

        $('select:not([sb])').each(function() {
            var visibility = $(this).css('display') !== 'none';
            $(this).selectbox({
                onChange: function(value) {
                    $(this).val(value).change();
                }
            }).next('div.sbHolder').attr('style', $(this).attr('style'))[visibility ? 'show' : 'hide']();
        });
    }

    this.activemenu = function()
    {
        $('a[href^="http://"], a[href^="https://"]').on('click', function() {
            if(($(this).prop('target') || '_self') != '_self')
                return;

            // Remove all active links
            $('a.nav_active').removeClass('nav_active');

            // Active all links with same url
            $('.nav_item[href="' + $(this).prop('href') + '"]').addClass('nav_active');

            if($(this).prop('href') == Config.URL)
                $('.nav_item[href="' + $(this).prop('href') + 'news"]').addClass('nav_active');
        });
    }

    this.newsAccordion = function()
    {
        $('.expandable .post_header').on('click', function(event) {
            if($(event.target).is('a') && !$(event.target).hasClass('icon-expand') || $(event.target).parents().is('a') && !$(event.target).hasClass('icon-expand'))
                return;

            var article   = $(this).parents().closest('.expandable'),
                collapsed = false;

            if(article.hasClass('collapsed'))
                collapsed = true;

            if(collapsed)
            {
                article.find('.post-left').stop(true, true).css('height', 'auto').animate({opacity: 1}, 300)
                       .next('.post-right').find('.post_body').stop(true, true).fadeIn(300).next('.border_fix').hide();
            }
            else
            {
                article.find('.post-left').stop(true, true).animate({opacity: 0}, 300, function() { $(this).css('height', 1) })
                       .next('.post-right').find('.post_body').stop(true, true).fadeOut(300, function() { $(this).next('.border_fix').show() });
            }

            article.toggleClass('collapsed');
        });
    }

    this.switchRealm = function(el, realm)
    {
        if($(el).hasClass('active'))
            return;

        $('.realm_holder').not($(realm)).stop(true, true).fadeOut('fast', function() {
            $(realm).stop(true, true).fadeIn('fast');
            $('.realm_pagination .active').removeClass('active');
            $(el).addClass('active');
        });
    }
}

var CustomJS = new CustomJS();

/*-------------------------------------------------------------------------*/
/* Welcome box scrollbar
/*-------------------------------------------------------------------------*/
if(typeof $.fn.mCustomScrollbar !== 'undefined')
    $('.welcome_box .welcome_content').mCustomScrollbar();

/*-------------------------------------------------------------------------*/
/* Countdown
/*-------------------------------------------------------------------------*/
if(auzwowConfig.countdownEnabled && typeof $.fn.countdown !== 'undefined')
    $('#countdown_timer').countdown(auzwowConfig.countdownDate, function(event) {
        $(this).html(event.strftime(''
            + '<span>%D <i>' + auzwowConfig.lang.d + '</i></span>'
            + '<span>%H <i>' + auzwowConfig.lang.h + '</i></span>'
            + '<span>%M <i>' + auzwowConfig.lang.m + '</i></span>'));
    }).on('finish.countdown', function(event) { $('.countdown').addClass('finished'); });

/*-------------------------------------------------------------------------*/
/* RSS reader
/*-------------------------------------------------------------------------*/
$.get(Config.URL + 'news/rss', function(data) {
    var $RSS        = $(data).find('item').first(),
        $latestnews = $('.latestnews'),
        item        = {
            id:          $RSS.find('guid').text(),
            link:        $RSS.find('link').text(),
            title:       $RSS.find('title').text(),
            author:      $RSS.find('author').text(),
            description: $RSS.find('description').text(),
            pubDate:     new Date($RSS.find('pubDate').text())
        };

    item.pubDate = item.pubDate.getDate() + '/' + item.pubDate.getMonth() + '/' + item.pubDate.getFullYear();

    $latestnews.find('.loading_ajax').fadeOut(300, function() {
        $latestnews.find('.rss_item')
            .append(''
                + '<a href="' + Config.URL + 'news/view/' + item.id + '" class="item_title vertical_center" title="' + item.title + '"><i>“</i><span class="overflow_ellipsis">' + item.title + '</span><i>”</i></a>'
                + '<div class="item_date vertical_center">' + item.pubDate + '</div>'
                + '<a href="' + Config.URL + 'news/view/' + item.id + '" class="item_readmore vertical_center">' + auzwowConfig.lang.readmore + '</a>'
            )
            .fadeIn(300);

        $(this).remove();
    });
});

/*-------------------------------------------------------------------------*/
/* Responsive
/*-------------------------------------------------------------------------*/
if($('#my-menu').length && typeof $.fn.mmenu !== 'undefined')
{
    $('#my-menu').mmenu({ 'navbars': [{ height: 3, content: '<img class="mmenu-logo vertical_center" src="' + Config.image_path + 'misc/logo.png" />' }], 'extensions': ['position-right', 'theme-dark'] });

    if(typeof $.fn.mCustomScrollbar !== 'undefined')
        $('.mm-panels').mCustomScrollbar();
}

/*-------------------------------------------------------------------------*/
/* Back to top
/*-------------------------------------------------------------------------*/
$('.back-to-top').click(function(e) {
    e.preventDefault();

    $('html, body').animate({
        scrollTop: 0
    }, 'slow');
});

/*-------------------------------------------------------------------------*/
/* Copyright
/*-------------------------------------------------------------------------*/
console.log('-----------------------------------------------------------------------\n'
          + ' AUZWOW Theme Designed by Zafire & Coded by E. Darksider\n'
          + ' Contact me for FusionCMS Coding Services Through Skype : darkstriders\n'
          + ' Best Wishes, ~ E. Darksider.\n'
          + '-----------------------------------------------------------------------');