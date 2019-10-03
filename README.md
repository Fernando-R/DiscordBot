# DiscordBot- Node
A Generic discord Bot. This project is a model of a discord bot with the main structure of the bot.

tecnologies

Node: 12.7
npm: 6.10

## step 1
```
git clone https://github.com/Fernando-R/DiscordBot---Node.git
cd Discordbot
```
## step 2
this discord bot is written in coffee script, to use this you'll need to install it by: 
``` $ npm install --save-dev coffeescript ```

## step 3
Go to [Discord developers portal](https://discordapp.com/developers/applications), create a aplication and get a bot token.
*If you are having problems with getting the token and adding the bot into your server, follow [this](https://www.digitaltrends.com/gaming/how-to-make-a-discord-bot/) tutorial till step 4*

Now that you have the token, open the src/config.coffee and change the token to your token.

## step 4
open a terminal and use:
``` $ npm coffee ```
this will compile the the cooffee scrip archives from src/ into js in build/ .
*This command will keep listening to the archives and compile them when a change happens*

## step 5
run the bot using:
``` $ npm start ```
in your terminal should appers **_"Ready to go"_**

## step 6
go to your discord server with the bot and send **?test**.

