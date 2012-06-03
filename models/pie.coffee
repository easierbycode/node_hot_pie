
class Pie
  
  constructor: (attributes) ->
    @[key] = value for key, value of attributes
    @setDefaults()
    @

  @all: ->
    pies = []
    for pie in []  # resque query goes here
      pie = new Pie {json} for id, json in pie
      pies.push pie

  setDefaults: ->
    unless @state
      @state = 'inactive'
    @generateId()
  
  generateId: ->
    if not @id and @name
      @id = @name.replace /\s/g, '-'

module.exports = Pie