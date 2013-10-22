# flight-forms

[![Build Status](https://secure.travis-ci.org/TorchlightSoftware/flight-forms.png)](http://travis-ci.org/<username>/flight-forms)

A [Flight](https://github.com/flightjs/flight) component for rendering forms and directing the result to RPC/Ajax or any processor function.

## Installation

```bash
bower install --save flight-forms
```

## Example

```coffee-script

require ['flight-forms', 'lodash'], (form, _) ->
  teaForm =
    name: 'teaSelection',
    submitText: 'Brew it!',
    prompt: "Tea time.",
    fields: [
      {
        name: 'instructions',
        inputType: 'static',
        value: 'Do stupid things calmer, with more dedication!'
      }, {
        name: 'teaPreference',
        inputType: 'selection',
        label: 'Tea Preference',
        defaultValue: 'Green',
        selections: [
          {
            id: 'green',
            label: 'Green'
          }, {
            id: 'black',
            label: 'Black'
          }, {
            id: 'white',
            label: 'White'
          }, {
            id: 'black',
            label: 'Black'
          }, {
            id: 'oolong',
            label: 'Oolong'
          }, {
            id: 'herbal',
            label: 'Herbal'
          }, {
            id: 'mate',
            label: 'Mate'
          }, {
            id: 'blend',
            label: 'Blend'
          }
        ],
        required: true
      }, {
        name: 'doAllTheThings',
        inputType: 'button',
        href: '#',
        label: 'Action',
        value: 'Do all the things!'
      }
    ]

  form.attachTo '#someDiv', _.merge options, receiver: (data) ->
    ajaxLib.send data
    rpcLib.send data
    uiComponent.send data
```


## Development

Development of this component requires [Bower](http://bower.io), and preferably
[Karma](http://karma-runner.github.io) to be globally installed:

```bash
npm install -g bower karma
```

Then install the Node.js and client-side dependencies by running the following
commands in the repo's root directory.

```bash
npm install
bower install
```

To continuously run the tests in Chrome and Firefox during development, just run:

```bash
karma start
```

## Contributing to this project

Anyone and everyone is welcome to contribute. Please take a moment to
review the [guidelines for contributing](CONTRIBUTING.md).

* [Bug reports](CONTRIBUTING.md#bugs)
* [Feature requests](CONTRIBUTING.md#features)
* [Pull requests](CONTRIBUTING.md#pull-requests)
