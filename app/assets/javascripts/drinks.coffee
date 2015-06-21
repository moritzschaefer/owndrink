# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

try
  $.ajax( '/client_token').done (response) ->
    braintree.setup(response, "dropin", {
      container: "payment-form"
    })
catch error
  ;

$('#upload_button').click () ->
  $('#bottle_banner').css('visibility', 'visible')


try
  $('#drink_form').change (handler) ->
    if $('#bottle_type').val() == 0
      #console.log("set to image" + )
      $('#bottle_img').css("background-image","url(<%= asset_path('0.jpg') %>)");
    if $('#bottle_type').val() == 1
      $('#bottle_img').css("background-image","url(<%= asset_path('1.jpg') %>)");
    if $('#bottle_type').val() == 2
      $('#bottle_img').css("background-image","url(<%= asset_path('2.jpg') %>)");
    # change color
    if $('#drink_flavor_base').val() == 'Rabarber'
      $('#bottle_overlay').css("background-color","#DD4444");
    if $('#drink_flavor_base').val() == 'Ingwer'
      $('#bottle_overlay').css("background-color","#EEEEAA");
    if $('#drink_flavor_base').val() == 'Maracuja'
      $('#bottle_overlay').css("background-color","#CFAA55");


catch error
  console.log error
