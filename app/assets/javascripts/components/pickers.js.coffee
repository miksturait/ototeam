$(document).on 'ready page:change page:fetch', ->
  $(".datepicker").datetimepicker
    pickTime: false
    endDate: "-0d"

  $(".datetimepicker").datetimepicker pickSeconds: false

  $(".timepicker").datetimepicker
    pickDate: false
    pickSeconds: false
