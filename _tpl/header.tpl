{{ assign var="currentsection" value=$gimme->section->number }}
{{ assign var=articlesConstraints value='' }}
        <header id="header">

                <div class="row">
                    <div class="col-lg-12">
                        <div id="top-header" class="hidden-xs">
                            <div class="pull-left">
                                {{ if $gimme->user->logged_in }}
                                <a href="/dashboard">{{ #profile# }}</a>
                                <a href="{{ $view->url(['controller' => 'auth', 'action' =>'logout'], 'default') }}">{{ #logout# }}</a>
                                {{ else }}
                                <a href="{{ $view->url(['controller' => 'register', 'action' => 'index']) }}">{{ #register# }}</a>
                                <a href="{{ $view->url(['controller' => 'auth', 'action' =>'index'], 'default') }}">{{ #login# }}</a>
                                {{ /if }}
                                <a href="/en/static/rss">{{ #RSS# }}</a>
                            </div>
                            <div class="pull-right">
                                {{ $smarty.now|date_format:"%A, %B %e, %Y" }}
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div id="main-header">
                        <div class="col-lg-9 col-md-9">
                            <h1><a href="/">Global <span>News<span></a></h1>
                        </div>
                        <div class="col-lg-3 col-md-3">
                            <div id="social-header">
                                <a href="http://facebook.com/sourcefabric" target="_blank"><img src="{{ url static_file='_img/social-icons/facebook.png'}}"></a>
                                <a href="http://twitter.com/sourcefabric" target="_blank"><img src="{{ url static_file='_img/social-icons/twitter.png'}}"></a>
                                <a href="http://vimeo.com/sourcefabric" target="_blank" ><img src="{{ url static_file='_img/social-icons/vimeo.png'}}"></a>
                                <a href="http://flickr.com/photos/sourcefabric" target="_blank"><img src="{{ url static_file='_img/social-icons/flickr.png'}}"></a>
                            </div>


                            <form id="search-form" name="search_articles" action="/{{ $gimme->language->code }}/{{ $gimme->issue->url_name }}/" method="POST" class="form-horizontal" >
                                    <input type="hidden" name="tpl" value="7">
                                    <input type="search" id="searchinput" class="form-control" placeholder="Search" name="f_search_keywords">
                                    <button id="search-button" class="btn btn-default" name="f_search_articles" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                            </form>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                       <div id="news-ticker">
                            <span>{{ #breakingNews# }}</span>
                            <ul>
                                {{ local }} 
                                {{ set_current_issue }} 
                                {{ list_articles length="4" ignore_section="true" order="bypopularity desc" constraints="type is news" }}
                                <li><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></li>
                                {{ /list_articles }} 
                                {{ /local }}
                            </ul>
                        </div>

                        <div id="main-navigation">
                            <nav id="menu" class="visible-lg visible-md">
                                {{ local }}
                                {{ set_current_issue }}
                                {{ list_sections }}
                                <a href="{{ uri options='section' }}" 
                                    {{if $currentsection == $gimme->section->number }}class="active"{{ /if}} >{{ $gimme->section->name}}
                                </a>
                                {{ /list_sections }}
                                {{ /local }}
                                <a href="/user" id="community-link" class="pull-right">Community</a>
                            </nav>
                            <button id="showLeftPush" type="button" class="responsive-menu-button btn btn-default visible-xs visible-sm">
                                   <span class="glyphicon glyphicon-th-list"></span> MENU
                            </button>
                        </div>

                        {{ if $gimme->template->name == 'article.tpl'}}
                        <div id="breadcrumb" class="hidden-xs">
                            <a href="{{ uri options='publication' }}">{{$gimme->publication->name}}</a>&nbsp; &nbsp; → &nbsp; &nbsp; 
                            <a href="{{ uri options='section' }}">{{$gimme->section->name}}</a> &nbsp; &nbsp; → &nbsp; &nbsp; {{ $gimme->article->name }}
                        </div>
                        {{/if}}
                    </div>
                </div>

            </header>
