                    <div class="col-lg-4 col-md-4">

                        <aside id="sidebar" class="visible-lg visible-md">

                            <section id="community-feed-block" class="block">
                              <h4>Community Feed</h4>

                              {{ list_community_feeds length="10" }}

                              {{ $created=$gimme->community_feed->created|date_format:"%Y-%m-%d" }}
                              {{ $user=$gimme->community_feed->user }}

                              {{ if $gimme->community_feed->type == 'user-register' && $user->uname }}
                                <div class="comment-box">
                                    <div class="link">
                                        <div class="activity-action">
                                            <span class="glyphicon glyphicon-user"></span> {{#registered#}}:
                                            <time class="timeago pull-right" datetime="{{ $created}}">{{ $created}}</time>
                                        </div>
                                        <a class="article-link" {{ if $user->is_active }} href="{{ $view->url(['username' => $user->uname], 'user') }}"{{ /if }}>{{ $user->first_name }} {{ $user->last_name }}</a>
                                    </div>
                                </div>
                                <hr>

                              {{ elseif $gimme->community_feed->type == 'comment-recommended' && $gimme->community_feed->comment->article }}
                                <div class="comment-box">
                                    <div class="link">
                                        <div class="activity-action">
                                            <span class="glyphicon glyphicon-comment"></span> {{#newCommentOn#}}
                                            <time class="timeago pull-right" datetime="{{ $created}}">{{ $created}}</time>
                                        </div>
                                        <a class="article-link" href="{{ $gimme->community_feed->comment->article->url }}">{{ $gimme->community_feed->comment->article->title }}</a>
                                    </div>
                                </div>
                                <hr>
                              {{/if}}

                              {{ /list_community_feeds }}
                            </section>


                            <section id="ad" class="block">
                                <a href="http://sourcefabric.org/" target="_blank"><img class="img-responsive" src="{{ url static_file='_img/sourcefabric-ad.png'}}" alt="ad"></a>
                            </section>

                        </aside>
                        <!-- End Sidebar -->
                    </div>
