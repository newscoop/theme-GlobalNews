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

                            <div class="row">
                                {{ list_issues order="bynumber desc" constraints="number greater 1" }} 

                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading"><h4><a href="{{ uri options="template issue.tpl" }}"><span class="glyphicon glyphicon-bookmark"></span>&nbsp; {{ $gimme->issue->name }}</a></h4></div>
                                        <div class="panel-body">

                                            <div id="carousel-{{$gimme->issue->id}}" class="carousel slide">
                                                <div class="carousel-inner">
                                                    {{ list_sections }}
                                                    {{ assign var=currentindex value=$gimme->current_list->index }}
                                                    {{ list_articles length="1" }}
                                                    <div class="item {{ if $currentindex == '1' }}active{{ /if }}">
                                                        <a href="{{ uri options='article' }}">
                                                            <figure>
                                                                {{ include file='_tpl/img/img_rectangle.tpl'}}
                                                            </figure>
                                                        </a>
                                                      <h5><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h5>
                                                    </div>
                                                    {{ /list_articles }}
                                                    {{ /list_sections }} 
                                                </div>
                                                <div >
                                                    <a class="left carousel-control" href="#carousel-{{$gimme->issue->id}}" data-slide="prev">
                                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                                    </a>
                                                    <a class="right carousel-control" href="#carousel-{{$gimme->issue->id}}" data-slide="next">
                                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                                    </a>
                                                </div>
                                            </div>


                                        </div>

                                    </div>
                                </div>                                
                                {{ /list_issues }} 
                            </div>

                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar-community.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
