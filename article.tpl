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
                        <div id="content" class="single-page article-page">
                            {{ if $gimme->article->type_name == "debate" }}
                            {{ include file="_tpl/article-debate.tpl" }}
                            {{ else }}
                            {{ include file="_tpl/article-cont.tpl" }}
                            {{ /if }}
                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar-article.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
