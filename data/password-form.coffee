# yay, transient this!
regex = /^.{6,}$/i
validation = regex.test.bind(regex)

define {
  name: 'enterName'
  submitText: 'Continue'
  prompt: 'Please enter your name:'

  fields: [
      name: 'pass'
      inputType: 'password'
      label: 'Password'
      validation: validation
      required: true
    ,
      name: 'passConf'
      inputType: 'password'
      label: 'Confirm Password'
      linked: ['password']
      validation: (text) ->
        return false unless validation(text)
        return 'Password confirmation must match.' unless text is $(".controls [name=password]").val()
      required: true
  ]
}
