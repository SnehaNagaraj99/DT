# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#persons-datatable').dataTable
    processing: true
    serverSide: true
    ajax:
      url: $('#persons-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'first_name'}
      {data: 'last_name'}
      {data: 'email'}
      {data: 'bio'}
    ]