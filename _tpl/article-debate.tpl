{{ if $gimme->article->content_accessible }} 
<div class="debate-page">
    <a href="{{ uri option='section'}}" class="section-link">{{ $gimme->article->section->name }}</a>
    <div class="article-info">
        <time datetime="{{$gimme->article->publish_date|date_format:"%Y-%m-%dT%H:%MZ"}}">{{ $gimme->article->publish_date|camp_date_format:"%d %M %Y" }} | </time> 
             {{ #by# }} {{ list_article_authors }} 
        {{ if $gimme->author->user->defined}}
             <a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">
        {{/if}}
             {{ $gimme->author->name }}
                    {{if $gimme->author->user->defined }}
                        </a>
                    {{/if}} 
                ({{ $gimme->author->type|lower }}) 
                {{ if !$gimme->current_list->at_end }}, {{/if}}
                {{/list_article_authors}}

    {{ if $gimme->article->has_map }}
            | {{ list_article_locations }}{{ if $gimme->location->enabled }}{{ $gimme->location->name }}{{ if $gimme->current_list->at_end }}{{ else }}, {{ /if }}{{ /if }}{{ /list_article_locations }}
    {{/if}}
    </div>

    <div class="clearfix"></div>

	<h1 class="page-title">{{ $gimme->article->name }}</h1>

	{{ include file="_tpl/_edit-article.tpl" }}

	<div class="teaser">{{ $gimme->article->teaser }}</div>

	<h2>PRO: {{ $gimme->article->pro_title }}</h2>
    <div class="row">
        <div id="debate-bio" class="col-lg-3 col-md-3 pull-left">
            {{ list_article_authors }}
            {{ if $gimme->current_list->index == "1"}}
            <div class="debate-bio">
                <img alt="{{ $gimme->author->name }}" src="{{ $gimme->author->picture->imageurl }}" width="97" height="97" style="width:97px ;height:100%;" />
    	        <h5>{{ #proArgumentsBy# }}</h5>
    	        <p>{{ if $gimme->author->user->defined }}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }}</p> 
   
            </div>
            {{ /if }}
            {{ /list_article_authors }}
        </div>
        <div class="col-lg-9 col-md-9">
            {{ $gimme->article->pro_text }}
        </div>
	</div>
    <h2>CONTRA: {{ $gimme->article->pro_title }}</h2>
    <div class="row">
        <div id="debate-bio" class="col-lg-3 col-md-3 pull-left">
            {{ list_article_authors }}
            {{ if $gimme->current_list->index == "2"}}
            <div class="debate-bio">
                <img alt="{{ $gimme->author->name }}" src="{{ $gimme->author->picture->imageurl }}" width="97" height="97" style="width:97px ;height:100%;" />
                <h5>{{ #contraArgumentsBy# }}</h5>
                <p>{{ if $gimme->author->user->defined }}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }}</p> 
   
            </div>
            {{ /if }}
            {{ /list_article_authors }}
        </div>
        <div class="col-lg-9 col-md-9">
            {{ $gimme->article->pro_text }}
        </div>
    </div>

	{{ include file="_tpl/article-attachments.tpl"}}

	{{ include file="_tpl/article-rating.tpl" }}

	{{ include "_tpl/comments.tpl" }}

</div>
{{ else }}
    <div class="alert alert-danger">{{ #infoOnLockedArticles# }}</div>
{{ /if }}

