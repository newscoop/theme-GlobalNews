<div class="profile-comments">
<h4>{{ #commentsBy# }} {{ $user->first_name}} {{ $user->last_name}}</h4>
{{ list_user_comments user=$user->identifier order="bydate desc" length="20" }}
        <div class="comment-box">
            <div>
                <a class="link-color" href="{{ $gimme->user_comment->article->url }}#comments">{{ $gimme->user_comment->content|escape|truncate:120 }}</a>
            </div>
            <div class="comment-info">
                <time class="timeago" datetime="{{ $gimme->user_comment->submit_date}}">{{ $gimme->user_comment->submit_date }},</time> {{ #by# }}
                            {{ if $gimme->user_comment->user->identifier }}
                                <a class="link-color" href="http://{{ $gimme->publication->site }}/user/profile/{{ $gimme->user_comment->user->uname|urlencode }}"><b>{{ $gimme->user_comment->user->uname }}</b></a>
                            {{ else }}
                                {{ $gimme->user_comment->nickname }} ({{ #anonymous# }})
                            {{ /if }}
            </div>
        </div>
        <hr>
{{ /list_user_comments }}
</div>
