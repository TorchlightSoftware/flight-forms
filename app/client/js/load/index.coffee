require.config
  baseUrl: "."
  packages: [
    {name: "app", location: "js"}
    {name: "templates", location: "templates"}
    {name: "load", location: "js/load"}
    {name: "data", location: "js/data"}
    {name: "helpers", location: "js/helpers"}
    {name: "vendor", location: "js/vendor"}
    {name: "components", location: "js/components"}
  ]

  map: "*":
      {"flight": "js/vendor/flight"}

require ['load/shim', 'load/main']
