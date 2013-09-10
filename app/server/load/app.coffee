connect = require 'connect'
createServer = require './createServer'

module.exports = (cb) ->

  port = (process.env.PORT or config.app.port)

  # Web server
  app = connect()
  app.use (req, res, next) ->
    res.setHeader "Access-Control-Allow-Origin", "*"
    next()
  app.use connect.compress()
  app.use connect.responseTime()
  app.use connect.favicon()
  app.use connect.staticCache()
  app.use connect.query()
  app.use connect.cookieParser()
  app.use connect.static config.paths.public

  server = createServer port, app

  # Good job, we made it!
  console.log "Server started on #{port}"

  cb()
