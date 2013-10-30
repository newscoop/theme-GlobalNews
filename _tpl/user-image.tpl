{{ if !$user->is_active }}
{{ url static_file="_img/avatar-list.png" }}
{{ else if $user->image() }}
{{ $user->image($width, $height) }}
{{ else }}
{{ url static_file="_img/avatar-list.png" }}
{{ /if }}
