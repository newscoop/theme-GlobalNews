{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body class="responsive-menu-push">

    {{ include "_tpl/responsive-menu.tpl"}}
    
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h1 class="page-title">{{ #welcome# }} {{ $user->name }}</h2>

                        <div id="content" class="dashboard-page">
                            <div id="dashboard-avatar" class="pull-left">
                                <figure class="user-image center-block">
                                    <img src="{{ include file="_tpl/user-image.tpl" user=$user width=140 height=210 }}" style="max-width: 100%" rel="resizable" />
                                </figure>
                                <a href="{{ $view->url(['username' => $gimme->user->uname], 'user') }}" class="solid-button">{{#viewMyProfile#}}</a>
                            </div>
                            <div class="globalnews-form well pull-right">
                                <link rel="stylesheet" href="{{ url static_file="_css/datepicker.css"}}">
                                <script src="{{ url static_file='_js/vendor/bootstrap-datepicker.js'}}"></script>
                                <script type="text/javascript">
                                    $(function() {
                                         // Date picker
                                         $('#attributes-birth_date').datepicker({
                                            format:'yyyy/mm/dd',
                                            startView:2,
                                            autoclose:'true'
                                         });
                                    });
                                </script>
                                {{ $form }} 
                            </div>
                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
