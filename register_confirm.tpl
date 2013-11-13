{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body class="responsive-menu-push">

    {{ include "_tpl/responsive-menu.tpl"}}
    
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h2>{{ #register# }} </h2>

                        <div id="content" class="index-page">
                           <br>
                            <div class="globalnews-form well-form well">
                                {{ $form }}
                            </div>
                            <script type="text/javascript">
                            $('#first_name, #last_name').keyup(function() {
                                $.post('{{ $view->url(['controller' => 'register', 'action' => 'generate-username'], 'default') }}?format=json', {
                                    'first_name': $('#first_name').val(),
                                    'last_name': $('#last_name').val()
                                }, function (data) {
                                    $('#username').val(data.username).css('color', 'green');
                                }, 'json');
                            });

                            $('#username').change(function() {
                                $.post('{{ $view->url(['controller' => 'register', 'action' => 'check-username'], 'default') }}?format=json', {
                                    'username': $(this).val()
                                }, function (data) {
                                    if (data.status) {
                                        $('#username').css('color', 'green');
                                    } else {
                                        $('#username').css('color', 'red');
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
