
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

  describe 'POST /sessions', ->
    describe 'incorrect credentials', ->
      [body, response] = [null, null]
      before (done) ->
        options =
          uri: "http://localhost:#{app.settings.port}/sessions"
          form:
            user: 'incorrect user'
            password: 'incorrect password'
          followAllRedirects: true
        request.post options, (err, _response, _body) ->
          [body, response] = [_body, _response]
          done()

      it 'shows flash message', ->
        errorText = 'Get out of here!!!'
        assert.hasTag body, "//p[@class='flash error']", errorText

    describe 'correct credentials', ->
      [body, response] = [null, null]
      before (done) ->
        options =
          uri: "http://localhost:#{app.settings.port}/sessions"
          form:
            user: 'piechef'
            password: '12345'
          followAllRedirects: true
        request.post options, (err, _response, _body) ->
          [body, response] = [_body, _response]
          done()

      it 'shows flash message', ->
        successText = "You are logged in as piechef"
        assert.hasTag body, "//p[@class='flash info']", successText

  describe 'DELETE /sessions', ->
    [body, response] = [null, null]
    before (done) ->
      options =
        uri: "http://localhost:#{app.settings.port}/sessions"
        followAllRedirects: true
      request.del options, (err, _response, _body) ->
        [body, response] = [_body, _response]
        done()

    it 'shows flash message', ->
      infoText = 'You have been logged out'
      assert.hasTag body, "//p[@class='flash info']", infoText

