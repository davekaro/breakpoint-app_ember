BreakpointApp.NavLinkComponent = Ember.Component.extend
  tagName: 'li',
  classNameBindings: ['active'],

  active: (->
    @get('childViews.firstObject.active')
  ).property('childViews.@each.active')

