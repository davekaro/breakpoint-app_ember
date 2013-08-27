BreakpointApp.NavView = Ember.View.extend
  tagName: 'li',
  classNameBindings: ['active'],

  active: (->
    @get('childViews.firstObject.active')
  ).property('childViews.@each.active')

