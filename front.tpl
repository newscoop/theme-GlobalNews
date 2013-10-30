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

                                    <div class="item active">
                                        <article class="article featured">
                                            <figure>
                                                <img class="img-responsive" src="http://lorempixel.com/950/500/" alt="">
                                            </figure>
                                            <div class="caption">
                                                <h2><a href="#">Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit</a></h2>
                                                <p class="excerpt">
                                                    Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur.
                                                </p>
                                            </div>
                                        </article>
                                    </div>

                                    <div class="item">
                                        <article class="article featured">
                                            <figure>
                                                <img class="img-responsive" src="http://lorempixel.com/950/500/people" alt="">
                                            </figure>
                                            <div class="caption">
                                                <h2><a href="#">Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit</a></h2>
                                                <p class="excerpt">
                                                    Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. 
                                                </p>
                                            </div>
                                        </article>
                                    </div>

                                    <div class="item ">
                                        <article class="article featured">
                                            <figure>
                                                <img class="img-responsive" src="http://lorempixel.com/950/500/sports" alt="">
                                            </figure>
                                            <div class="caption">
                                                <h2><a href="#">Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit</a></h2>
                                                <p class="excerpt">
                                                    Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. 
                                                </p>
                                            </div>
                                        </article>
                                    </div>

                                <!-- End Wrapper for slides -->
                                </div>

                            <!-- End carousel -->
                            </div>

                            <!-- Controls carousel sections -->
                            <nav id="carousel-sections">
                                <a data-slide-to="0" data-target="#carousel" class="active">lero</a>
                                <a data-slide-to="1" data-target="#carousel">lero</a>
                                <a data-slide-to="2" data-target="#carousel">lero</a>
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
