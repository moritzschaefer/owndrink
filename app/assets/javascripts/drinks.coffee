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

