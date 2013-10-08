{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h2>{{ $gimme->section->name }}</h2>

                        <div id="content" class="index-page">

                            {{ list_sections }} 
                            {{ list_articles }}
                            {{ if $gimme->current_articles_list->at_beginning }}
                            <h4 class="section-title">{{ $gimme->section->name}}<a href="{{ uri options="section" }}" class="solid-button pull-right">{{ #readAll# }}</a></h4>
                            {{ /if }}
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
                            {{ /list_articles }} 
                            {{ /list_sections }} 

                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
