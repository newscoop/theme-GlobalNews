{{ config_load file="{{ $gimme->language->english_name }}.conf" }}
<section id="poll" class="block">
{{ list_articles length="1" ignore_issue="true" ignore_section="true" constraints="type is poll" }}
{{ list_debates length="1" item="article" }}
    <div class="pollWrap">
        <h4>{{ #poll# }}</h4>
    {{ if $gimme->debate_action->defined }}
        <blockquote>{{ $gimme->debate->question }}</blockquote>
        {{ if $gimme->debate->user_vote_count >= $gimme->debate->votes_per_user || $gimme->debate_action->ok }}
            <blockquote class="white-text poll-info">{{ #thankYouPoll# }}</blockquote>
        {{ elseif $gimme->debate_action->is_error }}
            <blockquote class="white-text poll-info">{{ #alreadyVoted# }}</blockquote>
            <div class="clearfix"></div>
        {{ /if }}                        

        {{ assign var="votes" value=0 }}
        {{ list_debate_answers }}
          <div class="poll-option">
              <label for="radio{{ $gimme->current_list->index }}">{{ $gimme->debateanswer->answer }}
              <div class="q-score"> <small>{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%</small></div>
              </label>
              <div class="progress">
                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}" aria-valuemin="0" aria-valuemax="100" style="width:{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%;"></div>
              </div>
          </div>
            {{ assign var="votes" value=$votes+$gimme->debateanswer->votes }}
            {{ if $gimme->current_list->at_end }}
            <div class="total-votes"><span>{{ #numberOfVotes# }}: {{ $votes }}</span></div>
            {{ /if }}
        {{ /list_debate_answers }}

    {{ else }}
       {{ if $gimme->debate->is_votable }}

            <blockquote>{{ $gimme->debate->question }}</blockquote> 
            {{ debate_form template="_tpl/poll.tpl" submit_button="{{ #pollButton# }}" html_code="id=\"poll-button\" class=\"button debbut center\"" }}  
            
            {{* this is to find out template id for this template, will have to be assigned as hidden form field *}}     
            {{ $uriAry=explode("tpl=", {{ uri options="template _tpl/poll.tpl" }}, 2) }}                        

            <input name="tpl" value="{{ $uriAry[1] }}" type="hidden">
            {{ list_debate_answers }}
              <div class="poll-option">
                  <!--input type="radio" id="radio{{ $gimme->current_list->index }}" name="radios1" /-->
                  <label for="radio{{ $gimme->current_list->index }}">{{ $gimme->debateanswer->answer }}
                  {{ debateanswer_edit html_code="id=\"radio{{ $gimme->current_list->index }}\"" }}
                  <div class="q-score"> <small>{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%</small></div>
                  </label>
                  <div class="progress">
                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}" aria-valuemin="0" aria-valuemax="100" style="width:{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%;"></div>
                  </div>
              </div>
            {{ /list_debate_answers }}
            {{ /debate_form }}                        
            
       {{ else }}                       
            <blockquote>{{ $gimme->debate->question }}</blockquote> 
            {{ if $gimme->debate->user_vote_count >= $gimme->debate->votes_per_user }}
            <blockquote class="white-text poll-info">{{ #thankYouPoll# }}</blockquote>
            <div class="clearfix"></div>
            {{ /if }}  
            {{ list_debate_answers }}
              <div class="poll-option">
                  <label for="radio{{ $gimme->current_list->index }}">{{ $gimme->debateanswer->answer }}
                        <div class="q-score"> <small>{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%</small></div> 
                  </label>
                  <div class="progress">
                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}" aria-valuemin="0" aria-valuemax="100" style="width:{{ math equation="round(x)" x=$gimme->debateanswer->percentage_overall format="%d" }}%;"></div>
                  </div>
              </div>
            {{ /list_debate_answers }}

       {{ /if }}
    {{ /if }}
    {{ if $gimme->current_list->at_end }}
    </div>
    {{ /if }}
    {{ /list_debates }}
    {{ /list_articles }}
</section>
