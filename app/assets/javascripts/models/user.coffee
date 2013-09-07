BreakpointApp.UserSerializer = BreakpointApp.ActiveModelSerializer.extend()

BreakpointApp.User = DS.Model.extend Ember.Validations.Mixin,
  firstName:            DS.attr('string', defaultValue: '')
  lastName:             DS.attr('string', defaultValue: '')
  phoneNumber:          DS.attr('string')
  email:                DS.attr('string')
  timeZone:             DS.attr('string')
  password:             DS.attr('string')
  passwordConfirmation: DS.attr('string')
  fullName: (->
    "#{@get('firstName')} #{@get('lastName')}"
  ).property('firstName', 'lastName')

