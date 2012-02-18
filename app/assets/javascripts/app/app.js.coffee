window.App = Ember.Application.create
  currentUser: undefined

  updateUser: (response) ->
    if response.status is 'connected'
        FB.api '/me', (user) ->
          currentUser = user
          currentUser.accessToken = response.authResponse.accessToken

          FB.api '/me/picture', (path) ->
            currentUser.picture = path
            App.set 'currentUser', currentUser
            App.set 'loading', false
    else
      App.set 'currentUser', false
      App.set 'loading', false

window.fbAsyncInit = =>
  FB.init
    appId: '249511985086492'
    status: true
    cookie: true

  App.set 'loading', true
  FB.getLoginStatus App.updateUser

$ ->
  js = document.createElement 'script'

  $(js).attr
    id: 'facebook-jssdk'
    async: true
    src: "//connect.facebook.net/en_US/all.js"

  $('head').append js