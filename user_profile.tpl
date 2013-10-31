{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h2>{{ #userIndex# }}</h2>

                        <div id="content" class="index-page">

                        <br>
                        <div class="profile-avatar">
                            <img src="{{ include file='_tpl/user-image.tpl' user=$user width=150 height=130 }}" alt="{{ #profilePicture# }} ">
                            <h1 class="page-title">{{ if $profile['first_name_public'] }}{{ $user->first_name }}{{ /if }} {{ if $profile['last_name_public'] }} {{ $user->last_name }}{{ /if }} {{ if !$profile['first_name_public'] && !$profile['last_name_public'] }}{{$user->uname}}{{ /if }}</h1>
                        </div>

                        <div class="profile-bio">
                            <h4>{{ #aboutAuthor# }}</h4>
                            <p>{{ $profile['bio']}}</p>
                        </div>

                        <div class="profile-information">
                            <h4>{{ #information# }}</h4>
                            <div class="information-column">
                                {{ if $profile['gender'] }}
                                <div class="info-value">
                                    <span class="label">{{ #gender# }}</span><br>
                                    <span class="value">{{ $profile['gender'] }}</span>
                                </div>
                                {{ /if }}
                                {{ if $profile['organisation']}}
                                <div class="info-value">
                                    <span class="label">{{ #organization# }}</span><br>
                                    <span class="value">{{ $profile['organisation']}}</span>
                                </div>
                                {{ /if }}
                                {{ if $profile['website']}}
                                <div class="info-value">
                                    <span class="label">{{ #website# }}</span><br>
                                    <span class="value"><a class="link-color" href="{{ $profile['website']}}" target="_blank" rel="nofollow">{{ $profile['website']|escape}}</a></span>
                                </div>
                                {{ /if }}
                                {{ if $profile['facebook'] }}
                                <div class="info-value">
                                    <span class="label">Facebook</span><br>
                                    <span class="value"><a class="link-color" href="http://facebook.com/{{ $profile['facebook'] }}" rel="nofollow" target="_blank">{{ $profile['facebook'] }}</a></span>
                                </div>
                                {{ /if }}
                                {{ if $profile['twitter'] }}
                                <div class="info-value">
                                    <span class="label">Twitter</span><br>
                                    <span class="value"><a class="link-color" href="http://twitter.com/{{ $profile['twitter'] }}" rel="nofollow" target="_blank">{{ $profile['twitter'] }}</a></span>
                                </div>
                                {{ /if }}
                                {{ if $profile['birth_date'] }}
                                <div class="info-value">
                                    <span class="label">{{ #birthday# }}</span><br>
                                    <span class="value">{{ $profile['birth_date'] }}</span>
                                </div>
                                {{ /if }}
                                <div class="info-value">
                                    <span class="label">{{ #member# }}</span><br>
                                    <span class="value"><time class="timeago" datetime="{{ $user->created|date_format:'%Y-%m-%d' }} 06:00:00">{{ $user->created|date_format:'%Y-%m-%d' }} 06:00:00</time></span>
                                </div>
                                <div class="info-value">
                                    <span class="label">{{ #posts# }}</span><br>
                                    <span class="value">{{ $user->posts_count }}</span>
                                </div>
                                {{ if $profile['google'] }}
                                <div class="info-value">
                                    <span class="label">Google+</span><br>
                                    <span class="value"><a class="link-color" href="http://plus.google.com/{{ $profile['google'] }}" rel="nofollow" target="_blank">{{ $profile['google'] }}</a></span>
                                </div>
                                {{ /if }}
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

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
