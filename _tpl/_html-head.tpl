<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>{{ if $gimme->article->defined }}{{ $gimme->article->name }} | {{ elseif $gimme->section->defined }}{{ $gimme->section->name }} | {{ /if }}{{ $gimme->publication->name }}</title>
        <meta name="viewport" content="width=device-width">
        {{ if empty($siteinfo) }}{{ $siteinfo=['description' => '', 'keywords' => ''] }}{{ /if }}
        {{* if an article is active, meta-description of web page will be article's intro, otherwise it will pull site's description from System Preferences (/Configure/System Preferences) *}}
        <meta name="description" content="{{ if $gimme->article->defined }}{{ $gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}{{ else }}{{ $siteinfo.description }}{{ /if }}">

        {{* if an article is active, meta-keywords will be generated of article keywords (defined on article edit screen), otherwise it will use site-wide keywords from System Preferences (/Configure/System Preferences) *}}
        <meta name="keywords" content="{{ if $gimme->article->defined }}{{ $gimme->article->keywords }}{{ else }}{{$siteinfo.keywords}}{{ /if }}" />

        <link rel="stylesheet" href="{{ url static_file="_css/bootstrap.min.css" }}">
        <link rel="stylesheet" href="{{ url static_file="_css/globalnews.layout.css" }}">
        <link rel="stylesheet" href="{{ url static_file="_css/globalnews.responsive.min.css" }}">
        <link rel="stylesheet" href="{{ url static_file="_css/font-awesome.css" }}">

        <!--[if lte IE 9]>
           <link rel="stylesheet" href="{{ url static_file="_css/anchorage.ie.css" }}">
        <![endif]-->
        <!--[if IE 7]>
           <link rel="stylesheet" href="{{ url static_file="_css/font-awesome-ie7.css" }}">
        <![endif]-->

        {{ if $gimme->article->defined }}{{* Open Graph protocol metatags for Facebook sharing *}}
        <meta property="og:title" content="{{$gimme->article->name|html_entity_decode|regex_replace:'/&(.*?)quo;/':'&quot;'}}" />
        <meta property="og:type" content="article" />
        <meta property="og:url" content="http://{{ $gimme->publication->site }}{{ uri }}" />
        <meta property="og:site_name" content="{{ $gimme->publication->name }}" />
        <meta property="og:description" content="{{$gimme->article->deck|strip_tags:false|strip|escape:'html':'utf-8' }}" />
        {{ list_article_images }}
        <meta property="og:image" content="{{ $gimme->article->image->imageurl }}" />
        {{ /list_article_images }}
        {{ /if }}

        
        <!-- RSS & Pingback -->
        <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://{{ $gimme->publication->site }}/en/static/rss/">
        
        <link rel="shortcut icon" href="{{ url static_file="_img/favicon.png" }}">
        <link rel="apple-touch-icon" href="{{ url static_file="_img/favicon.png" }}">
        
        <!--[if lt IE 9]>
           <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
           <script>window.html5 || document.write('<script src="{{ url static_file='_js/vendor/html5shiv.js'}}"><\/script>')</script>
        <![endif]-->
        
        <!-- jQuery Library -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="{{ url static_file='_js/vendor/jquery-1.9.1.min.js'}}"><\/script>')
        </script>

        <!-- Vendor plugins -->
        <script src="{{ url static_file="_js/vendor/bootstrap.min.js" }}"></script>
        <script src="{{ url static_file="_js/vendor/jquery.timeago.js" }}"></script>

        <!-- Theme custom functions and plugins configuration -->
        <script src="{{ url static_file="_js/globalnews.js" }}"></script>

        {{ if $gimme->template->name == 'article.tpl'}}
        <script src="{{ url static_file='_js/vendor/galleria/galleria-1.2.9.min.js'}}"></script>
        <link href="{{ url static_file='_css/flowplayer_skin/minimalist.css' }}" rel="stylesheet">
        <script src="{{ url static_file='_js/vendor/flowplayer/flowplayer.min.js' }}"></script>
        {{/if}}

    </head>
