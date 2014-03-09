$(document).on 'ready page:change page:fetch', ->
  $(".datepicker").datetimepicker
    pickTime: false
    endDate: "-0d"
    language: 'en'

  $(".datetimepicker").datetimepicker
    pickSeconds: false
    language: 'en'

  $(".timepicker").datetimepicker
    pickDate: false
    pickSeconds: false
    language: 'en'
