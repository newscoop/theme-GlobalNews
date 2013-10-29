{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h2>{{ #issuesArchive# }}</h2>

                        <div id="content" class="index-page">
                            {{ list_issues order="bynumber desc" constraints="number greater 1" }} 
                            <div class="archive-list">
                                <div class="archive-border"></div>
                                <a class="archive-title" href="{{ uri options="template issue.tpl" }}">{{ $gimme->issue->name }}</a>
                                <span class="published-date" href="">{{ #publishedOn# }} <time datetime="{{ $gimme->issue->publish_date|date_format:"%Y-%m-%dT%H:%MZ" }}">{{ $gimme->issue->publish_date|camp_date_format:"%d %M %Y" }}</time></span>
                            </div>
                            {{ /list_issues }}  
                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
