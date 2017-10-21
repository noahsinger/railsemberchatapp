import Ember from 'ember'
import Cookies from 'ember-cli-js-cookie'

export default Ember.Service.extend(
  current_user: null

  login: (user) ->
    this.set('current_user', user)
    Cookies.set('user_id', user)

  logout: ->
    this.set('current_user', null)
    Cookies.remove('user_id')

  get_current_user: ->
    this.set('current_user', Cookies.get('user_id'))
    this.get('current_user')

  initialize_from_cookie: ->
    console.log('initing cookies')
    user_id = Cookies.get('user_id')
    if !!user_id
      this.set('current_user', user_id)
)
