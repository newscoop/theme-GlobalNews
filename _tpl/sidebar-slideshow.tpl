{{ foreach $gimme->article->slideshows as $slideshow }}
<section id="slideshow-block" class="block">
    <h4>{{ #slideShow# }}</h4>
    <div id="gallery">
    {{ assign var="style" value='true' }}
        {{ assign var="counter" value=0 }}              
        {{ foreach $slideshow->items as $item }}      
                {{ assign var="counter" value=$counter+1 }}
    <a class='img-responsive' href="http://{{ $gimme->publication->site }}/{{ $item->image->original }}"><img src="{{ $item->image->src }}" data-title="{{if $item->caption}}{{ $item->caption }}{{else}}&nbsp;{{/if}}" data-big="http://{{ $gimme->publication->site }}/{{ $item->image->original }}" /></a>
        {{ /foreach }}
    </div>
</section>
{{ /foreach }}