// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
  $('form.process_form').submit(function(e){
    e.preventDefault()
    url = $('input#url').val();
    $.getJSON('/process', {url: url}, function(response){
      if(response.id != undefined) {
        $('#videoId p span').text(response.id)
        $('.message_box').fadeOut(300, function(){
          $('#errorMessage').hide();
          $('#videoId').show();
          $(this).fadeIn(200);
        })

      } else {
        $('#errorMessage p').text(response.message)
        $('.message_box').fadeOut(300, function(){
          $('#videoId').hide();
          $('#errorMessage').show();
          $(this).fadeIn(200);
        })
      }
    });
  });
});
