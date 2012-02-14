App.ShowContactView = Ember.View.extend
  templateName: 'app/templates/contacts/show'
  classNames: ['show-contact']
  tagName: 'tr'
  
  doubleClick: ->
    @showEdit()

  showEdit: ->
    @set 'isEditing', true

  hideEdit: ->
    @set 'isEditing', false

  destroyRecord: ->
    contact = @get "contact"

    resource = contact.destroyResource()
    
    resource.fail (e) ->
      App.displayError e

    resource.done =>
      App.contactsController.removeObject contact
