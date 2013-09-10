define ["flight/component", "./formTemplate", "./validateField", "./notifyInline", "./util"],
  (defineComponent, formTemplate, validateField, notifyInline, util) ->

    form = ->
      @defaultAttrs
        name: util.random()
        submit: "group"
        submitText: "Send"
        placement: "#content"
        fields: []
        receiver: ->

      @after "initialize", ->

        # render the form
        @$node.html formTemplate @attr

        # focus on the first visible element
        @$node.find(":input").filter(":visible:first").focus()

        placement = @attr.placement
        node = @$node

        # perform inline validations
        @attr.fields.forEach (field) ->
          return unless field.required or field.validation

          {name} = field
          console.log "adding validation to #{name}"

          # trigger validation on linked fields
          if field.linked and getType(field.linked) is "Array"
            for linked in field.linked
              @$node.find(".controls [name=#{linked}]").change =>
                @$node.find(".controls [name=#{name}]").change()

          # trigger validation
          node.find(".controls [name=#{name}]").change ->
            val = $(@).val()
            console.log {field, val}
            error = validateField field, val
            notifyInline node, name, error

        # wire up submit
        @$node.find("##{@attr.name}").submit (evt) ->
          evt.preventDefault()

          formParams = formToHash @

          # perform validations
          valid = true
          for field in validatedFields
            error = validateField field, formParams[field.name]
            notifyInline node, field.name, error
            valid = false if error

          # done
          return unless valid
          receiver formParams

    defineComponent form
