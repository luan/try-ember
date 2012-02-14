App.Contact = Ember.Resource.extend
  resourceUrl: '/contacts'
  resourceName: 'contact',
  resourceProperties: ['first_name', 'last_name'],

  validate: ->
    message = 'Contacts require a first and a last name.'
    for property in['first_name', 'last_name']
      return message unless @get(property)
    
    false
  
  fullName: (->
    console.log this
    "#{@get 'first_name'} #{@get 'last_name'}"
  ).property 'first_name', 'last_name'