{{ if $where=='no'}}
{{ image rendition="cinemabig" }}
	<img class="img-responsive" src="{{ $image->src }}" alt="{{ $image->caption|strip_tags }} (photo: {{ $image->photographer }})">
{{ /image }}
{{ else }}
<span data-picture data-alt="{{ image rendition="cinemasmall" }}{{ $image->caption|strip_tags }} (photo: {{ $image->photographer }}){{ /image }}">
	{{ image rendition="cinemasmall" }}
		<span class="img-responsive" data-src="{{ $image->src }}"></span>
	{{ /image }}
	{{ image rendition="cinemamedium" }}
		<span class="img-responsive" data-src="{{ $image->src }}" data-media="(min-width: 321px)"></span>
	{{ /image }}
	{{ image rendition="cinemabig" }}
		<span class="img-responsive" data-src="{{ $image->src }}" data-media="(min-width: 640px)"></span>
	{{ /image }}

	<!--[if (lt IE 9) & (!IEMobile)]>
        {{ image rendition="cinemabig" }}
			<img src="{{ $image->src }}" alt="{{ $image->caption|strip_tags }} (photo: {{ $image->photographer }})">
		{{ /image }}
        <![endif]-->
	<noscript>
	{{ image rendition="cinemasmall" }}
		<img class="img-responsive" src="{{ $image->src }}" alt="{{ $image->caption|strip_tags }} (photo: {{ $image->photographer }})">
	{{ /image }}
	</noscript>
</span>
{{ /if }}
