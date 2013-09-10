define ->
  if window and not window?.console?.log
    window.console = log: ->
