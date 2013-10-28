        <header id="header" role="banner">
                <div class="row ">

                    <div class="span12 header-top">
                        <div class="row">
                            <div class="span6">
                                <div class="top-block-left"></div>
                            </div>
                            <div class="span6">
                                <div class="top-block-right">
                                    NEWSTICKER: Maecenas faucibus mollis interdum bibendum nulla sed consectetur.
                                </div>  
                            </div>
                         </div>
                    </div>

                    <div class="span12 banner">
                       <hgroup>
                            <h1 id="logo">                  
                                <a href="/">
                                    <img  class="pull-left" src="{{ url static_file="_img/logo.png"}}" alt="">
                                </a>
                            </h1>
                        </hgroup>
                        <div class="date-header pull-right">
                            {{$smarty.now|date_format:"%d/%m/%Y"}} 
                        </div> 
                        <div class="social-links pull-right">
                            <a href="/en/static/rss"><i class="icon-rss-sign"></i> {{ #RSSFeed# }}</a>
                            <a href="http://facebook.com/sourcefabric"><i class="icon-facebook-sign"></i></a>
                            <a href="http://twitter.com/sourcefabric"><i class="icon-twitter"></i></a>
                        </div>
                    </div>

                    <div class="span12">
                        <nav id="main-menu">
                            {{ local }}
                            {{ set_current_issue }}
                            {{ list_sections }}
                            <a href="{{ uri options='section' }}" 
                                {{if $currentsection == $gimme->section->number }}class="active"{{ /if}} >{{ $gimme->section->name}}
                            </a>
                            {{ /list_sections }}
                            {{ /local }}

                            <a href="/user" class="pull-right">{{ #community# }}</a>
                        </nav>
                    </div>

                </div>

        </header>
