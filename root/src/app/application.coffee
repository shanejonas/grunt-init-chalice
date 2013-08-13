Backbone = require 'backbone'
try Backbone.$ = require '$' catch e
_ = require 'underscore'

NavBarView = require '../navbar/navbarview.coffee'
CompositeView = require 'chalice/src/composite.coffee'
View = require 'chalice/src/view.coffee'
Router = require 'chalice/src/router.coffee'

class Application extends Router

  uniqueName: 'app'

  getAppView: ->
    new CompositeView

  getNavigationView: ->
    new NavBarView
      collection: @pages

  fetcher: ->
    # dont need to fetch anything here.
    @trigger 'doneFetch'

  initialize: ->
    @pages = new Backbone.Collection [
      {slug: 'bleep', title: 'bleep'}
      {slug: 'bloop', title: 'bloop'}
    ]
    @appView.addView @getNavigationView()
    this

  routes:
    '': 'index'
    'bleep': 'bleep'
    'bloop': 'bloop'

  index: ->
    @swap new View
      template: -> 'Hello World'
    @fetcher()

  bleep: ->
    @swap new View
      template: -> 'Bleep'
    @fetcher()

  bloop: ->
    @swap new View
      template: -> 'Bloop'
    @fetcher()

makeApplication = ->
  new Application

Backbone.$? ->
  makeApplication()
  Backbone.history.start pushState: yes

makeApplication() if not Backbone.$
