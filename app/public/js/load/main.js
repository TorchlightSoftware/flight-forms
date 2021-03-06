// Generated by CoffeeScript 1.6.3
(function() {
  define(['vendor/flight-forms/form', 'data/name-form', 'data/password-form', 'data/combo-form', 'data/paragraph-form'], function(form, nameForm, passwordForm, comboForm, paragraphForm) {
    var formData;
    formData = paragraphForm;
    formData = _.clone(formData);
    formData.receiver = function(data) {
      var display, field, val;
      console.log({
        data: data
      });
      display = (function() {
        var _results;
        _results = [];
        for (field in data) {
          val = data[field];
          _results.push("<p><strong>" + field + ":</strong> " + val + "</p>");
        }
        return _results;
      })();
      display.push("<a href='/'>Back</a>");
      display = display.join('\n');
      return $('#test-component').html(display);
    };
    return form.attachTo('#test-component', formData);
  });

}).call(this);
