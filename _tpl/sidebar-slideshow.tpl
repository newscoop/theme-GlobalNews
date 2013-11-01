
<section id="gallery" class="block">
<h4>{{ #slideShow# }}≫</h4>
{{ foreach $gimme->article->slideshows as $slideshow }}
{{ assign var="style" value='true' }}
    {{ assign var="counter" value=0 }}              
    {{ foreach $slideshow->items as $item }}      
            {{ assign var="counter" value=$counter+1 }}
<a class='img-responsive' href="http://{{ $gimme->publication->site }}/{{ $item->image->original }}"><img src="{{ $item->image->src }}" data-title="{{if $item->caption}}{{ $item->caption }}{{else}}&nbsp;{{/if}}" data-big="http://{{ $gimme->publication->site }}/{{ $item->image->original }}" /></a>
    {{ /foreach }}
{{ /foreach }}
</section>
<!-- Gallery vendor plugin -->
<script>
       Galleria.loadTheme('{{ url static_file='_js/vendor/galleria/themes/classic/galleria.classic.min.js'}}');
Galleria.run('#gallery');
    Galleria.configure({
        imageCrop: true
    });
</script>
