local discordia = require('discordia')
local client = discordia.Client()

catchat='1128642529127051284'
catmin='1107394188208783502'
lock=1

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
	if message.channel.id ~= catchat then
		if message.content:lower() == 'come over here catgirl' and lock==0 then
				message.channel:send('Okay, moving to this channel')
				catchat=message.channel.id
				print('Moved to '.. message.channel.id)
		end
	end
end)



client:on('messageCreate', function(message)
	if message.author.bot then return end
	if message.channel.id == catchat or '1142469992617627713' then
	
		if message.content:lower() == 'mrrp' then
				message.channel:send('Nyaa!')
		end

		if message.content:lower() == 'stay here catgirl' and lock==0 then
				message.channel:send('Okay, I won\'t move out of this channel unless Sasha tells me to :pensive:')
				lock=1
				print('Locked channel to '.. message.channel.id)
		end

		if message.content:lower() == 'hello catgirl' or message.content:lower() == 'hey catgirl' or message.content:lower() == 'hi catgirl' then
				message.channel:send('Heya '.. message.author.mentionString ..'!' )
		end

		if string.find(message.content:lower(),'headpats') and string.find(message.content:lower(),'have') and string.find(message.content:lower(),'can') then
				message.channel:send('Of course! *pat pat pat* :smile:' )
		end

		if string.find(message.content:lower(),'thank you') and string.find(message.content:lower(),'catgirl') then
				message.channel:send('No problem~')
		end

		if message.content:lower() == 'holy hell' then
				message.channel:send('New catgirl just dropped :rainbow_flag:' )
		end
		
		if string.find(message.content:lower(),'new') and string.find(message.content:lower(),'just dropped') then
				message.channel:send('Actual catgirl :pleading_face:')
		end
		
		if string.find(string.lower(message.content:sub(1,6)),'google') then
			message.channel:send('Holy hell :flushed:')
		end
		
		if string.find(string.lower(message.content:sub(1,7)),'actual ') then
			message.channel:send('Call the endocrinologist!')
		end

		if message.content:lower() == 'you can move again catgirl' and message.author.id == catmin then
				message.channel:send('Okay, I can move again :smile:')
				lock=0
				print('Unlocked channel from '.. message.channel.id)
		end

	end
end)
client:run('Bot '..os.getenv("DISBOTTOKEN"))