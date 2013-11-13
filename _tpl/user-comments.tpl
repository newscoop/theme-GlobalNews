<div class="profile-comments">
<h4>{{ #commentsBy# }} {{ $user->first_name}} {{ $user->last_name}}</h4>
{{ list_user_comments user=$user->identifier order="bydate desc" length="20" }}
        <div class="comment-box">
            <a href="{{ $gimme->user_comment->article->url }}#comments">{{ $gimme->user_comment->content|escape|truncate:120 }}</a>
            <div class="comment-info">
                <time class="timeago" datetime="{{ $gimme->user_comment->submit_date}}">{{ $gimme->user_comment->submit_date }},</time> 
            </div>
        </div>
        <hr>
{{ /list_user_comments }}
</div>
