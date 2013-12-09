{{ image rendition="slider" }}
<img class="img-responsive" src="{{ $image->src }}" alt="{{ $image->photographer}}: {{ $image->caption|strip_tags }}">
{{ /image }}
