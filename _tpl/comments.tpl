<aside id="comments">
    {{ list_article_comments order="bydate desc" }}
    <div id="comment-{{$gimme->current_list->index}}" class="comment">
        <div class="comment-content">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 author">
            {{ if $gimme->comment->user->identifier }}
                <img src="{{ include file='_tpl/user-image.tpl' user=$user width=60 height=60 }}" class="avatar" width="60" height="60" alt="{{ $gimme->comment->user->uname }}"><br>
                <a href="http://{{ $gimme->publication->site }}/user/profile/{{ $gimme->comment->user->uname|urlencode }}" >{{ $gimme->comment->user->uname }}</a>
            {{ else }}
                <img src="{{ include file='_tpl/user-image.tpl' user=$user width=60 height=60 }}" width="60" height="60" class="avatar" alt="avatar"><br>
                <a href="#">{{ $gimme->comment->nickname }} ({{ #anonymous# }})</a>
            {{ /if }}
                <br><time class="timeago" datetime="{{ $gimme->comment->submit_date }}">{{ $gimme->comment->submit_date }}</time>
                </div>
                 <div class="col-lg-9 col-md-9 col-sm-9">
                    <div class="comment-box">
                    <div class="arrow-top visible-xs"></div>
                    <div class="arrow-left hidden-xs"></div>
                    {{ $gimme->comment->content }}
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{ /list_article_comments }}
    <h4>{{ #writeComment# }}</h4>

     {{ if !$gimme->publication->public_comments }}
            <!-- public comments are not allowed-->
            {{ if $gimme->user->logged_in }}
                <!-- user is logged in -->
                {{ if $gimme->article->number && $gimme->article->comments_locked == 0 && $gimme->article->comments_enabled == 1}}
                    {{ if $gimme->submit_comment_action->defined && $gimme->submit_comment_action->rejected }}
                    <p class="alert alert-danger"><em>{{ #yourCommentHasNotBeenAccepted# }}</em></p>
                    {{ /if }}

                    {{ if $gimme->submit_comment_action->is_error }}
                        <p class="alert alert-danger"><em>{{ $gimme->submit_comment_action->error_message }}</em></p>
                    {{ else }}
                        {{ if $gimme->submit_comment_action->defined }}
                            {{ if $gimme->publication->moderated_comments }}
                                <p class="alert alert-info"><em>{{ #yourCommentHasBeenSentForApproval# }}</em></p>
                            {{ /if }}
                        {{ /if }}   
                    {{ /if }}
            {{ comment_form html_code="id=\"comment-form\" role=\"form\" class=\"form-horizontal\" " _button="submit" button_html_code="tabindex=\"6\" class=\"solid-button form-column-right\" " }}
                                  
                <div class="form-group">
                    <label class="control-label" for="">Comment</label>
                    <div class="controls">
                    {{ camp_edit object="comment" attribute="content" html_code="id=\"comment\" tabindex=\"4\" class=\"form-control\"" }}
                    </div>
                </div>
                {{ if !$gimme->user->logged_in }}
                <div class="form-group">
                    <div class="controls captcha">
                        {{ recaptcha }}
                    </div>
                </div>
                {{ /if }}
            {{ /comment_form }}
            {{ else }}
                <p class="alert alert-warning">{{ #commentsLocked# }}</p>
            {{ /if }}
        {{ else }}
            <p class="alert alert-danger">{{ #registrationNeeded# }}</p>
        {{ /if }}
    {{ else }}
        <!-- public comments are allowed-->
        {{ if $gimme->user->logged_in }}
            {{ if $gimme->article->number && $gimme->article->comments_locked == 0 && $gimme->article->comments_enabled == 1}}
            {{ if $gimme->submit_comment_action->defined && $gimme->submit_comment_action->rejected }}
                <p class="alert alert-danger"><em>{{ #yourCommentHasNotBeenAccepted# }}</em></p>
            {{ /if }}

            {{ if $gimme->submit_comment_action->is_error }}
                <p class="alert alert-danger"><em>{{ $gimme->submit_comment_action->error_message }}</em></p>
            {{ else }}
                {{ if $gimme->submit_comment_action->defined }}
                    {{ if $gimme->publication->moderated_comments }}
                        <p class="alert alert-info"><em>{{ #yourCommentHasBeenSentForApproval# }}</em></p>
                    {{ /if }}
                {{ /if }}   
            {{ /if }}

            {{ comment_form html_code="id=\"comment-form\" role=\"form\" " _button="submit" button_html_code="tabindex=\"6\" class=\"solid-button form-column-right\" "  }}
                                   
                <div class="form-group">
                    <label class="control-label" for="">Comment</label>
                    <div class="controls">
                    {{ camp_edit object="comment" attribute="content" html_code="id=\"comment\" tabindex=\"4\" class=\"form-control\"" }}
                    </div>
                </div>
                {{ if !$gimme->user->logged_in }}
                <div class="form-group">
                    <div class="controls">
                        {{ recaptcha }}
                    </div>
                </div>
                {{ /if }}

            {{ /comment_form }}
            {{ else }}
                <p class="alert alert-warning">{{ #commentsLocked# }}</p>
            {{ /if }}
        {{ else }}
            <!-- user is not logged in -->
            {{ if $gimme->article->number && $gimme->article->comments_locked == 0 && $gimme->article->comments_enabled == 1}}
                {{ if $gimme->submit_comment_action->defined && $gimme->submit_comment_action->rejected }}
                    <p class="alert alert-danger"><em>{{ #yourCommentHasNotBeenAccepted# }}</em></p>
                {{ /if }}

                {{ if $gimme->submit_comment_action->is_error }}
                    <p class="alert alert-danger"><em>{{ $gimme->submit_comment_action->error_message }}</em></p>
                {{ else }}
                    {{ if $gimme->submit_comment_action->defined }}
                        {{ if $gimme->publication->moderated_comments }}
                            <p class="alert alert-info"><em>{{ #yourCommentHasBeenSentForApproval# }}</em></p>
                        {{ /if }}
                    {{ /if }}   
                {{ /if }}


            {{ comment_form html_code="id=\"comment-form\" role=\"form\" " _button="submit" button_html_code="tabindex=\"6\" id=\"comment-button\"  class=\"solid-button form-column-right\" " }}

                <div class="form-group">
                    <label class="control-label" for="inputName">Name</label>
                        <div class="controls">
                            {{ camp_edit object="comment" attribute="nickname" html_code="id=\"author\" tabindex=\"1\" class=\"form-control\" " }}
                        </div>
                </div>
                <div class="form-group">
                        <label class="control-label" for="inputEmail">Email</label>
                        <div class="controls">
                        {{ camp_edit object="comment" attribute="reader_email" html_code="id=\"email\" tabindex=\"2\" class=\"form-control\"" }}
                        </div>
                </div>
                <div class="form-group">
                    <label class="control-label" for="">Comment</label>
                    <div class="controls">
                        {{ camp_edit object="comment" attribute="content" html_code="id=\"comment\" tabindex=\"4\" class=\"form-control\" " }}
                    </div>
                </div>
                {{ if !$gimme->user->logged_in }}
                <div class="form-group">
                    <div class="controls">
                        {{ recaptcha }}
                    </div>
                </div>
                {{ /if }}

            {{ /comment_form }}

            {{ else }}
            <p class="alert alert-warning">{{ #commentsLocked# }}</p>
        {{ /if }}
    {{ /if }}
{{ /if }}

</aside>
