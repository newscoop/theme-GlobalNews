{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
{{ include "_tpl/_html-head.tpl" }}
<body class="responsive-menu-push">

    {{ include "_tpl/responsive-menu.tpl"}}
    
    <div class="container">
        {{ include "_tpl/header.tpl" }}
        
        <main id="main">
                <div class="row">

                    <div class="col-lg-8 col-md-8">
                        <h1 class="page-title"{{ #register# }} </h1>

                        <div id="content" class="register-page">
                            <br>
                            <div class="alert alert-info">
                                <p>{{ #followTheSteps# }}</p>
                                <p><b>{{ #thanksForRegistering# }}</b></p>
                            </div> 
                        </div>
                        <!-- End Content -->
                    </div>

                    {{ include "_tpl/sidebar-community.tpl" }}

                </div>

            </main> 

        {{ include "_tpl/footer.tpl" }}
    {{ include "_tpl/_html-footer.tpl" }}
