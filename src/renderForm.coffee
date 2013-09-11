define ["./formTemplate", "./validateField", "./notifyInline", "./util"],
  (formTemplate, validateField, notifyInline, {random, getType, formToHash}) ->

    (options={}) ->
      {receiver, fields} = options

      # spit out an error if there's no fields
      unless fields and fields.length > 0
        console.log
          message: "Called renderForm with no fields."
          context:
            fields: fields
            options: options

        $(options.placement).html "Oops! There's no data for this form. The support team has been notified."
        return

      # defaults
      for f in fields
        f.defaultValue ||= ""

      options.name ||= random()
      options.submit ||= "group"
      options.submitText ||= "Send"
      options.placement ||= "#content"

      # render html
      $(options.placement).html formTemplate {options: options, fields: fields}

      $("##{options.name}").find(":input").filter(":visible:first").focus()

      # field validations
      validatedFields = fields.filter (f) -> f.required or f.validation

      # perform inline validations
      validatedFields.map (field) ->
        {name} = field

        # trigger validation on linked fields
        if field.linked and getType(field.linked) is "Array"
          for linked in field.linked
            $("#{options.placement} .controls [name=#{linked}]").change ->
              $("#{options.placement} .controls [name=#{name}]").change()

        # trigger validation
        $("#{options.placement} .controls [name=#{name}]").change ->
          error = validateField field, $(@).val()
          notifyInline options.placement, name, error

      # wire up submit
      $("##{options.name}").submit (evt) ->
        evt.preventDefault()

        formParams = formToHash @

        # perform validations
        valid = true
        for field in validatedFields
          error = validateField field, formParams[field.name]
          notifyInline options.placement, field.name, error
          valid = false if error

        # done
        return unless valid
        receiver formParams
