View = require '../chalice/view.coffee'
template = require './navbar.hbs'

class NavbarView extends View

  className: 'navbar-view'

  template: template

  afterRender: ->
    super
    @stopListening @collection
    @listenTo @collection, 'reset', @render

  getTemplateData: ->
    items: @collection?.toJSON()

module.exports = NavbarView
