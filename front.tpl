{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">

                        <div id="content" class="index-page">

                            <article class="article featured">
                                <figure>
                                    <img class="img-responsive" src="http://lorempixel.com/900/350/" alt="">
                                </figure>
                                <h2><a href="#">Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit</a></h2>
                                <p class="excerpt">
                                    Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean lacinia bibendum nulla sed consectetur. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
                                </p>
                            </article>

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
                            
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <section id="map">
                                        <h3>Articles by Location</h3>
                                        <iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://www.openstreetmap.org/export/embed.html?bbox=-86.3258,12.0851,-86.2032,12.1946&amp;layer=mapnik" style="border: 1px solid #fff"></iframe><br /> 
                                    </section>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <section id="multimedia">
                                        <h3>Multimedia</h3>
                                         
                                    </section>
                                </div>
                            </div>

                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
