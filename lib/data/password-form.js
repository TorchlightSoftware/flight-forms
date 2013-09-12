// Generated by CoffeeScript 1.6.3
(function() {
  var regex, validation;

  regex = /^.{6,}$/i;

  validation = regex.test.bind(regex);

  define({
    name: 'enterName',
    submitText: 'Continue',
    prompt: 'Please enter your name:',
    fields: [
      {
        name: 'pass',
        inputType: 'password',
        label: 'Password',
        validation: validation,
        required: true
      }, {
        name: 'passConf',
        inputType: 'password',
        label: 'Confirm Password',
        linked: ['password'],
        validation: function(text) {
          if (!validation(text)) {
            return false;
          }
          if (text !== $(".controls [name=password]").val()) {
            return 'Password confirmation must match.';
          }
        },
        required: true
      }
    ]
  });

}).call(this);