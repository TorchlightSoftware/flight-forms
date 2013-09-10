{join} = require 'path'
require 'sugar'
Object.extend()
for prop in ['size', 'isObject', 'watch'] # remove conflicts with coffee-script
  Object.sugarRevert prop

rel = (path) ->
  join __dirname, '../', path

environment = process.env.NODE_ENV or 'development'

config =
  development:
    app:
      name: 'Flight Forms'
      url: 'http://localhost:4000'
      api: null
      port: 4000
      publicPort: 4000
      host: 'localhost'
      ssl: false
        #key: rel 'tmp/certs/test.com.key'
        #cert: rel 'tmp/certs/test.com.crt'

paths =
  root:       rel '.'
  npmBin:     rel 'node_modules/.bin'
  scripts:    rel 'scripts/sources'
  data:       rel 'data'
  test:       rel 'test/server'
  lib:        rel 'lib'

  app:        rel 'app'
  client:     rel 'app/client'
  public:     rel 'app/public'

  server:     rel 'app/server'
  load:       rel 'app/server/load'

path = (spec) ->
  parts = spec.split '/'
  root = parts.shift()
  throw new Error "'#{root}' is not a path in config.coffee" unless paths[root]?
  join paths[root], parts.join '/'

# sensible error message if env is wrong
unless config[environment]
  console.log "Could not find config for environment: [#{environment}].  Valid environments: [#{Object.keys(config).join ', '}]"
  process.exit(1)

global.config = config[environment].merge
  env: environment
  paths: paths
  path: path
  require: (spec) ->
    require path spec
  services: {} # loaded with application
  service: (serviceName) ->
    global.config.services[serviceName]

module.exports = global.config
