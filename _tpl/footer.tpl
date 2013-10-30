            <footer id="footer">
                <div class="row">
                    <div id="about-us-block" class="col-lg-5 col-md-5">
                    	<h4>About us</h4>
                        <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam quis risus eget urna mollis ornare vel eu leo. Cras mattis consectetur purus sit amet fermentum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <p>{{#copyrightMessage#}}</p>
                    </div>
                    <div id="sections-block" class="col-lg-2 col-md-2">
                        <h4>Sections</h4>
                        <nav>
                        {{ local }}
                        {{ set_current_issue }}
                        {{ list_sections }}
                        	<a href="{{ url options='section' }}" title="{{ $gimme->section->name }}"> {{ $gimme->section->name }}</a>
                        {{ /list_sections }}
                        {{ /local }}
                    	</nav>
                    </div>
                    <div id="more-links-block" class="col-lg-2 col-md-2">
                        <h4>More Links</h4>
                        {{ list_articles ignore_issue="true" ignore_section="true" constraints="type is page" }}
                        <a href="{{ url options="article" }}">{{ $gimme->article->name }}</a>
                        {{ /list_articles }}
                        <a target="_blank" href="http://twitter.com/sourcefabric ">{{ #followUs# }}</a>
                        <a target="_blank"href="http://facebook.com/sourcefabric ">{{ #beOurFan# }}</a>
                        <a href="/en/static/rss">{{ #subscribeToOurFeed# }}</a>
                        <a href="/?tpl=6">{{ #archive# }}</a>
                    </div>
                    <div id="contact-us-block" class="col-lg-3 col-md-3">
                        <h4>{{ #contactUs# }}</h4>
                        <div class="info">
                            <span class="link-color">{{ #email# }}</span>
                            contact@sourcefabric.org 
                        </div>

                        <div class="info">
                            <span class="link-color">{{ #address# }}</span>
                            Salvátorská 10, 110 00 Praha 1, Czech Republic
                        </div>

                        <div class="info">
                            <span class="link-color">{{ #phone# }}</span>
                             +420 222 362 540
                        </div>
                    </div>
                </div>
            </footer>
