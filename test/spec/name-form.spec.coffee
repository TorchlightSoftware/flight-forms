fill = (name, text) ->
  $("form#enterName [name=#{name}]").text(text)

submit = ->
  $("form#enterName button[type=submit]").click()

define ["lib/data/name-form"], (nameForm) ->
  describeComponent "lib/form", ->

    # Initialize the component and attach it to the DOM
    setup = (receiver) ->
      nameForm = _.clone nameForm
      nameForm.receiver = receiver
      setupComponent nameForm

    #beforeEach ->

    it "should be defined", ->
      setup()
      expect(@component).toBeDefined()

    it "should do something", ->
      setup (data) ->
        expect(data).toEql {
          firstName: 'Bob'
          lastName: 'Smith'
        }

      expect($(".form-heading")).toExist()

      fill 'firstName', 'Bob'
      fill 'lastName', 'Smith'
      submit()
