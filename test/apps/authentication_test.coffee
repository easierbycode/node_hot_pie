
assert  = require 'assert'
request = require 'request'
app     = require '../../server'

describe 'authentication', ->
  describe 'GET /login ', ->
    body = null
    before (done) ->
      options =
        uri: "http://localhost:#{app.settings.port}/login"
      request options, (err, response, _body) ->
        body = _body
        done()
    it 'has user field', ->
      # matcher provided by assert-extra.coffee
      assert.hasTag body, '//head/title', 'Hot Pie - Login'