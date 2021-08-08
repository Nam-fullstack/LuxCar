$(document).ready ->
  $(".select_make").on "change", ->
    $.ajax
      url: "/variants/new"
      type: "GET"
      dataType: "script"
      data:
        make_id: $('.select_make option:selected').val()
  $(".select_transmission").on "change", ->
    $.ajax
      url: "/variants/new"
      type: "GET"
      dataType: "script"
      data:
        transmission_id: $('.select_transmission option:selected').val()
  $(".select_body_type").on "change", ->
    $.ajax
      url: "/variants/new"
      type: "GET"
      dataType: "script"
      data:
        body_type_id: $('.select_body_type option:selected').val()
