local discordia = require('discordia')
local dcmd = require("discordia-slash")
local client = discordia.Client()
local timer = require('timer')
-- Import stuffs

catchat={}
catchat[0]='1'
catchat[1]='1128642529127051284'
cece=5
--catchat[1142469992617627713]={1} -- the channel she's supposed to be in, should make this persistent
catmin='1107394188208783502' -- my discord for owner only commands

function table.contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

function meow(channel,target, time)
	print('Meowing at '..target.username..' in '..time ..' seconds at '..os.date())
	local a=os.time()
	timer.sleep(time*1000)
	print('Meowed at '..target.username..' after '..os.difftime(os.time(),a)..' seconds at '..os.date())
	channel:send('meow '..target.mentionString)
	return coroutine.yield(1)
end



client:on('ready', function()
	print('Logged in as '.. client.user.username) -- for troubleshooting
end)

client:on('messageCreate', function(message)	-- on message
	if not table.contains(catchat,message.channel.id) and message.author.id == catmin then		-- if not in current channel
		if message.content:lower() == 'come over here catgirl'  then
				message.channel:send('Okay, joining to this channel :smile:')
				print('Moved to '.. message.channel.id)
				table.insert(catchat,message.channel.id)		-- move over
				print('aaah')
		end
	end
end)




client:on('messageCreate', function(message)	-- listening block for everything in her channels
	if message.author.bot then return end		-- so she doesn't talk to herself or other bots
	if table.contains(catchat,message.channel.id) then	-- check for channel
		

		if message.content:lower() == 'how many channels are you in catgirl'  then
			message.channel:send('I am currently in '.. table.getn(catchat)..' channels!')
		end

		if message.content:lower() == 'leave this channel catgirl'  then
			message.channel:send('Okay, leaving this channel, bye bye :pensive:')
			local ids = {} -- table containing ids to remove
			for i,v in ipairs(catchat) do
  			if v == message.channel.id then
    			table.insert(ids, 1, i) -- "1" preprends the value
			end
			end

			-- At this point, "ids" contains all the ids to remove in the reverse order

			for k,v in ipairs(ids) do
  			table.remove(catchat, v)
			end

			print('Moved out of '.. message.channel.id)
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

		if string.find(message.content:lower(),'be gay') then 
			message.channel:send('Do crime :sunglasses:')
		end

		if string.find(message.content:lower(),'not cute') then -- mesage much contain both in any order
			message.channel:send('Girl, I know the saying is girlboss gatekeep gaslight but can you stop lying to me for one second???')
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

		-- begin edit test
		if message.content:lower() == 'catgirl, send and remember' then
			testms=message.channel:send('Okay, sent a message!' )
		end

		if message.content:lower() == 'catgirl, edit' then
			testms:setContent('Okay, made it gayer :rainbow_flag:' )
		end
		-- end edit test

		-- céleste
		if message.author.username == 'citrus_scoundrel' then
			if cece==10 then
				message.channel:send('slut detected')
				cece=0
				print('reset cece to'..cece)
			else
				cece=cece+1
			end
		end

		-- begin meow test
		if string.find(string.lower(message.content:sub(1,14)),'meow at me in ') then
			if tonumber(message.content:sub(15,24)) then
				ti=tonumber(message.content:sub(15,24))
				if ti<0 then message.channel:send('Sorry, but I\'m a catgirl not a time traveller, I can\'t meow in the past!') return end
				message.channel:send('Okay, I\'ll meow at you in '..ti..' seconds')
				if ti>1000 then message.channel:send('Keep in mind I do get lobotomised (restarted) often so long timers may get lost in the void ^_^') end
				coroutine.resume(coroutine.create(meow(message.channel,message.author,ti)))
			else 
				message.channel:send('Sorry, but '..message.content:sub(15,24)..' is not a number')
			end
		end


	end
end)
client:run('Bot '..os.getenv("DISBOTTOKEN"))