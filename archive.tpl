{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h1 class="page-title">{{ #issuesArchive# }}</h1>

                        <div id="content" class="archive-page">
                            <div class="list-group">
                            {{ list_issues order="bynumber desc" constraints="number greater 1" }} 
                            
                                <a class="list-group-item" href="{{ uri options="template issue.tpl" }}">
                                    <span class="name">{{ $gimme->issue->name }}</span>
                                    <span class="published-date">{{ #publishedOn# }} <time datetime="{{ $gimme->issue->publish_date|date_format:"%Y-%m-%dT%H:%MZ" }}">{{ $gimme->issue->publish_date|camp_date_format:"%d %M %Y" }}</time></span>
                                </a>
                            
                            {{ /list_issues }} 
                            </div> 
                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
