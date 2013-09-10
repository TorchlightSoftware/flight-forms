define ['vendor/flight-forms/index', 'data/name-form'],
  ({list, form}, nameForm) ->

    # render the received data
    nameForm = _.clone nameForm
    nameForm.receiver = (data) ->
      list.attachTo '#test-component', {data}

    # render the form
    form.attachTo '#test-component', nameForm
