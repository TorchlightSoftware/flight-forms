should = require "should"
async = require "async"

traffic = require 'traffic'
patience = 4000

componentDiv = '#test-component'

describe 'forms', ->
  afterEach ->
    @end?()

  it 'should show text field', (done) ->
    options = {}

    traffic.visit "http://localhost:4000", (t, @end) =>

      # enter chat
      t.drive [
        t.waitFor componentDiv, patience
        #t.injectComponent 'components/flight-forms', componentDiv, options

        t.waitForText 'Please enter your name:', patience
        t.fill "#enterName input[name=firstName]", "Bob"
        t.fill "#enterName input[name=lastName]", "Smith"
        t.click "#enterName button[type=submit]"

      ], done
