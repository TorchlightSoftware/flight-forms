// Generated by CoffeeScript 1.6.3
(function() {
  define(['vendor/flight-forms/form', 'data/name-form'], function(form, nameForm) {
    nameForm = _.clone(nameForm);
    nameForm.receiver = function(data) {
      var display, field, val;
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
    return form.attachTo('#test-component', nameForm);
  });

}).call(this);
