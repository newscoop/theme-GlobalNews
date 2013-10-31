<aside id="comments-block">
    {{ list_article_comments order="bydate desc" }}
    <div id="comment-{{$gimme->current_list->index}}" class="comment">
        <div class="comment-content">
            <div class="author-phone hidden-desktop">  
                {{ if $gimme->comment->user->identifier }}
                <a href="http://{{ $gimme->publication->site }}/user/profile/{{ $gimme->comment->user->uname|urlencode }}" >{{ $gimme->comment->user->uname }}</a>
                {{ else }}
                <a href="#">{{ $gimme->comment->nickname }} ({{ #anonymous# }})</a>
                {{ /if }}
                |&nbsp;<span><time class="timeago" datetime="{{ $gimme->comment->submit_date }}">{{ $gimme->comment->submit_date }}</time></span>
                <hr>
            </div>
            {{ $gimme->comment->content }}
        </div>
        <div class="comment-author visible-desktop">
            {{ if $gimme->comment->user->identifier }}
            <a href="http://{{ $gimme->publication->site }}/user/profile/{{ $gimme->comment->user->uname|urlencode }}" >{{ $gimme->comment->user->uname }}</a><br>
            {{ else }}
            <a href="#">{{ $gimme->comment->nickname }} ({{ #anonymous# }})</a><br>
            {{ /if }}
            <span><time class="timeago" datetime="{{ $gimme->comment->submit_date }}">{{ $gimme->comment->submit_date }}</time></span>
        </div>
        <div class="clearfix" ></div>
    </div>
    {{ /list_article_comments }}
    <h4>{{ #writeComment# }}</h4>

     {{ if !$gimme->publication->public_comments }}
            <!-- public comments are not allowed-->
            {{ if $gimme->user->logged_in }}
                <!-- user is logged in -->
                {{ if $gimme->article->number && $gimme->article->comments_locked == 0 && $gimme->article->comments_enabled == 1}}
                    {{ if $gimme->submit_comment_action->defined && $gimme->submit_comment_action->rejected }}
                    <p><em>{{ #yourCommentHasNotBeenAccepted# }}</em></p>
                    {{ /if }}

                    {{ if $gimme->submit_comment_action->is_error }}
                        <p><em>{{ $gimme->submit_comment_action->error_message }}</em></p>
                    {{ else }}
                        {{ if $gimme->submit_comment_action->defined }}
                            {{ if $gimme->publication->moderated_comments }}
                                <p><em>{{ #yourCommentHasBeenSentForApproval# }}</em></p>
                            {{ /if }}
                        {{ /if }}   
                    {{ /if }}
            {{ comment_form html_code="id=\"comment-form\" class=\"form-horizontal\" " _button="submit" button_html_code="tabindex=\"6\" class=\"solid-button form-column-right\" " }}
            <div class="form-column-left">                                     
                <div class="control-group">
                    <label class="control-label" for="">Comment</label>
                    <div class="controls">
                    {{ camp_edit object="comment" attribute="content" html_code="id=\"comment\" tabindex=\"4\"" }}
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls captcha">
                        {{ recaptcha }}
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            {{ /comment_form }}
            <div class="clearfix"></div>
            {{ else }}
                <p>{{ #commentsLocked# }}</p>
            {{ /if }}
        {{ else }}
            <p>{{ #registrationNeeded# }}</p>
        {{ /if }}
    {{ else }}
        <!-- public comments are allowed-->
        {{ if $gimme->user->logged_in }}
            {{ if $gimme->article->number && $gimme->article->comments_locked == 0 && $gimme->article->comments_enabled == 1}}
            {{ if $gimme->submit_comment_action->defined && $gimme->submit_comment_action->rejected }}
                <p><em>{{ #yourCommentHasNotBeenAccepted# }}</em></p>
            {{ /if }}

            {{ if $gimme->submit_comment_action->is_error }}
                <p><em>{{ $gimme->submit_comment_action->error_message }}</em></p>
            {{ else }}
                {{ if $gimme->submit_comment_action->defined }}
                    {{ if $gimme->publication->moderated_comments }}
                        <p><em>{{ #yourCommentHasBeenSentForApproval# }}</em></p>
                    {{ /if }}
                {{ /if }}   
            {{ /if }}

            {{ comment_form html_code="id=\"comment-form\" class=\"form-horizontal\" " _button="submit" button_html_code="tabindex=\"6\" class=\"solid-button form-column-right\" "  }}
            <div class="form-column-left">                                     
                <div class="control-group">
                    <label class="control-label" for="">Comment</label>
                    <div class="controls">
                    {{ camp_edit object="comment" attribute="content" html_code="id=\"comment\" tabindex=\"4\"" }}
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        {{ recaptcha }}
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            {{ /comment_form }}
            <div class="clearfix"></div>
            {{ else }}
                <p>{{ #commentsLocked# }}</p>
            {{ /if }}
        {{ else }}
            <!-- user is not logged in -->
            {{ if $gimme->article->number && $gimme->article->comments_locked == 0 && $gimme->article->comments_enabled == 1}}
                {{ if $gimme->submit_comment_action->defined && $gimme->submit_comment_action->rejected }}
                    <p><em>{{ #yourCommentHasNotBeenAccepted# }}</em></p>
                {{ /if }}

                {{ if $gimme->submit_comment_action->is_error }}
                    <p><em>{{ $gimme->submit_comment_action->error_message }}</em></p>
                {{ else }}
                    {{ if $gimme->submit_comment_action->defined }}
                        {{ if $gimme->publication->moderated_comments }}
                            <p><em>{{ #yourCommentHasBeenSentForApproval# }}</em></p>
                        {{ /if }}
                    {{ /if }}   
                {{ /if }}


            {{ comment_form html_code="id=\"comment-form\" class=\"form-horizontal\" " _button="submit" button_html_code="tabindex=\"6\" id=\"comment-button\"  class=\"solid-button form-column-right\" " }}
            <div class="form-column-left">
                <div class="control-group">
                    <label class="control-label" for="inputName">Name</label>
                        <div class="controls">
                            {{ camp_edit object="comment" attribute="nickname" html_code="id=\"author\" tabindex=\"1\" " }}
                        </div>
                </div>
                <div class="control-group">
                        <label class="control-label" for="inputEmail">Email</label>
                        <div class="controls">
                        {{ camp_edit object="comment" attribute="reader_email" html_code="id=\"email\" tabindex=\"2\"" }}
                        </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="">Comment</label>
                    <div class="controls">
                        {{ camp_edit object="comment" attribute="content" html_code="id=\"comment\" tabindex=\"4\" " }}
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        {{ recaptcha }}
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            {{ /comment_form }}
            <div class="clearfix"></div>
            {{ else }}
            <p>{{ #commentsLocked# }}</p>
        {{ /if }}
    {{ /if }}
{{ /if }}

</aside>
