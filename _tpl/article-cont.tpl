{{ if $gimme->article->content_accessible }}
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

	<h1 class="page-title">
        {{ $gimme->article->name }}
        {{ if !$gimme->article->is_public }}
    	<span class="label label-danger"><i class="icon-lock"></i>&nbsp;{{ #premium# }}</span>
    	{{ /if }}  
    </h1>

    <p class="excerpt">
    	{{ $gimme->article->deck }}
    </p>
	<a class="comment-count" href="#comments" class="pull-right"><span class="glyphicon glyphicon-comment"></span> {{ $gimme->article->comment_count}} {{ #comments# }}</a>

	{{ if $gimme->article->type_name == "news" }}

	<!-- Social Buttons BEGIN -->
		    <div class="share-buttons">

		        <!--- Twitter button -->
		        <div id="twitter-button">
		            <a href="https://twitter.com/share" class="twitter-share-button" data-dnt="true">Tweet</a>
		        </div>
		        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
		        </script>

		        <!--- Google+ button -->
		        <div id="plus-button">
		            <div class="g-plusone" data-size="medium" data-annotation="inline" data-width="120"></div>
		            <script type="text/javascript">
		              (function() {
		                var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
		                po.src = 'https://apis.google.com/js/plusone.js';
		                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
		              })();
		            </script>
		        </div>

		        <!--- Facebook button -->
		        <div id="facebook-button">
		            <iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2F{{ $gimme->publication->site }}{{ uri }}&amp;send=false&amp;layout=standard&amp;width=285&amp;show_faces=false&amp;colorscheme=light&amp;action=like&amp;height=25&amp;appId=100924830001723" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:285px; height:25px;" allowTransparency="true"></iframe>
		        </div>
		        

		        <div class="clearfix"></div>

		    </div>
	<!-- Social Buttons END -->

	{{/if}}

	{{ if $gimme->article->type_name == "news" }}
	<figure class="image">
	    {{ include file="_tpl/img/img_950x500.tpl" }}
	    <figcaption>{{ if $image->caption }}{{ $image->caption }}{{else}}&nbsp;{{/if}}</figcaption>
	</figure>
	{{/if}}

    {{ if $gimme->article->subtitles_count("full_text") > 1}}
    {{ list_subtitles field_name="full_text" }}
        {{ if $gimme->current_list->at_beginning }}
        <div class="clearfix"></div>
        <ul id="subtitle-links" class="nav nav-tabs nav-stacked">
        {{ /if }}
        <li {{ if $gimme->article->current_subtitle_no('full_text') == $gimme->subtitle->number }} class="active" {{/if}} ><a href="{{ url options="article" }}?{{ $gimme->article->subtitle_url_id('full_text') }}={{ $gimme->subtitle->number}}">{{ $gimme->subtitle->name }}</a></li>
        {{ if $gimme->current_list->at_end }}
        </ul>
        {{ /if }}
    {{ /list_subtitles }}
    {{ /if }}
    
	{{ include file="_tpl/_edit-article.tpl" }}{{ $gimme->article->full_text }}
    
    {{ if $gimme->article->subtitles_count("full_text") > 1}}
        <ul class="pagination">
        {{ if $gimme->article->full_text->has_previous_subtitles }}     
        <li><a href="{{ uri options="previous_subtitle full_text" }}">← {{ #previous# }}</a> </li>
        {{ /if }} {{ if $gimme->article->full_text->has_next_subtitles }}     
        <li><a href="{{ uri options="next_subtitle full_text" }}">{{ #next# }} →</a> </li>
        {{ /if }} 
        </ul>
	    <a class="solid-button pull-right" href="{{ uri options="all_subtitles full_text" }}">{{ #viewFullArticle# }}</a>
    {{ /if }}

	{{ if $gimme->article->type_name == "news" }}

		{{ include file="_tpl/article-attachments.tpl"}}

		{{ include file="_tpl/article-rating.tpl" }}

		{{ include "_tpl/comments.tpl" }}

	{{/if}}

{{ else }}
	<br>
    <div class="alert alert-error">{{ #infoOnLockedArticles# }}</div>
{{ /if }}

