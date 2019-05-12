# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#offer_category_name').autocomplete
    source: $('#offer_category_name').data('autocomplete-source')
jQuery ->
  $('#search').autocomplete
      source: $('#search').data('autocomplete-source')
jQuery ->
  $('#category').autocomplete
    source: $('#category').data('autocomplete-source')

