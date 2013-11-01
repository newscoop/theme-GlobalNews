{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h2>{{ #userIndex# }}</h2>

                        <div id="content" class="community-page">
                           <ul class="nav nav-pills user-tab">
                                <li class="active">
                                     <a href="{{ $view->url(['controller' => 'user', 'action' => 'index'], 'default', true) }}">{{ #active# }}</a>
                                 </li>
                                <li><a href="{{ $view->url(['controller' => 'user', 'action' => 'filter', 'f' => 'a-z'], 'default', true) }}">{{ #all# }}</a></li>
                                <li><a href="{{ $view->url(['controller' => 'user', 'action' => 'filter', 'f' => 'a-d'], 'default', true) }}">A-D</a></li>
                                <li><a href="{{ $view->url(['controller' => 'user', 'action' => 'filter', 'f' => 'e-k'], 'default', true) }}">E-K</a></li>
                                <li><a href="{{ $view->url(['controller' => 'user', 'action' => 'filter', 'f' => 'l-p'], 'default', true) }}">L-P</a></li>
                                <li><a href="{{ $view->url(['controller' => 'user', 'action' => 'filter', 'f' => 'q-t'], 'default', true) }}">Q-T</a></li>
                                <li><a href="{{ $view->url(['controller' => 'user', 'action' => 'filter', 'f' => 'u-z'], 'default', true) }}">U-Z</a></li>
                                <li><a href="{{ $view->url(['controller' => 'user', 'action' => 'editors'], 'default', true) }}">{{ #editors# }}</a></li>
                            </ul>  

                            {{ foreach $users as $user }}
                            <div class="user-list">
                                {{ if !$user->is_active }}
                                <img src="{{ url static_file="_img/avatar-list.png" }}" class="avatar" />
                                {{ else if $user->image() }}
                                <img src="{{ $user->image(32, 37) }}" class="avatar" />
                                {{ else }}
                                <img src="{{ url static_file="_img/avatar-list.png" }}" class="avatar" />
                                {{ /if }}
                                <a class="user-title" href="{{ $view->url(['username' => $user->uname], 'user') }}">{{ $user->first_name }} {{ $user->last_name }}</a>
                                <span class="member" href="">{{ #memberSince# }} <time class="timeago" datetime="{{ $user->created|date_format:'%Y-%m-%d' }} 06:00:00">{{ $user->created|date_format:"%Y-%m-%d" }} 06:00:00</time></span>
                            </div>
                            {{ /foreach }}
                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar-community.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
