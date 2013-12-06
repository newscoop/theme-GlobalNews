{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>

{{ include "_tpl/responsive-menu.tpl"}}

<div id="main-container" class="snap-content">
    
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h1 class="page-title">{{ #searchResults# }}</h1>

                        <div id="content" class="index-page">

                            {{ list_search_results length="5" order="bypublishdate desc" }}
			    {{ assign var=articlesConstraints value="`$articlesConstraints` number not `$gimme->article->number`" }}
                            {{if $gimme->current_list->at_beginning}}
                            <p>{{ #resultsFor# }} <strong>"{{ $gimme->search_articles_action->search_phrase }}"</strong>.</p>
                            {{/if}}

                            <article class="article list">
                                <div class="row">
                                    <div class="col-lg-4 col-md-5 col-sm-5 col-xs-5">
                                        <a href="{{ uri options="article" }}">
                                            <figure>
                                                {{ include file='_tpl/img/img_cinema.tpl'}}
                                            </figure>
                                        </a>
                                    </div>
                                    <div class="col-lg-8 col-md-7 col-sm-7 col-xs-7">
                                        <a href="{{ uri options='section'}}" class="section-link">{{ $gimme->article->section->name }}</a>
                                        <h4><a href="{{ uri options='article' }}">{{ $gimme->article->name }}</a></h4>
                                        <div class="excerpt">
                                            {{ $gimme->article->full_text|truncate:200:"..." }}
                                        </div>
                                        <a href="{{ uri options='article'}}">{{ #more# }}</a>
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
                                    <li><a href="{{ uripath options="section" }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
                                    {{ else }}
                                    <li class="selected"><a href="{{ uripath options="section" }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
                                    {{ $remi=$i+1 }}
                                    {{ /if }}
                                {{ /for }}
                                {{ if $gimme->current_list->has_next_elements }}<li class="next"><a href="{{ uripath options="section" }}?{{ urlparameters options="next_items" }}">&raquo;</a></li>{{ /if }}
                            </ul>
                            {{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
                            {{ /if }}

                            {{ /if }}
                            
                            {{ /list_search_results }} 
                                
                            {{ if $gimme->prev_list_empty }}
                              <p>{{ #noResultsFound# }} <strong>"{{ $gimme->search_articles_action->search_phrase }}"</strong>.</p>
                            {{ /if }}  

                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
