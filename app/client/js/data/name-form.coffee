# yay, transient this!
regex = /^[A-Z]+$/i
validation = regex.test.bind(regex)

define {
  name: 'enterName'
  submitText: 'Continue'
  prompt: 'Please enter your name:'

  fields: [
      name: 'firstName'
      inputType: 'text'
      defaultValue: 'Bob'
      label: 'First Name'
      validation: validation
      required: true
    ,
      name: 'lastName'
      inputType: 'text'
      defaultValue: 'Smith'
      label: 'Last Name'
      validation: validation
      required: true
  ]
}
