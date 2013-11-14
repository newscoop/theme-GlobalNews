{{ if $user->isAuthor() }}
{{ $escapedName=str_replace(" ", "\ ", $user->author->name) }}
{{/if}}
<div class="profile-articles">
     <h4>{{ #articlesBy# }} {{ $user->first_name}} {{ $user->last_name}}</h4>
     {{ list_articles length="5" ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="author is $escapedName type is news" order="bypublishdate desc" }}
     <article class="article list">
        <div class="row">
            <div class="col-lg-4 col-md-5 col-sm-5 col-xs-5">
                <figure class="section-thumb pull-left img-responsive">
                    <a href="{{ uri options="article" }}">
                        {{ include file='_tpl/img/img_rectangle.tpl'}}
                    </a>
                </figure>   
            </div>
            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-7">
                <h4><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h4>
                {{ if !$gimme->article->is_public }}
                <span class="label label-danger">{{ #premium# }}</span>
                {{ /if }} 
                <p class="excerpt">
                    {{ $gimme->article->full_text|truncate:250:"...":true }}
                </p>
                <a href="{{ uri options="article" }}">{{ #more# }} </a>
            </div>
        </div>
     </article>

     {{ if $gimme->current_list->at_end }}            

     {{* PAGINATION *}}
     {{ $pages=ceil($gimme->current_list->count/5) }}
     {{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
     {{ if $pages gt 1 }}
     <ul class="pagination">
         {{ if $gimme->current_list->has_previous_elements }}<li class="prev"><a href="{{ uripath options="section" }}?{{ urlparameters options="previous_items" }}">&laquo;</a></li>{{ /if }}
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
         {{ if $gimme->current_list->has_next_elements }}<li class="next"><a href="{{ uripath options="section" }}?{{ urlparameters options="next_items" }}">&raquo;</a></li>{{ /if }}
     </ul>
     {{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
     {{ /if }}

     {{ /if }}

     {{/list_articles}}
     
</div>
