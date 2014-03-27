{{ list_related_articles }}
{{ if $gimme->current_list->at_beginning }}
<section id="related-articles-block" class="block visible-lg visible-md">
    <h4>{{ #relatedArticles# }}</h4>
 {{/if}}
 {{ if $gimme->article->type_name == "news" }}
    <article class="article list">
    	<h5><a href="{{ uri option='article'}}">{{ $gimme->article->name }}</a></h5>
        <div class="row">
            <div class="col-lg-5 col-md-5">
                <a href="{{ uri options='article' }}">
                    <figure>
                        {{ include file='_tpl/img/img_rectangle.tpl'}}
                    </figure>
                </a>
            </div>
            <div class="col-lg-7 col-md-7">
                <div class="excerpt">
                    {{ $gimme->article->deck|truncate:100:"..." }}
                </div>
                <a href="{{ uri option='article'}}">{{ #more# }}</a>
            </div>
        </div>
    </article>
    {{ /if }}
 	{{ if $gimme->current_list->at_end }}
 </section>
 	{{/if}}
 {{ /list_related_articles }}


