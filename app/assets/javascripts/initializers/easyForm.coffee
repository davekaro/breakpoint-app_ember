Ember.EasyForm.Config.registerWrapper "default",
  formClass:            "form-horizontal"
  fieldErrorClass:      "error"
  errorClass:           "help-inline"
  hintClass:            "help-block"
  labelClass:           "col-md-2 control-label"
  inputClass:           "form-group"
  wrapControls:         true
  controlsWrapperClass: "col-md-8"

Ember.TextSupport.reopen
  classNames: ["form-control"]

Ember.Select.reopen
  classNames: ["form-control"]

