<section id="latest-comments-block" class="block">
{{list_article_comments length="3" ignore_article="true" order="byDate desc"}}
{{if $gimme->comment->content }}
<div class="comment-box">
    <div class="link">
        <a href="{{uri}}#comments">{{ $gimme->comment->content|truncate:120 }}</a>
        <div class="comment-info">
            <time class="timeago link-color" datetime="{{ $gimme->comment->submit_date}}">{{ $gimme->comment->submit_date }},</time> {{ #by# }}
            {{ if $gimme->comment->user->identifier }}
                <a href="http://{{ $gimme->publication->site }}/user/profile/{{ $gimme->comment->user->uname|urlencode }}">{{ $gimme->comment->user->uname }}</a>
            {{ else }}
                {{ $gimme->comment->nickname }} ({{ #anonymous# }})
            {{ /if }}
        </div>
    </div>
</div>
<hr>
{{/if}}
{{ /list_article_comments }}i
</section>
