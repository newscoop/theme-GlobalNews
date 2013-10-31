// Contains all custom js and configurations for Anchorage Theme

// Browser detection
jQuery.browser={};(function(){jQuery.browser.msie=false;
jQuery.browser.version=0;if(navigator.userAgent.match(/MSIE ([0-9]+)\./)){
jQuery.browser.msie=true;jQuery.browser.version=RegExp.$1;}})();

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
   autoheight("#content", "#sidebar");
});

$(document).ready(function () {                     

    // // set same height to main-content and sidebar
    autoheight("#content", "#sidebar");

    // binding resize of window, set the same height after resize
    $(window).resize(function(){
      autoheight("#content", "#sidebar");                
    });
   
    //HACK: to add/remove active class on the slider, bootstrap slider works slightly different 
    $("#carousel-sections a").click(function(){
      $("#carousel-sections a").removeClass("active");
      this.className = this.className + " active";
    })
  
    // Poll Ajaxified
    $('#poll-button').click(function(){
      $.post($('form[name=debate]').attr("action"),$('form[name=debate]').serialize(),function(data){$('#poll').html(data);});
      return false;
    });     

});
