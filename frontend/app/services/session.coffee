import Ember from 'ember'
import Cookies from 'ember-cli-js-cookie'

export default Ember.Service.extend(
  store: Ember.inject.service()

  current_user: null

  login: (nickname) ->
    self = this
    # look for a user with that nickname that already exists
    this.get('store').query('user', {nickname: nickname})
      .then((users) ->
        # if that user is already known, log them in
        user = users.get('firstObject')
        if user
          self.set('current_user', user)
          Cookies.set('user_id', user.get('id'))
          user.set('loggedin', true)
          user.save()
        else
          # if the user isn't known, create them here and on the server
          #  and then log them in
          user = self.get('store').createRecord('user',
            nickname: nickname
            loggedin: true
          );

          user.save()
            .then(->
              self.set('current_user', user)
              Cookies.set('user_id', user.get('id'))
            )
      )


  logout: ->
    user = this.get('current_user')
    user.set('loggedin', false)
    user.save()

    this.set('current_user', null)
    Cookies.remove('user_id')


  get_current_user: ->
    this.get('current_user')


  initialize_from_cookie: ->
    console.log('initing cookies')
    user_id = Cookies.get('user_id')
    self = this
    if !!user_id
      this.get('store').findRecord('user', user_id)
        .then((user) ->
          self.set('current_user', user)
        )
)
