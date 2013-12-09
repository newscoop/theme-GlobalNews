{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>

{{ include "_tpl/responsive-menu.tpl"}}

<div id="main-container" class="snap-content overthrow">
    
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h1 class="page-title">{{ $gimme->section->name }}</h1>

                        <div id="content" class="section-page">

                            {{ list_articles ignore_issue="true" length="5" constraints="type not poll" }}
			    {{ assign var=articlesConstraints value="`$articlesConstraints` number not `$gimme->article->number`" }}

                            {{ if $gimme->current_list->at_beginning }}
                            <article class="article section-featured">
                                {{ if $gimme->section->name != "Dialogue" && $gimme->section->name != "Pages" }}

                                <figure class="section-thumb pull-left img-responsive">
                                    <a href="{{ uri options="article" }}">
                                        {{ include file="_tpl/img/img_950x480.tpl" }}
                                    </a>
                                </figure>
                                <h4><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h4>
                                {{ if !$gimme->article->is_public }}
                                <span class="label label-danger">{{ #premium# }}</span>
                                {{ /if }} 
                                <p class="excerpt">
                                    {{ $gimme->article->full_text|truncate:250:"...":true }}
                                </p>
                                <a href="{{ uri options="article" }}">{{ #more# }} </a>
                                
                                {{ else }}

                                <h4><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h4>
                                {{ if !$gimme->article->is_public }}
                                <span class="label label-danger">{{ #premium# }}</span>
                                {{ /if }} 
                                {{if $gimme->article->teaser}} 
                                <p class="excerpt">
                                    {{ $gimme->article->teaser}}
                                </p>
                                {{else}}
                                <p class="excerpt">
                                    {{ $gimme->article->full_text|truncate:500:"...":true}}
                                </p>
                                {{/if}}
                                <a href="{{ uri options="article" }}">{{ #more# }}</a>
                                <div class="clearfix"></div>
                                {{/if}}
                            </article>
                            {{ else }}
                            <article class="article list">
                                {{ if $gimme->section->name != "Dialogue" && $gimme->section->name != "Pages"}}
                                <div class="row">
                                    <div class="col-lg-4 col-md-5 col-sm-5 col-xs-5">
                                        <figure class="section-thumb pull-left img-responsive">
                                            <a href="{{ uri options="article" }}">
                                                {{ include file='_tpl/img/img_cinema.tpl'}}
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
                                {{else}}
                                    <h4><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h4>
                                    {{ if !$gimme->article->is_public }}
                                    <span class="label label-danger">{{ #premium# }}</span>
                                    {{ /if }}
                                    {{if $gimme->article->teaser}} 
                                    <p class="excerpt">
                                        {{ $gimme->article->teaser}}
                                    </p>
                                    {{else}}
                                    <p class="excerpt">
                                        {{ $gimme->article->full_text|truncate:500:"...":true }}
                                    </p>
                                    {{/if}}
                                    <a href="{{ uri options="article" }}">{{ #more# }} </a>
                                    <div class="clearfix"></div>
                                {{/if}}
                            </article>
                            {{/if}}
                            
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

                            {{ /list_articles }} 

                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
