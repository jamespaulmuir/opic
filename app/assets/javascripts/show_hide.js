(function ($) {
    $.fn.showHide = function (options) {
        var defaults = { speed: 1000, changeText: 0 };
        var options = $.extend(defaults, options);
 
        $(this).click(function () {
             var toggleDiv = $(this).attr('rel');

             // hide other show_hide containters
             $('.show_hide').each(function(index, element){
               var hideDiv = $(element).attr('rel')
               if(hideDiv != toggleDiv)
                $(hideDiv).hide(options.speed, options.easing);
             });

             $(toggleDiv).slideToggle(options.speed, options.easing);
 
          return false;
        });
 
    };
})(jQuery);

$(document).ready(function(){
   $('.show_hide').showHide();
   $('.show_hide').each(function(index, element){
     $($(element).attr('rel')).hide();
   });
});