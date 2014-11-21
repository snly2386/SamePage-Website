class Samepage.Router extends Backbone.Router

  initialize: ->
    Backbone.history.start()

  routes: ->
  	''	: 'landing'

  landing: ->
  	view = new Samepage.Landing app: @