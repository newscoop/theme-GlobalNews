{{ image rendition="sectionbig" }}
<img class="img-responsive" src="{{ $image->src }}" alt="{{ $image->photographer}}: {{ $image->caption|strip_tags }}">
{{ if $show_caption }}
<figcaption>{{ if $image->caption }}{{ $image->caption }}{{else}}&nbsp;{{/if}}</figcaption>
{{ /if }}
{{ /image }}
