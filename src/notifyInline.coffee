define ->
  (node, fieldName, message) ->
    group = node.find(".control-group[name=#{fieldName}]")
    help = node.find(".control-group[name=#{fieldName}] span.help-inline")

    if message
      group.addClass 'error'
      help.html message

    else
      group.removeClass 'error'
      help.html ""
