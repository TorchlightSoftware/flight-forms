require '../../app/config'
{app: {publicPort, url, api}} = config

module.exports = ->
  clientConfig = JSON.stringify {publicPort, url, api}
  console.log "define(#{clientConfig});"
