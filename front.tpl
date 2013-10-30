{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">

                        <div id="content" class="index-page">

                            <div id="carousel" class="carousel slide">
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                {{ list_sections }}
                                    {{ assign var=currentindex value=$gimme->current_list->index }}

                                    {{ list_articles length="1" order="byPublishDate desc"}}
                                    <div class="item {{ if $currentindex == '1' }}active{{ /if }}">
                                        <article class="article featured">
                                            <figure>
                                                {{ include file="_tpl/img/img_950x500.tpl" }}
                                            </figure>
                                            <div class="caption">
                                                <h2><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h2>
                                                <p class="excerpt">
                                                    {{ $gimme->article->full_text|truncate:250:"..." }}
                                                </p>
                                            </div>
                                        </article>
                                    </div>
                                    {{ /list_articles }}
                                {{ /list_sections }}

                                <!-- End Wrapper for slides -->
                                </div>

                            <!-- End carousel -->
                            </div>

                            <!-- Controls carousel sections -->
                            <nav id="carousel-sections">
                                {{ list_sections }}
                                <a data-slide-to="{{ $gimme->current_list->index - 1 }}" data-target="#carousel" class="{{ if $gimme->current_list->index =='1' }}active{{ /if }}">{{ $gimme->section->name }}</a>
                                {{ /list_sections }}
                            </nav>
                            
                            {{ list_playlist_articles name="Front page" length="4" }}
                            <article class="article list">
                                <div class="row">
                                    <div class="col-lg-4 col-md-5">
                                        <a href="{{ uri options='article' }}">
                                            <figure>
                                                {{ include file='_tpl/img/img_500x400.tpl'}}
                                            </figure>
                                        </a>
                                    </div>
                                    <div class="col-lg-8 col-md-7">
                                        <a href="{{ uri option='section'}}">{{ $gimme->article->section->name }}</a>
                                        <h4><a href="{{ uri option='article'}}">{{ $gimme->article->name }}</a></h4>
                                        <p class="excerpt">
                                            {{ $gimme->article->full_text|truncate:200:"..." }}
                                        </p>
                                        <a href="{{ uri option='article'}}">≫ {{ #more# }}</a>
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
