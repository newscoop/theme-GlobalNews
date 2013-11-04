{{ if $where=='no'}}
{{ image rendition="rectanglebig" }}
	<img src="{{ $image->src }}" alt="{{ $image->caption }} (photo: {{ $image->photographer }})">
{{ /image }}
{{ else }}
<div data-picture data-alt="{{ image rendition="rectanglesmall" }}{{ $image->caption }} (photo: {{ $image->photographer }}){{ /image }}">
	{{ image rendition="rectanglesmall" }}
		<div data-src="{{ $image->src }}"></div>
	{{ /image }}
	{{ image rendition="rectanglemedium" }}
		<div data-src="{{ $image->src }}" data-media="(min-width: 321px)"></div>
	{{ /image }}
	{{ image rendition="rectanglebig" }}
		<div data-src="{{ $image->src }}" data-media="(min-width: 640px)"></div>
	{{ /image }}

	<!--[if (lt IE 9) & (!IEMobile)]>
        {{ image rendition="rectanglebig" }}
			<img src="{{ $image->src }}" alt="{{ $image->caption }} (photo: {{ $image->photographer }})">
		{{ /image }}
    <![endif]-->
	<noscript>
	{{ image rendition="rectanglesmall" }}
		<img src="{{ $image->src }}" alt="{{ $image->caption }} (photo: {{ $image->photographer }})">
	{{ /image }}
	</noscript>
</div>
{{ /if }}