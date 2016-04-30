fs = require 'fs'
dotenv = require 'dotenv'

dotenv.config { silent: true }

fs.readdirSync(__dirname + '/config').forEach (fileName) ->
  [ _fileName, option ] = /^(.*)\.coffee$/.exec(fileName)
  module.exports[option] = require './config/' + fileName
