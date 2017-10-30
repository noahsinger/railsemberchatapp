import Ember from 'ember'

export default Ember.Component.extend(
  session: Ember.inject.service()
  store: Ember.inject.service()

  new_message_text: ''

  actions:
    send_message: ->
      if this.get('new_message') != null
        console.log("#{this.get('session').get('current_user').get('nickname')} sending message: '#{this.get('new_message_text')}' " )

        new_message = this.get('store').createRecord('message',
          content: this.get('new_message_text')
          user_id: this.get('session').get('current_user').get('id')
        )

        new_message.save( ).then( =>
          console.log('message saved')
          # clear the textfield
          this.set('new_message_text', '')
        )

)
