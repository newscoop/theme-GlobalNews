        </div>
        <!-- End .container -->
        <script src="{{ url static_file='_js/vendor/bootstrap.min.js'}}"></script>
        <script src="{{ url static_file='_js/vendor/matchmedia.js'}}"></script>
        <script src="{{ url static_file='_js/vendor/picturefill.js'}}"></script>
        <script src="{{ url static_file='_js/vendor/jquery.timeago.js'}}"></script>
        <script src="{{ url static_file='_js/vendor/classie.js'}}"></script>

        <script src="{{ url static_file='_js/global-news.js'}}"></script>

        {{ if $gimme->template->name == 'article.tpl'}}
        <script src="{{ url static_file='_js/vendor/galleria/galleria-1.2.9.min.js'}}"></script>
        <link href="{{ url static_file='_css/flowplayer_skin/minimalist.css' }}" rel="stylesheet">
        <script src="{{ url static_file='_js/vendor/flowplayer/flowplayer.min.js' }}"></script>
        <script>
        // Gallery vendor plugin
            var isSlideshow = $('#gallery').is(':visible');

            if (isSlideshow) {
                Galleria.loadTheme('{{ url static_file='_js/vendor/galleria/themes/classic/galleria.classic.min.js'}}');
                Galleria.run('#gallery');
                    Galleria.configure({
                        imageCrop: true
                    });
            }
        </script>
        <script type="text/javascript">
            //string variables used on article rating
            var votes_str = "{{ #votes# }}";
            var averageRating_str  = "{{ #averageRating# }}";
        </script>
        {{/if}}
    </body>
</html>
