local discordia = require('discordia')
local client = discordia.Client()
-- Import stuffs

catchat='1128642529127051284' -- the channel she's supposed to be in, should make this persistent
catmin='1107394188208783502' -- my discord for owner only commands
lock=1 -- defaults to locked 

client:on('ready', function()
	print('Logged in as '.. client.user.username) -- for troubleshooting
end)

client:on('messageCreate', function(message)	-- on message
	if message.channel.id ~= catchat then		-- if not in current channel
		if message.content:lower() == 'come over here catgirl' and lock==0 then
				message.channel:send('Okay, moving to this channel')
				catchat=message.channel.id		-- move over
				print('Moved to '.. message.channel.id)
		end
	end
end)



client:on('messageCreate', function(message)	-- listening block for everything in her channels
	if message.author.bot then return end		-- so she doesn't talk to herself or other bots
	if message.channel.id == catchat or '1142469992617627713' then	-- check for channel
	
		if message.content:lower() == 'stay here catgirl' and lock==0 then	-- to lock her in place, only owner can move her
				message.channel:send('Okay, I won\'t move out of this channel unless Sasha tells me to :pensive:')
				lock=1
				print('Locked channel to '.. message.channel.id)
		end

		if message.content:lower() == 'you can move again catgirl' and message.author.id == catmin then	-- only owner can unlock
			message.channel:send('Okay, I can move again :smile:')
			lock=0
			print('Unlocked channel from '.. message.channel.id)
		end

		-- begin general cutesy stuff
		if message.content:lower() == 'mrrp' then -- simple 1:1 match of message, using lower for case insensitivity
			message.channel:send('Nyaa!')
		end

		if message.content:lower() == 'hello catgirl' or message.content:lower() == 'hey catgirl' or message.content:lower() == 'hi catgirl' then -- exact match but different options
				message.channel:send('Heya '.. message.author.mentionString ..'!' )
		end

		if string.find(message.content:lower(),'headpats') and string.find(message.content:lower(),'have') and string.find(message.content:lower(),'can') then -- message must contain all 3 in any order
				message.channel:send('Of course! *pat pat pat* :smile:' )
		end

		if string.find(message.content:lower(),'thank you') and string.find(message.content:lower(),'catgirl') then -- mesage much contain both in any order
				message.channel:send('No problem~')
		end
		

		-- end general cutesy stuff

		-- begin anarchychess memes
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

		if string.find(string.lower(message.content:sub(1,9)),'call the ') then
			message.channel:send('T went on vacation, never came back')
		end

		if string.find(message.content:lower(),'went on vacation') and string.find(message.content:lower(),'never came back') then
			message.channel:send('Cuddle storm incoming! :exploding_head:')
		end
		-- end anarchychess memes
		

	end
end)
client:run('Bot '..os.getenv("DISBOTTOKEN"))