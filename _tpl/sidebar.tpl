                    <div class="col-lg-4 col-md-4">

                        <aside id="sidebar">

                            {{ include file="_tpl/multimedia.tpl" }}

                            {{ include file="_tpl/latest_articles.tpl" }}

                            {{ include file="_tpl/latest_comments.tpl" }}
                            
                            {{ if $gimme->template->name != "search.tpl" }}
                            {{ include file="_tpl/poll.tpl" }}
                            {{ /if }}

                            <section id="ad" class="block visible-lg visible-md">
                                <a href="http://sourcefabric.org/" target="_blank"><img class="img-responsive" src="{{ url static_file='_img/sourcefabric-ad.png'}}" alt="ad"></a>
                            </section>


                        </aside>
                        <!-- End Sidebar -->
                    </div>
