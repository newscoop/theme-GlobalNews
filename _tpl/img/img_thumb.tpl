<span data-picture data-alt="{{ image rendition="thumbsmall" }}{{ $image->caption }} (photo: {{ $image->photographer }}){{ /image }}">
		{{ image rendition="thumbsmall" }}
			<span class="img-responsive" data-src="{{ $image->src }}"></div>
		{{ /image }}
		{{ image rendition="thumbmedium" }}
			<span class="img-responsive" data-src="{{ $image->src }}" data-media="(min-width: 321px)"></div>
		{{ /image }}
		{{ image rendition="thumbbig" }}
			<span class="img-responsive"  data-src="{{ $image->src }}" data-media="(min-width: 641px)"></div>
		{{ /image }}

		<!--[if (lt IE 9) & (!IEMobile)]>
        {{ image rendition="thumbbig" }}
			<img src="{{ $image->src }}" alt="{{ $image->caption }} (photo: {{ $image->photographer }})">
		{{ /image }}
    	<![endif]-->

		<noscript>
		{{ image rendition="thumbsmall" }}
			<img class="img-responsive" src="{{ $image->src }}" alt="{{ $image->caption }} (photo: {{ $image->photographer }})">
		{{ /image }}
		</noscript>
  </span>
