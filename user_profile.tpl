{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body class="responsive-menu-push">

    {{ include "_tpl/responsive-menu.tpl"}}
    
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h1 class="page-title">{{ #userProfile# }}</h1>

                        <div id="content" class="profile-page">

                            <div class="row">
                                <div class="col-lg-5 col-md-5 col-sm-5">

                                    <div class="profile-block">
                                        <div class="profile-avatar">
                                            <img src="{{ include file='_tpl/user-image.tpl' user=$user width=150 height=130 }}" alt="{{ #profilePicture# }} ">
                                            <h4 class="user-title">{{ if $profile['first_name_public'] }}{{ $user->first_name }}{{ /if }} {{ if $profile['last_name_public'] }} {{ $user->last_name }}{{ /if }} {{ if !$profile['first_name_public'] && !$profile['last_name_public'] }}{{$user->uname}}{{ /if }}</h4>
                                        </div>

                                        <div class="profile-bio">
                                            <p>{{ $profile['bio']}}</p>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-lg-7 col-md-7 col-sm-7">

                                    <div class="panel panel-default">
                                        <div class="panel-heading"><h4>{{ #information# }}</h4></div>
                                        <div class="panel-body">
                                            <div class="profile-information">
                                                {{ if $profile['gender'] }}
                                                <div class="info-value">
                                                    <b>{{ #gender# }}</b>
                                                    <span class="value">{{ $profile['gender'] }}</span>
                                                </div>
                                                {{ /if }}
                                                {{ if $profile['organisation']}}
                                                <div class="info-value">
                                                    <b>{{ #organization# }}</b>
                                                    <span class="value">{{ $profile['organisation']}}</span>
                                                </div>
                                                {{ /if }}
                                                {{ if $profile['website']}}
                                                <div class="info-value">
                                                    <b>{{ #website# }}</b>
                                                    <span class="value"><a href="{{ $profile['website']}}" target="_blank" rel="nofollow">{{ $profile['website']|escape}}</a></span>
                                                </div>
                                                {{ /if }}
                                                {{ if $profile['facebook'] }}
                                                <div class="info-value">
                                                    <b>Facebook</b>
                                                    <span class="value"><a href="http://facebook.com/{{ $profile['facebook'] }}" rel="nofollow" target="_blank">{{ $profile['facebook'] }}</a></span>
                                                </div>
                                                {{ /if }}
                                                {{ if $profile['twitter'] }}
                                                <div class="info-value">
                                                    <b>Twitter</b>
                                                    <span class="value"><a href="http://twitter.com/{{ $profile['twitter'] }}" rel="nofollow" target="_blank">{{ $profile['twitter'] }}</a></span>
                                                </div>
                                                {{ /if }}
                                                {{ if $profile['birth_date'] }}
                                                <div class="info-value">
                                                    <b>{{ #birthday# }}</b>
                                                    <span class="value">{{ $profile['birth_date'] }}</span>
                                                </div>
                                                {{ /if }}
                                                <div class="info-value">
                                                    <b>{{ #member# }}</b>
                                                    <span class="value"><time class="timeago" datetime="{{ $user->created|date_format:'%Y-%m-%d %H:%M:%S' }}">{{ $user->created|date_format:'%Y-%m-%d %H:%M:%S' }} </time></span>
                                                </div>
                                                <div class="info-value">
                                                    <b>{{ #commentsTitle# }}</b>
                                                    <span class="value">{{ $user->posts_count }}</span>
                                                </div>
                                                {{ if $profile['google'] }}
                                                <div class="info-value">
                                                    <b>Google+</b>
                                                    <span class="value"><a href="http://plus.google.com/{{ $profile['google'] }}" rel="nofollow" target="_blank">{{ $profile['google'] }}</a></span>
                                                </div>
                                                {{ /if }}

                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>

                            {{ if $user->isAuthor() }}
                            {{ include file="_tpl/user-articles.tpl" }}
                            {{ else }}
                            {{ include file="_tpl/user-comments.tpl" }}
                            {{ /if }}

                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar-community.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
