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
                                <form action="{{ $form->getAction() }}"  class="zend_form" method="{{ $form->getMethod() }}">
                                   <fieldset>
                                        {{ if $form->email->hasErrors() }}
                                        <div class="alert alert-error">
                                            <h5>{{ #emailIsNotCorrect# }}</h5>
                                            <p>{{ #maybeYouRegistered# }} <em>{{ $gimme->publication->name }}</em> {{ #withAnotherEmail# }}</p>
                                        </div>
                                        {{ /if }}
                                    </fieldset>
                                    <fieldset class="background-block login">
                                        <dl> {{ $form->email->setLabel("E-Mail")->removeDecorator('Errors') }}</dl>
                                        <div class="form-buttons right">
                                            <input type="submit" id="submit" class="solid-button" value="{{ #requestNewPassword# }}" />
                                        </div>
                                    </fieldset>
                                </form> 
                            </div> 
                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
