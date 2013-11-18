                    <div class="col-lg-4 col-md-4">

                        <aside id="sidebar" class="visible-lg visible-md">

                            {{ include file="_tpl/sidebar-slideshow.tpl" }}

                            {{ if $gimme->article->type_name == "debate" }}
                                {{ include file="_tpl/debate-voting.tpl" }}
                            {{ /if }}

                            {{ include file="_tpl/latest_articles.tpl" }}

                            {{ include file="_tpl/latest_comments.tpl" }}
                            
                            {{ if $gimme->article->type_name != "debate" }}
                                {{ include file="_tpl/poll.tpl" }}
                            {{ /if }}

                            <section id="ad" class="block">
                                <img class="img-responsive" src="{{ url static_file='_img/sourcefabric-ad.png'}}" alt="ad">
                            </section>

                        </aside>
                        <!-- End Sidebar -->
                    </div>
