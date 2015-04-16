<ul id="profile-tabs" class="nav nav-tabs">
    <li class="{{ if $user->isAuthor() }}{{else}}active{{/if}}">
         <a href="#comments-tab" data-toggle="tab">{{ #commentsTitle# }}</a>
    </li>
    <li class="{{ if $user->isAuthor() }} active {{/if}}">
         <a href="#articles-tab" data-toggle="tab">{{ #articles# }}</a>
    </li>
</ul>

<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade {{ if $user->isAuthor() }}{{else}}active in{{/if}}" id="comments-tab">
        <div class="profile-comments">
        {{ list_user_comments user=$user->identifier order="bydate desc" length="20" }}
                <div class="comment-box">
                    <a href="{{ $gimme->user_comment->article->url }}#comments">{{ $gimme->user_comment->content|escape|truncate:120 }}</a>
                    <div class="comment-info">
                        <time class="timeago" datetime="{{ $gimme->user_comment->submit_date}}">{{ $gimme->user_comment->submit_date }},</time>
                    </div>
                </div>
        {{ /list_user_comments }}
        </div>
    </div>
    <div class="tab-pane fade {{ if $user->isAuthor() }} active in {{/if}}" id="articles-tab">

        {{ if $user->isAuthor() }}
        {{ $escapedName=str_replace(" ", "\ ", $user->author->name) }}
        {{/if}}
        <div class="profile-articles">
             {{ list_articles length="5" ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="author is $escapedName type is news" order="bypublishdate desc" }}
             {{ if $gimme->article->number != $lastArticle }}
             <article class="article list">
                <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-5 col-xs-5">
                        <figure class="section-thumb pull-left img-responsive">
                            <a href="{{ uri options="article" }}">
                                {{ include file='_tpl/img/img_cinema.tpl' where="no"}}
                            </a>
                        </figure>
                    </div>
                    <div class="col-lg-8 col-md-7 col-sm-7 col-xs-7">
                        <h4><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h4>
                        {{ if !$gimme->article->is_public }}
                        <span class="label label-danger">{{ #premium# }}</span>
                        {{ /if }}
                        <p class="excerpt">
                            {{ $gimme->article->deck|truncate:250:"...":true }}
                        </p>
                        <a href="{{ uri options="article" }}">{{ #more# }} </a>
                    </div>
                </div>
             </article>
             {{ /if }}
             {{ assign var=lastArticle value=$gimme->article->number }}

             {{ if $gimme->current_list->at_end }}

             {{* PAGINATION *}}
             {{ $pages=ceil($gimme->current_list->count/5) }}
             {{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
             {{ if $pages gt 1 }}
             <ul class="pagination">
                 {{ if $gimme->current_list->has_previous_elements }}<li class="prev"><a href="{{ $view->url(['username' => $user->uname], 'user')  }}?{{ urlparameters options="previous_items" }}">&laquo;</a></li>{{ /if }}
                 {{ for $i=0 to $pages - 1 }}
                     {{ $curlistid=$i*5 }}
                     {{ $gimme->url->set_parameter($gimme->current_list_id(),$curlistid) }}
                     {{ if $curlistid != $curpage }}
                 <li><a href="{{ $view->url(['username' => $user->uname], 'user') }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
                     {{ else }}
                 <li class="active disable"><a href="{{ $view->url(['username' => $user->uname], 'user') }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
                     {{ $remi=$i+1 }}
                     {{ /if }}
                 {{ /for }}
                 {{ if $gimme->current_list->has_next_elements }}<li class="next"><a href="{{ $view->url(['username' => $user->uname], 'user') }}?{{ urlparameters options="next_items" }}">&raquo;</a></li>{{ /if }}
             </ul>
             {{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
             {{ /if }}

             {{ /if }}

             {{/list_articles}}

        </div>

    </div>
</div>

