{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h2>{{ #register# }} </h2>

                        <div id="content" class="index-page">
                           <br>
                            <div class="anchorage-form well-form well">
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

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
