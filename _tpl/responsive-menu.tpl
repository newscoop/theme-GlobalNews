        <div class="snap-drawers overthrow">
            <div class="snap-drawer snap-drawer-left">
                <nav class="responsive-menu">
                    <h3>Menu</h3>
                    {{ local }}
                    {{ set_current_issue }}
                    {{ list_sections }}
                    <a href="{{ uri options='section' }}" 
                        {{if $currentsection == $gimme->section->number }}class="active"{{ /if}} >{{ $gimme->section->name}}
                    </a>
                    {{ /list_sections }}
                    {{ /local }}
                    <a href="/user" id="community-link">Community</a>
                    <a href="/en/static/rss">{{ #RSS# }}</a>
                    <h3>User</h3>
                    {{ if $gimme->user->logged_in }}
                    <a href="/dashboard">{{ #profile# }}</a>
                    <a href="{{ $view->url(['controller' => 'auth', 'action' =>'logout'], 'default') }}">{{ #logout# }}</a>
                    {{ else }}
                    <a href="{{ $view->url(['controller' => 'register', 'action' => 'index']) }}">{{ #register# }}</a>
                    <a href="{{ $view->url(['controller' => 'auth', 'action' =>'index'], 'default') }}">{{ #login# }}</a>
                    {{ /if }}
                    <h3>Language</h3>
                    <a title="English" href="#">English</a>
                    <a title="Spanish" href="#">Spanish</a>

                </nav>
            </div>
        </div>