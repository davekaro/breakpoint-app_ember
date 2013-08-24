BreakpointApp.User = DS.Model.extend
  firstName:   DS.attr('string', defaultValue: '')
  lastName:    DS.attr('string', defaultValue: '')
  phoneNumber: DS.attr('string')
  email:       DS.attr('string')
  fullName: (->
    "#{@get('firstName')} #{@get('lastName')}"
  ).property('firstName', 'lastName')

