define ['./util'], ({getType}) ->

  (field, value) ->
    {required, validation, label} = field

    if required and not value
      return "#{label} is required."

    if not required and not value
      return

    if validation
      result = validation value

      # send false to display the default error
      if result is false
        return "Please enter a valid #{label}."

      # send a string to display a custom error
      else if getType(result) is 'String'
        return result

      # otherwise the validation passed
      else
        return
