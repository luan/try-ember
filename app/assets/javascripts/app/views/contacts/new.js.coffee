App.NewContactView = Ember.View.extend
  tagName:      'form'
  templateName: 'app/templates/contacts/edit'

  init: ->
    @_super()
    @set "contact", App.Contact.create()

  didInsertElement: ->
    @_super()
    @$('input:first').focus()

  cancelForm: ->
    @get("parentView").hideNew()

  submit: (event) ->
    self = this
    contact = @get "contact"

    event.preventDefault()
    
    resource = contact.saveResource()

    resource.fail (e) ->
      App.displayError e

    resource.done =>
      App.contactsController.pushObject contact
      @get('parentView').hideNew()
