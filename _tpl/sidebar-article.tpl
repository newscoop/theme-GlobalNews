                    <div class="col-lg-4 col-md-4">

                        <aside id="sidebar">

                            {{ if $gimme->article->type_name == "debate" }}
                                {{ include file="_tpl/debate-voting.tpl" }}
                                {{ include file="_tpl/latest_articles.tpl" }}
                            {{ /if }}

                            {{ if $gimme->article->type_name == "news" }}
                                {{ include file="_tpl/sidebar-slideshow.tpl" }}
                                {{ include file="_tpl/related_articles.tpl" }}
                                {{ include file="_tpl/section_articles.tpl" }}
                            {{/if}}

                            {{ if $gimme->article->type_name == "page" }}
                                {{ include file="_tpl/latest_articles.tpl" }}
                            {{/if}}

                            {{ if $gimme->article->type_name != "debate" }}
                                {{ include file="_tpl/poll.tpl" }}
                            {{ /if }}

                            <section id="ad" class="block visible-lg visible-md">
                                <a href="http://sourcefabric.org/" target="_blank"><img class="img-responsive" src="{{ url static_file='_img/sourcefabric-ad.png'}}" alt="ad"></a>
                            </section>

                        </aside>
                        <!-- End Sidebar -->
                    </div>
