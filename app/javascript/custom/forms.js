$.fn.clear_form_errors = function() {
  this.find(".is-invalid").removeClass("is-invalid");
  this.find("div.invalid-feedback").remove();
};

$.fn.render_form_errors = function(model_name, errors){
  _form = this;
  model_name = model_name ? model_name : "";
  this.clear_form_errors();

  $.each(errors, function(field, messages){
      _input = _form.find("input, select, textarea").filter(function(){
        _name = $(this).attr("name");
        if (_name) {
          return _name.match(new RegExp(model_name + '\\[' + field + '\\(?'));
        }
        return false;
      });
      _input.addClass("is-invalid");
      _input.parent().append("<div class='invalid-feedback'>" + $.map(messages, function(m){
        return m.charAt(0).toUpperCase() + m.slice(1);
      }).join("<br />") + "</div>");
  });
};

$(document).on("turbolinks:load", function(){

  $("form")
    .on("ajax:success", function(data, status, xhr){
  }).on("ajax:error", function(ev){
      _model = $(this).attr("model");
        $(this).render_form_errors(_model, ev.detail[0]);
  });

});
