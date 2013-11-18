{{ include file="_tpl/debate-answers.tpl" scope="parent" }}

{{ capture name="votes" }}
    <div class="debate-score">
        {{ strip }}
        <div class="graph center-block" sparktype="pie" sparkwidth="70%" sparkheight="100%" sparkoffset="-90">
        {{ foreach $answers as $answer }}
           {{ $answer.percent }},
        {{ /foreach }}
        </div>
        {{ foreach $answers as $answer }}
            <br><span><b>{{ $answer.answer|escape }}</b> {{ $answer.percent }}%</span>
        {{ /foreach }}
        {{ /strip }}
        <div class="clearfix"></div>
    </div>
{{ /capture }}

{{ if !$gimme->debate->is_votable }}
    {{ $smarty.capture.votes }}
    <small>{{ if $gimme->debate->is_current && !$gimme->user->logged_in }}{{ #currentResult# }}{{ else }}{{ #finalResult# }}{{ /if }}</small><br>
{{ /if }}
