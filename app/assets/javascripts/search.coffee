# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.airline_box').hide()
  $('.product_box').hide()
  $('.aircraft_box').hide()
  $('.routes_box').hide()
  $(document).on 'change', '#alliance_dd', (evt) ->
    $('.airline_box').slideDown()
    if ($("#alliance_dd option:selected").val()!="")
      $.ajax 'search/update_airline',
        type: 'GET'
        dataType: 'script'

        data: {
          alliance_val: $("#alliance_dd option:selected").val()

        }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log("AJAX Error: #{textStatus}")
        success: (data, textStatus, jqXHR) ->
          console.log("Dynamic country select OK!")
#Product
  $(document).on 'change', '#airline_dd', (evt) ->
    $('.product_box').slideDown()
    if ($("#airline_dd option:selected").val()!="")
      $.ajax 'search/update_seat',
        type: 'GET'
        dataType: 'script'

        data: {
          airline_val: $("#airline_dd option:selected").val()

        }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log("AJAX Error: #{textStatus}")
        success: (data, textStatus, jqXHR) ->
          console.log("Dynamic country select OK!")


#Aircraft
  $(document).on 'change', '#product_dd', (evt) ->
    $('.aircraft_box').slideDown()
    if ($("#product_dd option:selected").val()!="")
      $.ajax 'search/update_aircraft',
        type: 'GET'
        dataType: 'script'

        data: {
          airline_val: $("#airline_dd option:selected").val()
          product_val: $("#product_dd option:selected").val()

        }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log("AJAX Error: #{textStatus}")
        success: (data, textStatus, jqXHR) ->
          console.log("Dynamic country select OK!")


#Routes
  $(document).on 'change', '#aircraft_dd', (evt) ->
    $('.routes_box').slideDown()
    if ($("#aircraft_dd option:selected").val()!="")
      $.ajax 'search/update_routes',
        type: 'GET'
        dataType: 'script'

        data: {
          airline_val: $("#airline_dd option:selected").val()
          aircraft_val: $("#aircraft_dd option:selected").val()

        }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log("AJAX Error: #{textStatus}")
        success: (data, textStatus, jqXHR) ->
          console.log("Dynamic country select OK!")

  $('.reset_btn').click ->
    window.location.href = "/";
