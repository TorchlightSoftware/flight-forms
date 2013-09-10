app = config.require 'load/app'
module.exports = (args) ->
  app ->

    #{postMortem, changeFormat} = config.require 'lib/memdiff'
    #changeFormat 'details'
    #postMortem()
