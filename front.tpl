{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        <section role="main">
            <div class="row">
                <div id="main" class="span12">
                    <div class="row">
                        <div class="span8 column">
                            <div id="main-content">

                                <article class="news featured-new">
                                    <figure class="featured-thumb">
                                        <a href="">
                                            <img src="http://lorempixel.com/720/310/business">
                                        </a>
                                        <figcaption>Boat in Copenhagen canals</figcaption>
                                        <div class="landing-title">Home: Banking Crisis</div>
                                    </figure>

                                    <header>
                                        <h2><a href="">Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</a></h2>
                                    </header>
                                    <div class="excerpt">
                                        Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Maecenas sed diam eget risus varius blandit sit amet non magna.
                                    </div>
                                    <div class="new-links pull-right">
                                        <a href="#" class="btn btn-mini">Read More</a>
                                        <a href="#" class="btn btn-mini">Comments(43)</a>
                                    </div>
                                    <div class="clearfix"></div>
                                </article>

                                <h4 class="index-section-title"> LATEST ARTICLES </h4>

                                <article class="news news-list">
                                    <figure class="secundary-thumb">
                                        <a href="">
                                            <img src="http://lorempixel.com/110/100/people">
                                        </a>
                                    </figure>

                                    <header class="pull-right">
                                        <h2><a href="">Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</a></h2>
                                    </header>
                                    <div class="excerpt pull-right">
                                        Vestibulum id ligula porta felis euismod semper. Donec id elit non mi porta gravida at eget metus.
                                    </div>

                                    <div class="new-links pull-right">
                                        <a href="#" class="btn btn-mini">Read More</a>
                                        <a href="#" class="btn btn-mini">Comments(43)</a>
                                    </div>
                                    <div class="clearfix"></div>
                                </article>

                               <article class="news news-list">
                                    <figure class="secundary-thumb">
                                        <a href="">
                                            <img src="http://lorempixel.com/110/100/city">
                                        </a>
                                    </figure>

                                    <header class="pull-right">
                                        <h2><a href="">Etiam porta sem malesuada magna mollis euismod.</a></h2>
                                    </header>
                                    <div class="excerpt pull-right">
                                       Maecenas sed diam eget risus varius blandit sit amet non magna. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                    </div>

                                    <div class="new-links pull-right">
                                        <a href="#" class="btn btn-mini">Read More</a>
                                        <a href="#" class="btn btn-mini">Comments(43)</a>
                                    </div>
                                    <div class="clearfix"></div>
                                </article>

                               <article class="news news-list">
                                    <figure class="secundary-thumb">
                                        <a href="">
                                            <img src="http://lorempixel.com/110/100/sports">
                                        </a>
                                    </figure>

                                    <header class="pull-right">
                                        <h2><a href="">Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</a></h2>
                                    </header>
                                    <div class="excerpt pull-right">
                                        Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.
                                    </div>

                                    <div class="new-links pull-right">
                                        <a href="#" class="btn btn-mini">Read More</a>
                                        <a href="#" class="btn btn-mini">Comments(43)</a>
                                    </div>
                                    <div class="clearfix"></div>
                                </article>

                                <aside class="extra-news left-block">
                                    <h4 class="index-section-title"> Articles in Sport </h4>
                                    <ul class="nav nav-tabs nav-stacked">
                                      <li><a href="#">Aenean lacinia bibendum nulla sed consectetur.</a></li>
                                      <li><a href="#">Donec ullamcorper nulla non metus auctor fringilla.</a></li>
                                      <li><a href="#">Curabitur blandit tempus porttitor.</a></li>
                                    </ul>
                                </aside>

                                <aside class="extra-news">
                                    <h4 class="index-section-title"> Articles in Health </h4>
                                    <ul class="nav nav-tabs nav-stacked">
                                      <li><a href="#">Aenean lacinia bibendum nulla sed consectetur.</a></li>
                                      <li><a href="#">Donec ullamcorper nulla non metus auctor fringilla.</a></li>
                                      <li><a href="#">Curabitur blandit tempus porttitor.</a></li>
                                    </ul>
                                </aside>

                                <aside class="extra-news left-block">
                                    <h4 class="index-section-title"> Articles in Sci/Tech  </h4>
                                    <ul class="nav nav-tabs nav-stacked">
                                      <li><a href="#">Aenean lacinia bibendum nulla sed consectetur.</a></li>
                                      <li><a href="#">Donec ullamcorper nulla non metus auctor fringilla.</a></li>
                                      <li><a href="#">Curabitur blandit tempus porttitor.</a></li>
                                    </ul>
                                </aside>

                                <aside class="extra-news">
                                    <h4 class="index-section-title"> Articles in Entertaiment </h4>
                                    <ul class="nav nav-tabs nav-stacked">
                                      <li><a href="#">Aenean lacinia bibendum nulla sed consectetur.</a></li>
                                      <li><a href="#">Donec ullamcorper nulla non metus auctor fringilla.</a></li>
                                      <li><a href="#">Curabitur blandit tempus porttitor.</a></li>
                                    </ul>
                                </aside>

                            </div>
                        </div>
                        <aside class="span4 column">

                            <div id="sidebar">

                                <section id="graph" class="block">
                                    <h4>Financial Graph</h4>
                                        <img src="img/graph.png" alt="" />
                                </section>

                                <section id="login-form" class="block">
                                    <h4>Premium login</h4>
                                    <form class="form-horizontal">
                                      <div class="control-group">
                                        <label class="control-label" for="inputEmail">Email:</label>
                                        <div class="controls">
                                          <input type="text" class="input-medium" id="inputEmail">
                                        </div>
                                      </div>
                                      <div class="control-group">
                                        <label class="control-label" for="inputPassword">Password:</label>
                                        <div class="controls">
                                          <input type="password" class="input-medium" id="inputPassword">
                                        </div>
                                      </div>
                                      <div class="control-group">
                                        <div class="controls">
                                          <button type="submit" class="btn btn-mini btn-inverse">Log In</button>
                                        </div>
                                      </div>
                                    </form>
                                </section>

                                <section id="premium-block" class="block">
                                    <h4>Not a premium member?</h4>
                                </section>

                                <section id="premium-block-description" class="block">
                                    <p><strong>Advantages:</strong> Nulla vitae elit libero, a pharetra augue. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur blandit tempus porttitor.</p>
                                    <a href="#" class="solid-button">Register Now</a>
                                </section>

                                <section id="extra" class="block">
                                    <a class="twitter-timeline" href="https://twitter.com/slashmango" data-widget-id="344226794171428864">Tweets por @slashmango</a>
                                    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

                                    <div id="weather"></div>

                                </section>

                            </div>
                        </aside>
                    </div>
                </div>
            </div>
        </section> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
