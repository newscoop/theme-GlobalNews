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
                                <a data-slide-to="{{ $gimme->current_list->index }}" data-target="#carousel" class="active">{{ $gimme->section->name }}</a>
                                {{ /list_sections }}
                            </nav>

                            <article class="article list">
                                <div class="row">
                                    <div class="col-lg-4 col-md-5">
                                        <figure>
                                            <img class="img-responsive" src="http://lorempixel.com/500/400/sports" alt="">
                                        </figure>
                                    </div>
                                    <div class="col-lg-8 col-md-7">
                                        <a href="#">Sports</a>
                                        <h4><a href="#">Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit</a></h4>
                                        <p class="excerpt">
                                            Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
                                        </p>
                                        <a href="#">≫ More</a>
                                    </div>
                                </div>
                            </article>


                            <article class="article list">
                                <div class="row">
                                    <div class="col-lg-4 col-md-5">
                                        <figure>
                                            <img class="img-responsive" src="http://lorempixel.com/500/400/business" alt="">
                                        </figure>
                                    </div>
                                    <div class="col-lg-8 col-md-7">
                                        <a href="#">Business</a>
                                        <h4><a href="#">Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit</a></h4>
                                        <p class="excerpt">
                                            Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
                                        </p>
                                        <a href="#">≫ More</a>
                                    </div>
                                </div>
                            </article>


                            <article class="article list">
                                <div class="row">
                                    <div class="col-lg-4 col-md-5">
                                        <figure>
                                            <img class="img-responsive" src="http://lorempixel.com/500/400/people" alt="">
                                        </figure>
                                    </div>
                                    <div class="col-lg-8 col-md-7">
                                        <a href="#">Health</a>
                                        <h4><a href="#">Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit</a></h4>
                                        <p class="excerpt">
                                            Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
                                        </p>
                                        <a href="#">≫ More</a>
                                    </div>
                                </div>
                            </article>


                            <article class="article list">
                                <div class="row">
                                    <div class="col-lg-4 col-md-5">
                                        <figure>
                                            <img class="img-responsive" src="http://lorempixel.com/500/400/" alt="">
                                        </figure>
                                    </div>
                                    <div class="col-lg-8 col-md-7">
                                        <a href="#">Politics</a>
                                        <h4><a href="#">Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit</a></h4>
                                        <p class="excerpt">
                                            Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
                                        </p>
                                        <a href="#">≫ More</a>
                                    </div>
                                </div>
                            </article>
                            

                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
