{{ if $gimme->article->content_accessible }} 
<div class="debate-page">
	<h1 class="page-title">{{ $gimme->article->name }}</h1>

 	<div class="well">
			<div class="article-info">
		    	<i class="icon-time"></i> <b>{{#published#}}</b> <time datetime="{{$gimme->article->publish_date|date_format:"%Y-%m-%dT%H:%MZ"}}">{{ $gimme->article->publish_date|camp_date_format:"%d %M %Y" }}</time> 
		   		 By {{ list_article_authors }} 
		   		 		{{ if $gimme->author->user->defined}}
		   		 			<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}" class="link-color">
		   		 		{{/if}}
		   		 			{{ $gimme->author->name }}
		   		 			{{if $gimme->author->user->defined }}
		   		 			</a>
		   		 			{{/if}} 
		   		 			({{ $gimme->author->type|lower }}) 
		   		 			{{ if !$gimme->current_list->at_end }}, {{/if}}
		   		 			{{/list_article_authors}}
			</div>
		{{ if $gimme->article->has_map }}
			<div class="article-info">
				<i class="icon-map-marker"></i> <b>{{ #locations# }}:</b> {{ list_article_locations }}{{ if $gimme->location->enabled }}{{ $gimme->location->name }}{{ if $gimme->current_list->at_end }}{{ else }}, {{ /if }}{{ /if }}{{ /list_article_locations }}
			</div> 
		{{/if}}
		<div class="article-info">
		 		{{ list_article_topics }}
		 		{{ if $gimme->current_list->at_beginning }}
			 	<i class="icon-tag"></i> <b>{{ #topics# }}:</b> {{ /if }}<a class="link-color" href="{{ url options="template topic.tpl" }}">{{ $gimme->topic->name }}</a>{{ if $gimme->current_list->at_end }}{{ else }}, {{ /if }}{{ /list_article_topics }}
		</div>
	</div>


	{{ include file="_tpl/_edit-article.tpl" }}
	<em class="teaser">{{ $gimme->article->teaser }}</em>

	<h1 class="page-title">PRO: {{ $gimme->article->pro_title }}</h1>
    {{ list_article_authors }}
        {{ if $gimme->current_list->index == "1"}}
        <div class="well pull-right well-bio">
        	<div class="author-bio pull-right">
	            <h5>{{ #proArgumentsBy# }}</h5>
	            <p>{{ if $gimme->author->user->defined }}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}" class="link-color">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }}</p> 
	        	<p >{{ $gimme->author->biography->text|strip_tags:false|truncate:200 }}</p>
        	</div>
            <img class="pull-left" alt="{{ $gimme->author->name }}" src="{{ $gimme->author->picture->imageurl }}" width="97" height="97" style="width:97px ;height:100%;" />
            <div class="clearfix"></div>
        </div>
        {{ /if }}

    {{ /list_article_authors }}

    {{ $gimme->article->pro_text }}
	
    <h1 class="page-title">CONTRA: {{ $gimme->article->contra_title }}</h1>
    {{ list_article_authors }}
        {{ if $gimme->current_list->index == "2"}}
        <div class="well pull-left well-bio">
        	<div class="author-bio pull-left">
	            <h5>{{ #contraArgumentsBy# }}</h5>
	            <p>{{ if $gimme->author->user->defined }}<a class="link-color" href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }}</p>
	        	<p>{{ $gimme->author->biography->text|strip_tags:false|truncate:200 }}</p>
        	</div>
            <img class="pull-right" alt="{{ $gimme->author->name }}" src="{{ $gimme->author->picture->imageurl }}" width="97" height="97" style="width:97px ;height:100%;" />
            <div class="clearfix"></div>            
        </div>
        {{ /if }}
    {{ /list_article_authors }}  

    {{ $gimme->article->contra_text }}  


	{{ include file="_tpl/article-attachments.tpl"}}

    <!-- Social Buttons BEGIN -->
    <div class="well share-buttons">

        <!--- Twitter button -->
        <div style="float:left; width:90px;">
            <a href="https://twitter.com/share" class="twitter-share-button" data-dnt="true">Tweet</a>
        </div>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
        </script>

        <!--- Facebook button -->
        <div style="float:left; width:80px; margin-right:15px;">
            <iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2F{{ $gimme->publication->site }}{{ uri }}&amp;send=false&amp;layout=standard&amp;width=80&amp;show_faces=false&amp;colorscheme=light&amp;action=like&amp;height=35&amp;appId=100924830001723" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:35px;" allowTransparency="true"></iframe>
        </div>
                <!--- Google+ button -->
        <div style="float:left; width:50px;">
            <div class="g-plusone" data-size="medium" data-annotation="inline" data-width="120"></div>
            <script type="text/javascript">
              (function() {
                var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                po.src = 'https://apis.google.com/js/plusone.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
              })();
            </script>
        </div>
        <div class="clearfix"></div>

    </div>
    <!-- Social Buttons END -->

	{{ include file="_tpl/article-rating.tpl" }}

	{{ include "_tpl/comments.tpl" }}

</div>
{{ else }}
    <div class="alert">{{ #infoOnLockedArticles# }}</div>
{{ /if }}

