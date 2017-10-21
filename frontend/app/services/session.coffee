import Ember from 'ember'
import Cookies from 'ember-cli-js-cookie'

export default Ember.Service.extend(
  current_user: null

  login: (user) ->
    this.set('current_user', user)

  logout: ->
    this.set('current_user', null)

  get_current_user: ->
    this.get('current_user')
)
