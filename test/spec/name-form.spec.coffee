fill = (name, text) ->
  $(".component-root input[name=#{name}]").val(text).change()

select = (name, selection) ->
  $(".component-root select[name=#{name}]").val(selection).change()

typeIn = (name, text) ->
  $(".component-root textarea[name=#{name}]").val(text).change()

click = (name) ->
  $(".component-root input[name=#{name}]").click()

submit = ->
  $(".component-root button[type=submit]").click()

expectEqual = (obj1, obj2) ->
  expect(_.isEqual(obj1, obj2)).toBe(true)

expectMessage = (message, selector) ->
  selector or= ".help-inline"
  expect($(selector)).toContainText message

print = (selector) ->
  selector or= '.component-root'
  console.log $(selector).html()

# pull in sample data dependencies
define ["lib/data/name-form", "lib/data/password-form", "lib/data/combo-form", "lib/data/paragraph-form"],
  (nameForm, passwordForm, comboForm, paragraphForm) ->

    describeComponent "lib/form", ->

      # Initialize the component and attach it to the DOM
      setup = (formData, receiver) ->
        formData = _.clone formData
        formData.receiver = receiver
        setupComponent formData

      it "should collect text data", ->
        setup nameForm, (data) ->
          expectEqual data, {
            firstName: 'Bob'
            lastName: 'Smith'
          }

        expect($(".form-heading")).toExist()

        fill 'firstName', 'Bob'
        fill 'lastName', 'Smith'
        submit()

      it "name should be invalid", ->
        setup(nameForm)
        fill 'firstName', '749'
        click 'lastName'
        expectMessage 'Please enter a valid First Name.'

      it "should check required fields", ->
        setup(nameForm)
        submit()
        expectMessage 'First Name is required.'
        expectMessage 'Last Name is required.'

      it "should collect password data", ->
        setup passwordForm, (data) ->
          expectEqual data, {
            pass: 'something'
            passConf: 'something'
          }

        fill 'pass', 'something'
        fill 'passConf', 'something'
        submit()

      it "password should be invalid - complexity", ->
        setup(passwordForm)

        fill 'pass', 'asdf'
        expectMessage 'Please enter a valid Password.'

      it "password should be invalid - mismatch", ->
        setup(passwordForm)

        fill 'pass', 'asdf123'
        fill 'passConf', '123asdf'
        expectMessage 'Password confirmation must match.'

      it "should collect selection data", ->
        setup comboForm, (data) ->
          expectEqual data, {
            teaPreference: 'oolong'
          }

        select 'teaPreference', 'oolong'
        submit()

      it "should collect paragraph data", ->
        setup paragraphForm, (data) ->
          expectEqual data, {
            aboutMe: 'Hey there!'
          }

        typeIn 'aboutMe', 'Hey there!'
        submit()

      it "should render static text", ->
        setup(comboForm)
        expectMessage 'Do stupid things calmer, with more dedication!', 'span[name=instructions]'

      it "should render button", ->
        setup(comboForm)
        expect($('a[name=doAllTheThings]')).toExist()
