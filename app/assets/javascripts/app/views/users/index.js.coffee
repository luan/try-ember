App.IndexUsersView = Ember.View.extend
  templateName: 'app/templates/users/index'
  usersBinding: 'App.usersController'

  showFriends: ->
    App.set 'loading', true
    FB.api '/me/friends?fields=name,picture,link', (response) =>
      App.set 'loading', false
      @set 'friends', response.data

  hideFriends: ->
    @set 'friends', null

  login: ->
    @hideFriends()
    App.set 'loading', true
    FB.login App.updateUser, scope: 'email, offline_access'

  logout: ->
    @hideFriends()
    App.set 'loading', true
    FB.logout App.updateUser