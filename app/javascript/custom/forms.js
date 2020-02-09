$.fn.clear_form_errors = function() {
  this.find(".is-invalid").removeClass("is-invalid");
  this.find("div.invalid-feedback").remove();
};

$.fn.render_form_errors = function(model_name, errors) {
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

$.confirm_dialog = function(title, message, okCallBack, cancelCallBack) {
  okCallBack = okCallBack ? okCallBack : $.noop;
  cancelCallBack = cancelCallBack ? cancelCallBack : $.noop;

  var $_modal = $("#modal").modal();
  $_modal.find("#modalTitle").html(title);
  $_modal.find(".modal-body").html(message);
  $_modal.find("#btnModalCancel").unbind().bind("click", function(){
    cancelCallBack();
    $_modal.modal("hide");
    return false;
  });
  $_modal.find("#btnModalConfirm").unbind().bind("click", function(){
    okCallBack();
    $_modal.modal("hide");
    return false;
  });
  $_modal.modal("show");
};

$(document).on("turbolinks:load", function() {

  $("form").on("ajax:error", function(ev){
    _model = $(this).attr("model");
    $(this).render_form_errors(_model, ev.detail[0]);
  });

  $("a.destroy-link").click(function(){
    var _message = $(this).attr("data-message");
    var _messageToShow = "This record will be destroyed: <br /><strong>" + _message + "</strong>";
    $.confirm_dialog("Confirm destroy action", _messageToShow, function(){
      
    });
    return false;
  });

});
