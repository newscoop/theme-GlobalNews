        <header id="header">

                <div class="row">
                    <div class="col-lg-12">
                        <div id="top-header">
                            <div class="pull-left">
                                <a href="#">Register</a>
                                <a href="#">Login</a>
                                <a href="/en/static/rss">{{ #RSS# }}</a>
                            </div>
                            <div class="pull-right">
                                {{$smarty.now|date_format:"%d/%m/%Y"}}
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div id="main-header">
                        <div class="col-lg-9 col-md-9">
                            <h1><a href="#">Global News</a></h1>
                        </div>
                        <div class="col-lg-3 col-md-3">
                            <div id="social-header">
                                <a href="#"><img src="{{ url static_file='_img/social-icons/facebook.png'}}"></a>
                                <a href="#"><img src="{{ url static_file='_img/social-icons/twitter.png'}}"></a>
                                <a href="#"><img src="{{ url static_file='_img/social-icons/vimeo.png'}}"></a>
                                <a href="#"><img src="{{ url static_file='_img/social-icons/flickr.png'}}"></a>
                            </div>
                            <form class="form-horizontal" role="form">
                                <div class="input-group">
                                    {{ search_form template="search.tpl" submit_button="&nbsp;" html_code="class=\"form-search\" " button_html_code="style=\"display: none;\""}} 
                                        {{ camp_edit object="search" attribute="keywords"  html_code="placeholder=\"{{ #search# }}\" class=\"form-control\" " }}
                                    {{ /search_form }}
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-search "></span></span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                       <div id="news-ticker">
                            <span>Breaking News</span>
                            <ul>
                                {{ local }} 
                                {{ set_current_issue }} 
                                {{ list_articles length="4" order="bypopularity desc" constraints="type is news" }}
                                <li><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></li>
                                {{ /list_articles }} 
                                {{ /local }}
                            </ul>
                        </div>
                        <div id="main-navigation">
                            <nav id="menu">
                                {{ local }}
                            {{ set_current_issue }}
                            {{ list_sections }}
                            <a href="{{ uri options='section' }}" 
                                {{if $currentsection == $gimme->section->number }}class="active"{{ /if}} >{{ $gimme->section->name}}
                            </a>
                            {{ /list_sections }}
                            {{ /local }}
                            <a href="/user" class="pull-right">Community</a>
                            </nav>
                        </div>
                    </div>
                </div>

            </header>
