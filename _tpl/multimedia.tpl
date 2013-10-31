{{* assign counter and maximum count for collecting multimedia files *}}
{{assign var=multimediacounter value=0}}
{{assign var=multimediacountermax value=1}}
{{ list_articles length="100" ignore_issue="true" ignore_section="true" order="bypublishdate desc" }}
  {{* check if we have to do anything => not yet hit maximum *}}
  {{if $multimediacounter lt $multimediacountermax}}
      {{* assign variable for current article. 1 => has multimedia *}}
      {{assign var=multimediacurrent value=0}}
      {{ if $gimme->article->has_attachments }} 
          {{ list_article_attachments }}
              {{ if $gimme->attachment->extension == ogv || $gimme->attachment->extension == ogg || $gimme->attachment->extension == mp4 || $gimme->attachment->extension == webm }}             
                {{assign var=multimediacurrent value=1}}
                {{assign var=multimediatype value='video'}}
              {{ /if }}  
          {{ /list_article_attachments }}   
      {{ /if }}  
      {{* check now if multimedia found *}}
      {{if $multimediacurrent == 1}}
        {{* add to array with multimedia articles *}}
        {{append var=multimedia value="`$multimediatype`" index="`$gimme->article->number`"}}
        {{* increase counter to check for max number *}}
        {{ assign "multimediacounter" $multimediacounter+1 }}
      {{/if}}
  {{/if}}
{{ /list_articles }} 

<section id="video-block" class="block">
    <h4>{{ #video# }}≫</h4>
    {{ foreach from=$multimedia key=articleID item=multimediaType name=multimediaLoop }}
        {{ list_articles ignore_issue="true" ignore_section="true" length="1" constraints="number is `$articleID`"}}
        <a href="{{ url options="article" }}">
            {{ include file="_tpl/img/img_400x250.tpl" }}
        </a>
        <span>{{ $gimme->article->category->name }}: <a href="{{ url options='article' }}">{{ $gimme->article-> na}}</a></span>
        {{ /list_articles }}
    {{ /foreach }}
</section>
