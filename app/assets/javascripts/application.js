// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/datepicker
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .


//Calendar dates for booking
  $(function() {
    $( "#booking_start_date" ).datepicker({
      dateFormat: "dd/mm/yy",
      minDate: 0,
      defaultDate: 0,
      changeMonth: true,
      numberOfMonths: 1,
      onClose: function( selectedDate ) {
        $( "#booking_end_date" ).datepicker( "option", "minDate", selectedDate );
      }
    });
    $( "#booking_end_date" ).datepicker({
      dateFormat: "dd/mm/yy",
      defaultDate: +1,
      changeMonth: true,
      numberOfMonths: 1,
      onClose: function( selectedDate ) {
        $( "#booking_start_date" ).datepicker( "option", "maxDate", selectedDate );
      }
    });
  });

//end calendar dates for booking


// map-wrapper position
$(document).ready(function(){
    $(window).scroll(function(){

      if ($(window).width() > 768) {
        if ($(window).scrollTop() > 65) {
          $('.map-wrapper').css({'position': 'fixed', 'margin-top': '-66px', 'height': 'calc(100vh + 65px)' });
        } else {
          $('.map-wrapper').css({'position': 'absolute', 'margin-top': '0', 'height': 'calc(100vh - 65px)' });
        }
      } else {
        $('.map-wrapper').css({'position': 'relative', 'margin-top': '0', 'height': '300px', 'width': '100%' });
      }
    })
})
// end map-wrapper position