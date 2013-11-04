<div class="article_rating">
    <h4>{{ #articleRating# }}:</h4>
    <div id="{{ $gimme->article->number }}" class="rate_widget">
        <ul class="stars">
            <li class="star_1 ratings_stars"></li>
            <li class="star_2 ratings_stars"></li>
            <li class="star_3 ratings_stars"></li>
            <li class="star_4 ratings_stars"></li>
            <li class="star_5 ratings_stars"></li>
        </ul>
        <p class="total_votes">{{ #voteData# }}</p>
        <p class="rating_error"></p>
    </div>
</div>
<div class="clearfix"></div>
