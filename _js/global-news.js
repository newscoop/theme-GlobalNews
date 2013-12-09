// Contains all custom js and configurations for Anchorage Theme

// Browser detection
jQuery.browser={};(function(){jQuery.browser.msie=false;
jQuery.browser.version=0;if(navigator.userAgent.match(/MSIE ([0-9]+)\./)){
jQuery.browser.msie=true;jQuery.browser.version=RegExp.$1;}})();

var snapper = null;

if ( $.browser.msie && $.browser.version < 8 ) {
  //definition for autoheight function for IE 7
  var autoheight = function(){
     //set height to auto to prevent fixed height
     $(arguments).each(function(n, elem){
         $(elem).css('height', 'auto');
     });

     // get max height
     var lista = $(arguments).map(function(n, elem){
                    return $(elem).outerHeight();
                  }).get();

     var max_height = Math.max.apply(null, lista);

     // set height to all elements
     for (var i=0; i<arguments.length; i++){
       var css_height = $(arguments[i]).outerHeight(); 
       if (css_height < max_height){
         //hack for IE if you put less than 15 
         //it produces an infinite loop
         $(arguments[i]).height(max_height-15);
       }
     }
  }
} else{
    var autoheight = function(){
        // set height to auto to prevent fixed height
        $(arguments).each(function(n, elem){
            $(elem).css('height', 'auto');
        });

        // get max height
        var max_height = Math.max.apply(
            null, $(arguments).map(function(n, elem){
               return $(elem).outerHeight();
            }).get()
        );

        // set height to all elements
        $(arguments).each(function(n, elem){
            $(elem).height(max_height);
        });          
    }

}

// Set the same height to main-content and sidebar when the page has finished to load
$(window).load(function(){
   if ($(document).width() >= 980){
     autoheight("#content", "#sidebar");
   } 
});


$(document).ready(function () {                     

    // // set same height to main-content and sidebar
    if ($(document).width() >= 980){
      autoheight("#content", "#sidebar");
    } 

    // binding resize of window, set the same height after resize
    $(window).resize(function(){
      enable_disable_snapper();
      if ($(document).width() >= 980){
        autoheight("#content", "#sidebar");
      } else {
        $("#content").css('height', 'auto');
        $("#sidebar").css('height', 'auto');
      }
    });
   
    //Add/remove active class on the slider, bootstrap slider works slightly different 
    $("#carousel-sections a").click(function(){
      $("#carousel-sections a").removeClass("active");
      this.className = this.className + " active";
    })

    // adding bootstrap style to tables in articles
    $(".article-content table").addClass('table table-striped table-bordered');

    // initialize timeago plugin for dates
    $(".timeago").timeago();
    
    // Poll Ajaxified
    $('#poll-button').click(function(){
      $.post($('form[name=debate]').attr("action"),$('form[name=debate]').serialize(),function(data){$('#poll').html(data);});
      return false;
    });     


    $('.rate_widget').each(function(i) {
        var widget = this;
        var out_data = {
            f_article_number : $(widget).attr('id')
        };
        $.post(
            '/rating/show',
            out_data,
            function(INFO) {
                $(widget).data( 'fsr', INFO );
                set_votes(widget);
            },
            'json'
        );
    });


    $('.ratings_stars').hover(
        // Handles the mouseover
        function() {
            $(this).prevAll().andSelf().addClass('ratings_over');
            $(this).nextAll().removeClass('ratings_vote'); 
        },
        // Handles the mouseout
        function() {
            $(this).prevAll().andSelf().removeClass('ratings_over');
            // can't use 'this' because it wont contain the updated data
            set_votes($(this).closest('.rate_widget'));
        }
    );
    
    
    // This actually records the vote
    $('.ratings_stars').bind('click', function() {
        var star = this;
        var widget = $(this).closest('.rate_widget');
        var score = $(star).attr('class').match(/star_(\d+)/)[1];
 
        var clicked_data = {
            f_rating_score : score,
            f_article_number : widget.attr('id')
        };
        $.post(
            '/rating/save',
            clicked_data,
            function(INFO) {
                widget.data( 'fsr', INFO );
                set_votes(widget);
            },
            'json'
        ); 
    });

    // Community page navigation
    var pathname = document.location.pathname;
    if (pathname === "/user") {
        $("#user-active").addClass('active');
    } else if (pathname === "/user/filter/f/a-z"){
        $("#user-all").addClass('active');
    } else if (pathname === "/user/filter/f/a-d"){
        $("#user-ad").addClass('active');
    } else if (pathname === "/user/filter/f/e-k"){
        $("#user-ek").addClass('active');
    } else if (pathname === "/user/filter/f/l-p"){
        $("#user-lp").addClass('active');
    } else if (pathname === "/user/filter/f/q-t"){
        $("#user-qt").addClass('active');
    } else if (pathname === "/user/filter/f/u-z"){
        $("#user-uz").addClass('active');
    } else if (pathname === "/user/editors"){
        $("#user-editors").addClass('active');
    }

    // Debate graph configuration
    if (jQuery().sparkline){
       $('.graph').sparkline('html',{enableTagOptions:true} ); 
    }

    // Responsive menu 
    snapper = new Snap({
      element: document.getElementById('main-container'),
      disable: 'right',
    });

    enable_disable_snapper();
    enable_click();

    snapper.on('open', function(){
      disable_click();
    });

    snapper.on('close', function(){
      disable_click();
      enable_click();
    });

});

function enable_disable_snapper(){
    if (snapper){
        if ($(document).width()>980){
            snapper.disable();
        } else{
            snapper.enable();
        }
    }
}

function enable_click(){
    console.log("binding click");
    $("#responsive-menu-button").prop("disabled", false);
    $("#responsive-menu-button").click(function(){
      if( snapper.state().state=="left" ){
          snapper.close();
      } else {
          snapper.open('left');
      }
    });
}

function disable_click(){
    $("#responsive-menu-button").unbind("click");
    $("#responsive-menu-button").prop("disabled", true);
    console.log("unbinding click");
}

// Votes functionalitty

function set_votes(widget) {
    if ($(widget).data('fsr')) {
        var avg = $(widget).data('fsr').whole_avg;
        var votes = $(widget).data('fsr').number_votes;
        var exact = $(widget).data('fsr').dec_avg;
        var error = $(widget).data('fsr').error;

        $(widget).find('.star_' + avg).prevAll().andSelf().addClass('ratings_vote');
        $(widget).find('.star_' + avg).nextAll().removeClass('ratings_vote'); 
        $(widget).find('.total_votes').text(votes + ' ' + votes_str + ' ' + averageRating_str + ' ' + exact);
        $(widget).find('.rating_error').text(error);
    }
}
