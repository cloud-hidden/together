--together

--input 1: CV
--input 2: gate
--output 1: voice 1 CV
--output 2: voice 1 gate
--output 3: voice 2 CV
--output 4: voice 2 gate

	--custom 
		s1 = 1
		s2 = 2
	--boolean
		prob = 0.5
	--random
		min = 1
		max = 5

--traditional

function traditional()

	counter = 0

	print("mode: traditional")

	input[2].change = function()
		if move == true then 
			output[1].volts = input[1].volts
			output[2]()
		else
			output[3].volts = input[1].volts
			output[4]()
		end 

		counter = counter + 1

		if counter == 1 then 
			move = not move
			counter = 0
		end 
	end
end


--custom

function custom()

	local play_voice_1
	local play_voice_2
	local step_1
	counter = 0

	print("mode: custom \n s1 = "..s1.."\n s2 = "..s2)

	step_1 = function()
		if move == true then
			play_voice_1()
		else 
			play_voice_2()
		end 
	end

	play_voice_1 = function()
		input[2].change = function()
			output[1].volts = input[1].volts
			output[2]()

			counter = counter + 1

			if counter == s1 then
				move = not move
				counter = 0
				step_1()
			end
		end 
	end 

	play_voice_2 = function()
		input[2].change = function()
			output[3].volts = input[1].volts
			output[4]()

		counter = counter + 1

			if counter == s2 then
				move = not move
				counter = 0
				step_1()
			end
		end 
	end

	step_1()

end


--boolean

function boolean()

	print("mode: boolean \n prob = "..prob)

	input[2].change = function()
		if math.random() <= prob then
			output[1].volts = input[1].volts
			output[2]()
		else 
			output[3].volts = input[1].volts
			output[4]()
		end
	end
end


--random

function random()

	local play_voice_1
	local play_voice_2
	local step_1
	number_of_notes = 0
	counter = 0

	print('mode: random \n min = '..min..'\n max = '..max)


	step_1 = function()
		number_of_notes = math.random(min,max)
		if move == true then 
			play_voice_1()
		else
			play_voice_2()
		end
	end 

	play_voice_1 = function()
		input[2].change = function()
			output[1].volts = input[1].volts
			output[2]()

			counter = counter + 1

			if counter == number_of_notes then
				move = not move
				counter = 0
				step_1()
			end
		end 
	end

	play_voice_2 = function()
		input[2].change = function()
			output[3].volts = input[1].volts
			output[4]()

			counter = counter + 1

			if counter == number_of_notes then
				move = not move
				counter = 0
				step_1()
			end
		end 
	end

	step_1()

end 

modes = function()
	print('\n[1] traditional\n[2] custom\n[3] boolean\n[4] random\n\nmode[n]()')
end  

function init()
	input[1].mode('stream')
	input[2].mode('change',1,0.1,'rising')
	output[1].volts = 0
	output[2].action = pulse()
	output[3].volts = 0
	output[4].action = pulse() 
	move = true
	mode = {traditional,custom,boolean,random}
	mode[1]() --edit startup mode
end 
