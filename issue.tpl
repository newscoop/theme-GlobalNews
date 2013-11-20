{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body class="responsive-menu-push">

    {{ include "_tpl/responsive-menu.tpl"}}
    
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h1 class="page-title">{{ $gimme->issue->name }}</h1>

                        <div id="content" class="issue-page">

                            {{ list_sections }} 
                            {{ list_articles length="4" }}
                            {{ if $gimme->current_articles_list->at_beginning }}
                            <a href="{{ uri options="section" }}" class="solid-button pull-right">{{ #readAll# }}</a>
                            <h4 class="section-title">{{ $gimme->section->name}}</h4>
                            {{ /if }}
                            {{ if $gimme->article->type_name != "poll" }} 
                            <article class="article list">
                                {{ if $gimme->section->name != "Dialogue" }}
                                <div class="row">
                                    <div class="col-lg-4 col-md-5 col-sm-5 col-xs-5">
                                        <figure class="section-thumb pull-left img-responsive">
                                            <a href="{{ uri options="article" }}">
                                                {{ include file='_tpl/img/img_rectangle.tpl'}}
                                            </a>
                                        </figure>   
                                    </div>
                                    <div class="col-lg-8 col-md-7 col-sm7 col-xs-7">
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
                                    <p class="excerpt">
                                        {{ $gimme->article->teaser}}
                                    </p>
                                    <a href="{{ uri options="article" }}">{{ #more# }} </a>
                                {{/if}}
                            </article>
                            {{ /if }}
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
