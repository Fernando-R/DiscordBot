Discord = require "discord.js"

#how to create a command

#create a class called the command that you want. It need to be the same name of the archive
class test

  #create a constant with the name of the class
  _command = 'test'

  # create a function called "isThisCommand" that verifies if the command used is this command this function will be the same in any command
  isThisCommand: (command) ->
    return command == _command
    
  #create a function called "runCommand", this function will contain the main functionality of the command
  runCommand: (args, msgObject, client) ->
    #this send a message in the channel that the command was used saying "IT WORKED"
    msgObject.channel.send('IT WORKED')

#in the end export the class
module.exports = {test}
