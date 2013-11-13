{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body class="responsive-menu-push">

    {{ include "_tpl/responsive-menu.tpl"}}
    
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h1 class="page-title">{{ #userIndex# }}</h1>

                        <div id="content" class="community-page">
                           <ul id="community-tabs" class="nav nav-tabs">
                                <li id="user-active">
                                     <a href="{{ $view->url(['controller' => 'user', 'action' => 'index'], 'default', true) }}">{{ #active# }}</a>
                                 </li>
                                <li id="user-all"><a href="{{ $view->url(['controller' => 'user', 'action' => 'filter', 'f' => 'a-z'], 'default', true) }}">{{ #all# }}</a></li>
                                <li id="user-ad"><a href="{{ $view->url(['controller' => 'user', 'action' => 'filter', 'f' => 'a-d'], 'default', true) }}">A-D</a></li>
                                <li id="user-ek"><a href="{{ $view->url(['controller' => 'user', 'action' => 'filter', 'f' => 'e-k'], 'default', true) }}">E-K</a></li>
                                <li id="user-lp"><a href="{{ $view->url(['controller' => 'user', 'action' => 'filter', 'f' => 'l-p'], 'default', true) }}">L-P</a></li>
                                <li id="user-qt"><a href="{{ $view->url(['controller' => 'user', 'action' => 'filter', 'f' => 'q-t'], 'default', true) }}">Q-T</a></li>
                                <li id="user-uz"><a href="{{ $view->url(['controller' => 'user', 'action' => 'filter', 'f' => 'u-z'], 'default', true) }}">U-Z</a></li>
                                <li id="user-editors"><a href="{{ $view->url(['controller' => 'user', 'action' => 'editors'], 'default', true) }}">{{ #editors# }}</a></li>
                            </ul> 
                            
                            <div class="list-group">
                            {{ foreach $users as $user }}
                                <a href="{{ $view->url(['username' => $user->uname], 'user') }}" class="list-group-item">
                                    {{ if !$user->is_active }}
                                    <img src="{{ url static_file="_img/avatar-list.png" }}" class="avatar" />
                                    {{ else if $user->image() }}
                                    <img src="{{ $user->image(60, 60) }}" class="avatar" />
                                    {{ else }}
                                    <img src="{{ url static_file="_img/avatar-list.png" }}" class="avatar" />
                                    {{ /if }}
                                    <span class="name">{{ $user->first_name }} {{ $user->last_name }},</span>
                                    <span class="member">{{ #memberSince# }} <time class="timeago" datetime="{{ $user->created|date_format:'%Y-%m-%d' }} 06:00:00">{{ $user->created|date_format:"%Y-%m-%d" }} 06:00:00</time></span>
                                </a>
                            
                            {{ /foreach }}
                            </div>
                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar-community.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
