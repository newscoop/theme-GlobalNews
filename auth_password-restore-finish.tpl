{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body>
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h1 class="page-title">{{ #resetPassword# }}</h1>

                        <div id="content" class="auth-page">
                            <div class="globalnews-form well">
                                <form action="{{ $form->getAction() }}" class="zend_form" method="{{ $form->getMethod() }}">
                                    <fieldset>
                                        {{ if $form->isErrors() }}
                                        <div class="alert alert-error">
                                            <p>{{ #yourPasswordCouldNotBeChanged# }}</p>
                                        </div>
                                        {{ /if }}
                                    </fieldset>
                                    <fieldset class="fixBackground background-block login">
                                        <dl>
                                                {{ $form->password->setLabel("Neues Passwort")->removeDecorator('Errors') }}
                                                {{ if $form->password->hasErrors() }}
                                                <dt class="info-block">&nbsp;</dt>
                                                <dd class="info-block">
                                                    <span class="alert alert-danger">{{ #pleaseEnterYourNewPassword# }}</span>
                                                </dd>
                                                {{ /if }}
                                        </dl>
                                        <dl>
                                                {{ $form->password_confirm->setLabel("Retype your password")->removeDecorator('Errors') }}
                                                {{ if $form->password_confirm->hasErrors() && !$form->password->hasErrors() }}
                                                <dt class="info-block">&nbsp;</dt>
                                                <dd class="info-block">
                                                    <span class="alert alert-danger">{{ #theConfirmationPasswordDoesNotMatch# }}</span>
                                                </dd>
                                                {{ /if }}
                                         </dl>
                                        <div class="form-buttons right">
                                            <input type="submit" id="submit" class="solid-button" value="{{ #savePassword# }}" />
                                        </div>
                                    </fieldset>
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
