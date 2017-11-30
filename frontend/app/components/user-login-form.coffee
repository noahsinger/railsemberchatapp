import Ember from 'ember'

export default Ember.Component.extend(
  session: Ember.inject.service()

  actions:
    login: ->
      this.get('session').login(this.get('nickname'))
      console.log('logging in')

      # execute the after_login behavior from the parent
      this.get('after_login')()

)
