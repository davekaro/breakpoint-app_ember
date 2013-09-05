Ember.EasyForm.Config.registerWrapper "default",
  formClass:            ""
  fieldErrorClass:      "error"
  errorClass:           "help-inline"
  hintClass:            "help-block"
  labelClass:           ""
  inputClass:           "form-group"
  wrapControls:         false
  controlsWrapperClass: ""

Ember.TextSupport.reopen
  classNames: ["form-control"]

Ember.Select.reopen
  classNames: ["form-control"]

