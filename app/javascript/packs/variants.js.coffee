$(document).ready ->
  $(".make_selection").on "change", ->
    $.ajax
      url: "/variants/new"
      type: "GET"
      dataType: "script"
      data:
        make_id: $('.make_selection option:selected').val()
# $(document).ready ->
#   $(".transmission_selection").on "change", ->
#     $.ajax
#       url: "/variants/new"
#       type: "GET"
#       dataType: "script"
#       data:
#         transmission_id: $('.transmission_selection option:selected').val()
# $(document).ready ->
#   $(".body_type_selection").on "change", ->
#     $.ajax
#       url: "/variants/new"
#       type: "GET"
#       dataType: "script"
#       data:
#         body_type_id: $('.body_type_selection option:selected').val()
