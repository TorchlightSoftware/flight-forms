define ['vendor/flight-forms/form', 'data/name-form'],
  (form, nameForm) ->

    # render the received data
    nameForm = _.clone nameForm
    nameForm.receiver = (data) ->
      display = for field, val of data
        "<p><strong>#{field}:</strong> #{val}</p>"
      display.push "<a href='/'>Back</a>"
      display = display.join '\n'

      $('#test-component').html display

    # render the form
    form.attachTo '#test-component', nameForm
