import Ember from 'ember'

export default Ember.Component.extend(
  session: Ember.inject.service()

  actions:
    login: ->
      this.get('session').login(this.get('nickname'))
      console.log(this.get('session').get_current_user( ) + ' logged in')
)
