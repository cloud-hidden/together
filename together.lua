--together

--input 1: CV
--input 2: gate
--output 1: voice 1 CV
--output 2: voice 1 gate
--output 3: voice 2 CV
--output 4: voice 2 gate

	
s1 = 1
s2 = 2 
prob = 0.5
min = 1
max = 5


--traditional

function traditional()

	print("mode: traditional")

	input[2].change = function()
		if move == true then 
			output[1].volts = input[1].volts
			output[2]()
		else
			output[3].volts = input[1].volts
			output[4]()
		end 
		move = not move
	end
end


--custom

function custom()

	counter = 0
	length = move and s1 or s2

	print("mode: custom \n s1 = "..s1.."\n s2 = "..s2)

	input[2].change = function()

		if move == true then 
			output[1].volts = input[1].volts
			output[2]()
		else
			output[3].volts = input[1].volts
			output[4]()
		end

		counter = counter + 1

		if counter >= length then
			move = not move
			length = move and s1 or s2
			counter = 0 
		end
	end 
end 


--bernoulli

function bernoulli()

	print("mode: bernoulli \n prob = "..prob)

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

	counter = 0
	number_of_notes = math.random(min,max)

	print('mode: random \n min = '..min..'\n max = '..max)

	input[2].change = function()
		
		if move == true then 
			output[1].volts = input[1].volts
			output[2]()
		else
			output[3].volts = input[1].volts
			output[4]()
		end

		counter = counter + 1

		if counter == number_of_notes then
			move = not move
			counter = 0
			number_of_notes = math.random(min,max)
		end
	end
end 
 

function init()
	input[1].mode('stream')
	input[2].mode('change',1,0.1,'rising')
	output[1].volts = 0
	output[2].action = pulse()
	output[3].volts = 0
	output[4].action = pulse() 
	move = true
	mode = {traditional,custom,bernoulli,random}
	mode[1]() --edit startup mode
end

modes = function()
	print('\n[1] traditional\n[2] custom\n[3] bernoulli\n[4] random\n\nmode[n]()')
end  
