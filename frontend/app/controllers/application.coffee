import Ember from 'ember'

export default Ember.Controller.extend(
  # session is needed in the template to look for loggedin users
  session: Ember.inject.service()

  # for streaming messages
  cable: Ember.inject.service()


  actions:
    login_complete: ->
      console.log('redirecting')
      this.transitionToRoute('messages');


  setupConsumer: Ember.on 'init', ->
    consumer = this.get('cable').createConsumer($("meta[name=action-cable-url]").attr('content'))

    consumer.subscriptions.create "MessagesChannel",
      # access to the store for pushing new streamed messages
      store: Ember.inject.service()

      # session needed to find current_user so we don't double post their messages
      session: Ember.inject.service()

      connected: ->
        console.log('connected')

      received: (data) ->
        console.log("message posted: #{Ember.inspect(data)}")

        # don't load messages sent by the loggedin user as the message will
        #  have already been created and loaded by send-message-form component

        this.get('store').findRecord('user', data['user_id']).then( (user) =>
          if user != this.get('session').get('current_user')
            this.get('store').pushPayload({data:{type: 'message', id: data['id'], attributes: data}})
        )


      disconnected: ->
        console.log('disconnected')

)
