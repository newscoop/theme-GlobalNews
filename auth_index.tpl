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
                        <h1 class="page-title">{{ #login# }}</h1>

                        <div id="content" class="login-page">
                            <div class="globalnews-form well">
                                 <form action="{{ $form->getAction() }}" class="zend_form" method="{{ $form->getMethod() }}">
                                    {{ if $form->isErrors() }}
                                    <div class="alert alert-danger">
                                        <h5>{{ #loginFailed# }}</h5>
                                        <p>{{ #loginFailedMessage# }}</p>
                                        <p>{{ #tryAgainPlease# }}</p>
                                        <p><a class="register-link" href="{{ $view->url(['controller' => 'auth', 'action' => 'password-restore']) }}">{{ #forgotYourPassword# }}</a></p>
                                    </div>
                                    {{ /if }}
                                    <dl>
                                        {{ $form->email->setLabel("E-mail")->removeDecorator('Errors') }}
                                        {{ $form->password->setLabel("Password")->removeDecorator('Errors') }}
                                        <dt class="empty">&nbsp;</dt>
                                        <dd>
                                            <span class="input-info">
                                                <a class="register-link" href="{{ $view->url(['controller' => 'register', 'action' => 'index']) }}">{{ #register# }} | </a>
                                                <a class="register-link" href="{{ $view->url(['controller' => 'auth', 'action' => 'password-restore']) }}">{{ #forgotYourPassword# }}</a>
                                            </span>
                                        </dd>
                                    </dl>
                                    <div class="form-buttons right">
                                        <input type="submit" id="submit" value="{{ #login# }}" />
                                    </div>
                                </form>
                            </div> 
                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar-community.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
