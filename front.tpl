{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body class="responsive-menu-push">

    {{ include "_tpl/responsive-menu.tpl"}}

    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">

                        <div id="content" class="index-page">

                            <div id="carousel" class="carousel slide">
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                {{ list_sections constraints="number not 100" }}
                                    {{ assign var=currentindex value=$gimme->current_list->index }}

                                    {{ list_articles length="1" order="byPublishDate desc"}}
                                    <div class="item {{ if $currentindex == '1' }}active{{ /if }}">
                                        <article class="article featured">
                                            <figure>
                                                {{ include file="_tpl/img/img_950x500.tpl" }}
                                            </figure>
                                            <div class="caption">
                                                <h2><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h2>
                                                <div class="excerpt">
                                                    {{ $gimme->article->full_text|truncate:250:"..." }}
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    {{ /list_articles }}
                                {{ /list_sections }}

                                <!-- End Wrapper for slides -->
                                </div>

                                <!-- Controls -->
                                <div id="responsive-controls">
                                    <a class="left carousel-control" href="#carousel" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                    </a>
                                    <a class="right carousel-control" href="#carousel" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </a>
                                </div>

                            <!-- End carousel -->
                            </div>

                            <!-- Controls carousel sections -->
                            <nav id="carousel-sections">
                                {{ list_sections constraints="number not 100" }}
                                <a data-slide-to="{{ $gimme->current_list->index - 1 }}" data-target="#carousel" class="{{ if $gimme->current_list->index =='1' }}active{{ /if }}">{{ $gimme->section->name }}</a>
                                {{ /list_sections }}
                                <div class="clearfix"></div>
                            </nav>
                            
                            {{ list_playlist_articles name="Front page" length="6" }}
                            <article class="article list">
                                <div class="row">
                                    <div class="col-lg-4 col-md-5 col-sm-5 col-xs-5">
                                        <a href="{{ uri options='article' }}">
                                            <figure>
                                                {{ include file='_tpl/img/img_cinema.tpl'}}
                                            </figure>
                                        </a>
                                    </div>
                                    <div class="col-lg-8 col-md-7 col-sm-7 col-xs-7">
                                        <a href="{{ uri options='section' }}" class="section-link">{{ $gimme->article->section->name }}</a>
                                        <h4><a href="{{ uri option='article'}}">{{ $gimme->article->name }}</a></h4>
                                        <div class="excerpt">
                                            {{ $gimme->article->full_text|truncate:200:"..." }}
                                        </div>
                                        <a href="{{ uri option='article'}}">{{ #more# }}</a>
                                    </div>
                                </div>
                            </article>
                            {{ /list_playlist_articles }}

                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
