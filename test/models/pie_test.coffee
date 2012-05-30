
assert  = require 'assert'
Pie = require '../../models/pie'

describe 'Pie', ->

  describe 'create', ->
    @pie = null
	  beforeEach ->
      @pie = new Pie
        name: 'Key Lime'
    it 'sets name', ->
      assert.equal @pie.name, 'Key Lime'
    it 'defaults to some state', ->
      assert.equal @pie.state, 'inactive'
    it 'generates id', ->
      assert.equal @pie.id, 'Key-Lime'
    it 'should generate a unique id for each pie', ->
      assert.equal @pie.state, 'inactive'