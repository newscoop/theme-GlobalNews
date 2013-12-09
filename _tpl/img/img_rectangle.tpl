{{ if $where=='no'}}
{{ image rendition="rectanglebig" }}
	<img class="img-responsive" src="{{ $image->src }}" alt="{{ $image->caption|strip_tags }} (photo: {{ $image->photographer }})">
{{ /image }}
{{ else }}
<span data-picture data-alt="{{ image rendition="rectanglesmall" }}{{ $image->caption|strip_tags }} (photo: {{ $image->photographer }}){{ /image }}">
	{{ image rendition="rectanglesmall" }}
		<span class="img-responsive" data-src="{{ $image->src }}"></span>
	{{ /image }}
	{{ image rendition="rectanglemedium" }}
		<span class="img-responsive" data-src="{{ $image->src }}" data-media="(min-width: 321px)"></span>
	{{ /image }}
	{{ image rendition="rectanglebig" }}
		<span class="img-responsive" data-src="{{ $image->src }}" data-media="(min-width: 640px)"></span>
	{{ /image }}

	<!--[if (lt IE 9) & (!IEMobile)]>
        {{ image rendition="rectanglebig" }}
			<img src="{{ $image->src }}" alt="{{ $image->caption|strip_tags }} (photo: {{ $image->photographer }})">
		{{ /image }}
        <![endif]-->
	<noscript>
	{{ image rendition="rectanglesmall" }}
		<img class="img-responsive" src="{{ $image->src }}" alt="{{ $image->caption|strip_tags }} (photo: {{ $image->photographer }})">
	{{ /image }}
	</noscript>
</span>
{{ /if }}
