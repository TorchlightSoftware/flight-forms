define ['vendor/flight-forms/form', 'data/name-form', 'data/password-form', 'data/combo-form', 'data/paragraph-form'],
  (form, nameForm, passwordForm, comboForm, paragraphForm) ->

    formData = paragraphForm

    # render the received data
    formData = _.clone formData
    formData.receiver = (data) ->
      console.log {data}
      display = for field, val of data
        "<p><strong>#{field}:</strong> #{val}</p>"
      display.push "<a href='/'>Back</a>"
      display = display.join '\n'

      $('#test-component').html display

    # render the form
    form.attachTo '#test-component', formData
