define {
  name: 'teaSelection'
  submitText: 'Brew it!'
  prompt: "Tea time."

  fields: [
      name: 'instructions'
      inputType: 'static'
      value: 'Do stupid things calmer, with more dedication!'
    ,
      name: 'teaPreference'
      inputType: 'selection'
      label: 'Tea Preference'
      defaultValue: 'Green'
      selections: [
          id: 'green'
          label: 'Green'
        ,
          id: 'black'
          label: 'Black'
        ,
          id: 'white'
          label: 'White'
        ,
          id: 'black'
          label: 'Black'
        ,
          id: 'oolong'
          label: 'Oolong'
        ,
          id: 'herbal'
          label: 'Herbal'
        ,
          id: 'mate'
          label: 'Mate'
        ,
          id: 'blend'
          label: 'Blend'
      ]
      required: true
    ,
      name: 'doAllTheThings'
      inputType: 'button'
      href: '#'
      label: 'Action'
      value: 'Do all the things!'
  ]
}
