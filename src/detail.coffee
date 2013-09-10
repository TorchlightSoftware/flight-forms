define ["flight/component"], (defineComponent) ->
  list = ->
    @defaultAttrs {}
    @after "initialize", ->
      @$node.html "hello"

  defineComponent(list)
