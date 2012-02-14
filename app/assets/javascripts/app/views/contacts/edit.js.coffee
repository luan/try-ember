App.EditContactView = Ember.View.extend
  tagName: 'form'
  templateName: 'app/templates/contacts/edit'

  init: ->
    # create a new contact that's a duplicate of the contact in the parentView;
    # changes made to the duplicate won't be applied to the original unless
    # everything goes well in submit()
    editableContact = App.Contact.create @get('parentView').get('contact')
    @set "contact", editableContact
    @_super()

  didInsertElement: ->
    @_super()
    @$('input:first').focus()

  cancelForm: ->
    @get("parentView").hideEdit()

  submit: (event) ->
    contact = @get "contact"

    event.preventDefault()

    resource = contact.saveResource()
    
    resource.fail (e) ->
      App.displayError e

    resource.done =>
      parentView = @get("parentView")
      parentView.get('contact').duplicateProperties contact
      parentView.hideEdit()
