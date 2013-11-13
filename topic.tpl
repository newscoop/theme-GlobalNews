{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h1 class="page-title">{{ $gimme->topic->name }}</h1>

                        <div id="content" class="topic-page">

                            {{ list_articles length="5" ignore_issue="true" constraints="type not poll" }}
                            <article class="article list">
                                <div class="row">
                                    <div class="col-lg-4 col-md-5">
                                        {{ if $gimme->section->name != "Dialogue" }}
                                        <figure class="section-thumb pull-left">
                                            <a href="{{ uri options="article" }}">
                                                {{ include file='_tpl/img/img_rectangle.tpl'}}
                                            </a>
                                        </figure>
                                        {{/if}}
                                    </div>
                                    <div class="col-lg-8 col-md-7">
                                        <h4><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h4>
                                        {{ if !$gimme->article->is_public }}
                                        <span class="label label-important"><i class="icon-lock"></i>&nbsp;{{ #premium# }}</span>
                                        {{ /if }} 
                                        <p class="excerpt">
                                            {{ $gimme->article->full_text|truncate:250:"...":true }}
                                        </p>
                                        <a href="{{ uri options="article" }}">≫ {{ #more# }} </a>
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

                            {{ /list_articles }} 

                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
