# Description:
#   shibame is the most important thing in your life
#
#   source: https://github.com/kevinmarx/chatroom-jarvis/blob/master/scripts/shibame.coffee
#
# Dependencies:
#   "tumblrbot": "0.1.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot shiba me - Receive a shiba inu
#   hubot shiba bomb N - get N shiba inus

tumblr = require 'tumblrbot'
url = "sweetshibes.tumblr.com"

module.exports = (robot) ->

  robot.respond /shiba me/i, (msg) ->
    tumblr.photos(url).random (post) ->
      msg.send post.photos[0].original_size.url + '#.png'

  robot.respond /shiba bomb( (\d+))?/i, (msg) ->
    i = 0
    count = msg.match[2] || 5
    while i < count
      tumblr.photos(url).random (post) ->
        msg.send post.photos[0].original_size.url + '#.png'
      i++
