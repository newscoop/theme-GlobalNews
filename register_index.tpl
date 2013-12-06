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
                        <h1 class="page-title">{{ #register# }} </h1>

                        <div id="content" class="register-page">
                           
                            <div class="globalnews-form well">
                            {{ $form }}
                            </div>
                            
                            <script type="text/javascript">
                            $('.zend_form #email').change(function() {
                                $.post('{{ $view->url(['controller' => 'register', 'action' => 'check-email'], 'default') }}?format=json', {
                                    'email': $(this).val()
                                }, function (data) {
                                    if (data.status) {
                                        $('.zend_form #email').css('color', 'green');
                                    } else {
                                        $('.zend_form #email').css('color', 'red');
                                    }
                                }, 'json');
                            }).keyup(function() {
                                $(this).change();
                            });
                            </script>  
                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar-community.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
