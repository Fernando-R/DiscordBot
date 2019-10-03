#requiring the discord module
Discord = require "discord.js"

#requiring the information in config file
ConfigFile = require "./config"

client = Discord.Client = new Discord.Client()

commands = []


#event triggered when the bot starts
client.on "ready", (x) ->

    #let us know that the bot started
    console.log 'Ready to go'

#event triggered when a new person enter the server
client.on 'guildMemberAdd', (member) ->

    #this is searching for the channel called "general" to send the message
    channel = member.guild.channels.find (ch) -> ch.name == 'general'

    #this send the message "welcome" followed by the name of the new member
    channel.send "welcome #{member}"

#event triggered when a member send a message in any channel that the bot participate
client.on 'message', (message) =>

    #ignore the message if it was send by a bot
    if message.author.bot
        return

    #ignore messages that don't start with the prefix
    unless message.content.startsWith ConfigFile.config.prefix
        return

    handleCommand message

handleCommand = (msg) ->

  #split the string into the command and all of the args
  command = msg.content.split(' ')[0].replace(ConfigFile.config.prefix, '')
  args = msg.content.split(' ').slice(1)

  #try to find the command in the array of commands
  for commandClass in commands
    try
      #verifies if the commandClass is the command that the member used
      unless commandClass.isThisCommand command
        continue

      #execute the main function of the commands
      await commandClass.runCommand args, msg, client

    catch error
      console.log error




loadCommands = (commandsPath) ->

  # exit if there are no commands
  if ConfigFile.config.commands.length == 0
    return

  for commandName in ConfigFile.config.commands

    #instantiate each command in the list on ./config
    commandClass = require "#{commandsPath}/#{commandName}"
    commandClassConstructor = commandClass["#{commandName}"]
    command = new commandClassConstructor()

    #puts the command instance in the array commands
    commands.push(command)

loadCommands "./commands"

#"starts" the bot and connect it to the discord api using the token
client.login ConfigFile.config.token
