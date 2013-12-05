<section id="latest-articles-block" class="block visible-lg visible-md">
    <h4>{{ #latestArticles# }}</h4>
    {{ list_articles length="5" ignore_issue="true" ignore_section="true" constraints="type not poll" order="byPublishDate desc" }}
    <div class="link">
        <div class="time">{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</div><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a>
    </div>
    {{ /list_articles }}
</section>
