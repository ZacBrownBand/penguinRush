------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--  8 888888888o   8 8888888888   b.             8     ,o888888o.    8 8888      88  8 888  8 b.             8  --           
--  8 8888    `88. 8 8888         888o.          8    8888     `88.  8 8888      88  8 888  8 888o.          8  --           
--  8 8888     `88 8 8888         Y88888o.       8 ,8 8888       `8. 8 8888      88  8 888  8 Y88888o.       8  --  
--  8 8888     ,88 8 8888         .`Y888888o.    8 88 8888           8 8888      88  8 888  8 .`Y888888o.    8  --             
--  8 8888.   ,88' 8 888888888888 8o. `Y888888o. 8 88 8888           8 8888      88  8 888  8 8o. `Y888888o. 8  --             
--  8 888888888P'  8 8888         8`Y8o. `Y88888o8 88 8888           8 8888      88  8 888  8 8`Y8o. `Y88888o8  --             
--  8 8888         8 8888         8   `Y8o. `Y8888 88 8888   8888888 8 8888      88  8 888  8 8   `Y8o. `Y8888  --             
--  8 8888         8 8888         8      `Y8o. `Y8 `8 8888       .8' ` 8888     ,8P  8 888  8 8      `Y8o. `Y8  --             
--  8 8888         8 8888         8         `Y8o.`    8888     ,88'    8888   ,d8P   8 888  8 8         `Y8o.`  --             
--  8 8888         8 888888888888 8            `Yo     `8888888P'       `Y88888P'    8 888  8 8            `Yo  --        
--                                                                                                              --             
--                       8 888888888o.  8 8888      88    d888888o.   8 8888        8                           --             
--                       8 8888    `88. 8 8888      88  .`8888:' `88. 8 8888        8                           --             
--                       8 8888     `88 8 8888      88  8.`8888.   Y8 8 8888        8                           --             
--                       8 8888     ,88 8 8888      88  `8.`8888.     8 8888        8                           --             
--                       8 8888.   ,88' 8 8888      88   `8.`8888.    8 8888        8                           --             
--                       8 888888888P'  8 8888      88    `8.`8888.   8 8888        8                           --            
--                       8 8888`8b      8 8888      88     `8.`8888.  8 8888888888888                           --             
--                       8 8888 `8b.    ` 8888     ,8P 8b   `8.`8888. 8 8888        8                           --            
--                       8 8888   `8b.    8888   ,d8P  `8b.  ;8.`8888 8 8888        8                           --             
--                       8 8888     `88.   `Y88888P'    `Y8888P ,88P' 8 8888        8                           --   
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------ 
--                            By: Zachariah Brown                                                               --
--                            Description: This is a typing game in witch the user                              --
--                                         types provided, letters, words, or sentences                         --
--                                         to advance their character in attempt to win the race!               --
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

-- Hndles the init of the application, loads resources,
-- display stings and sets variable defaults
function love.load()                                                       -- Init window, set title and set up variables 
	love.window.setTitle('Penguin Rush')                                   -- set title

	welcome_message = 'Welcome to Penguin Rush!'                           -- string literals
	enter_name_message = 'Please enter your name: '
	choose_difficulty_message = "Choose a difficulty"

	easy = "Easy"
	medium = "Medium"
	hard = "Hard"
	instrctions = "Help"
	page = 'homePage'

	btn = love.graphics.newImage("assets/btn.png")                                -- load pictures 
	flag1 = love.graphics.newImage("assets/flagBack.png")
	flag2 = love.graphics.newImage("assets/flagFront.png")
	ice = love.graphics.newImage("assets/ice1.png")
	ice2 = love.graphics.newImage("assets/ice4.png")
	ice3 = love.graphics.newImage("assets/ice5.png")
	sky = love.graphics.newImage("assets/sky.png")
	wave1 = love.graphics.newImage("assets/wave1.png")
	wave2 = love.graphics.newImage("assets/wave2.png")

	penSprites = {
		love.graphics.newImage("assets/pen1.png"),
		love.graphics.newImage("assets/pen2.png"),
		love.graphics.newImage("assets/pen3.png")
	}

	fontBig = love.graphics.newFont("assets/destructobeambb_reg.ttf", 42)          -- create fonts
	fontMed = love.graphics.newFont("assets/destructobeambb_reg.ttf", 24)
	fontSmall = love.graphics.newFont("assets/destructobeambb_reg.ttf", 12)

	userName = ''                                                           -- name of the user
	difficulty = 0                                                          -- ( 0, easy | 1, medium | 2, hard )

	penIndex = 1;
	iteration = 1

	wave1_x = -200                                                          -- wave vars
	wave2_x = -75
	wave1_y = 450
	wave2_y = 425
	wave1_dx = 1
	wave2_dx = -1

	x = 650                                                                 -- penguin vars, position, rotation, and rate of change or rotation, as well as min and max rotations
	y = 550
	r = -.0
	sx = .3
	sy = .3
	way = .004

	easeSentences = {
		'a;a ;a; a;a ;a; a;a ;a;',
		'dad has dad has dad has',
		'fjf jfj fjf jfj fjf jfj',
		'gas fad gas fad gas fad',
		'ghg hgh ghg hgh ghg hgh',
		'kdk dkd kdk dkd kdk dkd',
		'sad lass sad lass sad lass',
		'sls lsl sls lsl sls lsl'
	}
	medSentences = {
		'fish taste good',
		'i am a bird',
		'i want to race',
		'ice is so cold', 
		'it is going to snow', 
		'my beak is orange',
		'we are in the south pole',
		'where are all the trees'
	}
	hardSentences = {
		'a guy walked into a bar and said foo',
		'i can tell you a riddle but will not give you a clue',
		'i get scared when i hear boo', 
		'i love to swim in the big blue',
		'i once was small but i grew',
		'it was very cold when the wind blew',
		'pirates sail on ships with their crew',
		'there once was a man at the zoo'
	}
end

-- Event handler for when the mouse is pressed
-- param {Number} x      The x cordinate of the mouse event
-- param {Number} y      The y cordinate of the mouse event
function love.mousepressed(x, y)   
	if page == 'homePage' then
		if x > 390 and x < (390 + 80) and                                    -- the button is pressed 
		   y > 300 and y < (300 + 50) and 
		   string.len(userName) > 0 then
			page = "menuPage"                                                -- set view to menu
		end
	elseif page == 'menuPage' then 
		button = -1
		if x > 300 and x < 520 then   
		    if y > 200 and y < 260 then    		                        	-- start game on easy 
				button = 0
				page = 'playGamePage'
			elseif y > 275 and y < 335 then                                  -- start game on medium
				button = 1
				page = 'playGamePage' 
			elseif y > 350 and y < 410 then                                  -- start game on hard
				button = 2
				page = 'playGamePage' 
			elseif y > 425 and y < 485 then                                  -- set view to help screen
				page = 'helpPage' 
			end
		if button > -1 then
				difficulty = button
				px=50
				cx=50
				pxMax = 30;
				cxMax = 30;
			    index = 1
				cpIterarion = 0;
				numKeysPressed = 0
				numKeysRight = 0
				gameStarted = 0
				before = ""
				curent = " "
				
				rnd = love.math.random(1, 8)
				if difficulty == 0 then
					after = easeSentences[rnd]
				elseif  difficulty == 1 then
					after = medSentences[rnd]
				elseif  difficulty == 2 then
					after = hardSentences[rnd]
				end
				
				countDownStart = os.time()
			end
		end
	elseif page == 'helpPage' then
		if x > 500 and x < 650 and y > 475 and y < 550 then 
			page = 'menuPage'
		end 
	elseif page == 'playGamePage' then
	 if gameStarted == 2 then
	    if x > 300 and x < 500 and y > 270 and y < 310 then 
			page = 'menuPage'
		end 
	 end
	end
end

-- Event handler for when a key is pressed
-- param {String} key     The key that caused the event
function love.keypressed(key)                                               -- on key press
	if page == 'homePage' then
		if key == 'backspace' and string.len(userName) > 0 then             -- delete last char
			userName = string.sub(userName, 0, string.len(userName) - 1)
		elseif key == 'return' and string.len(userName) > 0 then            -- go to menu if they user has entered a name and hit enter
			page = 'menuPage'
		elseif key == 'a' or key == 'b' or key == 'c' or key == 'd' or key == 'e' or key == 'f' or key == 'g' or key == 'h' or
		       key == 'i' or key == 'j' or key == 'k' or key == 'l' or key == 'm' or key == 'n' or key == 'o' or key == 'p' or 
		       key == 'q' or key == 'r' or key == 's' or key == 't' or key == 'u' or key == 'v' or key == 'w' or key == 'x' or
		       key == 'y' or key == 'z' then
				userName = userName .. key                                  -- add the letter to the user name 
		end
	elseif page == "playGamePage" and gameStarted == 1 then
        if key == 'a' or key == 'b' or key == 'c' or key == 'd' or key == 'e' or key == 'f' or key == 'g' or key == 'h' or
		       key == 'i' or key == 'j' or key == 'k' or key == 'l' or key == 'm' or key == 'n' or key == 'o' or key == 'p' or 
		       key == 'q' or key == 'r' or key == 's' or key == 't' or key == 'u' or key == 'v' or key == 'w' or key == 'x' or
		       key == 'y' or key == 'z' or key == ' ' or key == "space" or key == ';' or key == '.' then
			   if key == "space" then
			   	key =  ' '
			   end
			   curent = key
			   numKeysPressed = numKeysPressed + 1 
			   if curent == after:sub(index,index) then 
			        numKeysRight = numKeysRight + 1 
			        before = before .. curent
					curent = " "
					index = index + 1
					pxMax = pxMax + 10
					if index > string.len(after) then
						rnd = love.math.random(1, 8)
						if difficulty == 0 then
							after = easeSentences[rnd]
						elseif  difficulty == 1 then
							after = medSentences[rnd]
						elseif  difficulty == 2 then
							after = hardSentences[rnd]
						end
						before = ""
						index = 1
					end
			 elseif difficulty > 0 then
				cxMax = cxMax + (10 * difficulty)
			end
		end   
	end

end

-- Handles the animations
function love.update(dt)
	 if page == 'homePage' or page == 'playGamePage' then 
		iteration = (iteration + 1 ) % 100000
		if(iteration % 15 == 0)	then                                  -- change penguin sprite once every X updates 
			penIndex = (penIndex+1)%3 + 1
		end
		if r+way < -.2 then                                           -- penguin rotation checks
			way = .004
		elseif r+way >.2 then
			way = -.004
		end
		r = r + way                                                   -- update r for penguin radius
		if wave1_x < -200 then                                        -- wave direction check
			wave1_dx = 1
		elseif wave1_x > -125 then 
			wave1_dx = -1
		end
		if wave2_x < -150 then 
			wave2_dx = 1
		elseif wave2_x > -75 then 
			wave2_dx = -1
		end	
		wave1_x = wave1_x + wave1_dx                                  -- update wave vars
		wave2_x = wave2_x + wave2_dx		
	end	
	if page == 'playGamePage' and gameStarted == 1 then
		if px < pxMax then
			px = px + 1
			end
		if cx < cxMax then
			cx = cx + 1
		end
		cpIterarion = cpIterarion + 1;
		if (cpIterarion % 40 == 0 ) then
			cxMax = cxMax + (5 * (difficulty + 1))
			end
		end
end

-- Draw functioin, responsible of drawing all the components
function love.draw()
	if( page == 'homePage') then
	   love.graphics.draw(sky, 0, 0, 0, .3, .3)                       -- background
	   love.graphics.draw(wave1, wave2_x, wave2_y, 0, .75, .5)        -- waves
	   love.graphics.draw(wave1, wave1_x, wave1_y, 0, .75, .5)
	   love.graphics.draw(ice, 340+r*100, 300, 0, .8, .5)             -- ice
	   love.graphics.draw(penSprites[penIndex], 650, 550, r, sx, sy,  -- penguin sprite
	   penSprites[penIndex]:getWidth()/2, penSprites[penIndex]:getHeight())
       love.graphics.setFont(fontBig)
	   love.graphics.print(welcome_message, 100, 150)
	   love.graphics.setFont(fontMed)
	   love.graphics.print(enter_name_message, 150, 250)
	   love.graphics.print(userName, 470, 250)                       -- the user name being entered
	   if string.len(userName) > 0 then                              -- only let the user go if they enter a name first
		love.graphics.draw(btn, 390, 300, 0, .25, .5)
		love.graphics.print("GO", 410, 310)
	   end
   elseif( page == 'menuPage') then                                  -- menu page
        love.graphics.draw(sky, 0, 0, 0, .3, .3)
        love.graphics.setFont(fontBig)                               -- set font
		love.graphics.print("Hello " .. userName, 200, 75)  
		love.graphics.print(choose_difficulty_message, 200, 125)  		
		love.graphics.draw(btn, 300, 200, 0, .75, .75)               -- draw buttons
		love.graphics.draw(btn, 300, 275, 0, .75, .75)
		love.graphics.draw(btn, 300, 350, 0, .75, .75)
		love.graphics.draw(btn, 300, 425, 0, .75, .75)
		love.graphics.print(easy, 360, 210)                          -- draw button labels
		love.graphics.print(medium, 340, 285)
		love.graphics.print(hard, 360, 360)
		love.graphics.print(instrctions, 360, 435)
	elseif( page == 'helpPage') then
		love.graphics.draw(sky, 0, 0, 0, .3, .3)
		love.graphics.draw(btn, 500, 475, 0, .5, .75)
        love.graphics.setFont(fontBig)                               -- set font
		love.graphics.print("Background", 100,25)
		love.graphics.print("Instructions", 100,225)
		love.graphics.print("Back", 520,485)
		love.graphics.setFont(fontMed)                               -- set font
		love.graphics.print(userName .. " you are a Penguin, and have been" .. 
			"\nchallenged to a race. Win the race \nto get some tasty fish.", 200, 75)   
		love.graphics.print("Type the letters/words that are \ndisplayed." .. 
			" Correct input will move \nyou forward in the race. If you " ..
			"\nenter an incorrect key don't try \nto correct just continue." ..
			"Incorrect \nkey input will boost your opponent. \nGood luck!", 200, 275)   		
	elseif( page == 'playGamePage') then    
			love.graphics.draw(sky, 0, 0, 0, .3, .3) 		-- background
			love.graphics.setFont(fontBig) 
			love.graphics.draw(ice3, -20 + r*100, 290, .004, .8, .5)            -- ice
			love.graphics.draw(ice2, 340-r*100, 300, -.04, .8, .5)              -- ice
			love.graphics.draw(wave2, wave2_x, wave2_y + 30, 0, 1, .5)          -- waves
			love.graphics.draw(wave1, wave1_x, wave1_y+ 30, 0, 1, .5)
			love.graphics.draw(flag1, 40, 270, 0, .4, .75)
			love.graphics.draw(flag1, 640, 270, 0, .4, .75)
			love.graphics.draw(penSprites[penIndex], cx, 450, -1*r+.01, .15, .15,  -- penguin sprite
			penSprites[penIndex]:getWidth()/2, penSprites[penIndex]:getHeight())
			love.graphics.draw(penSprites[penIndex], px, 500, r, .2, .2,        -- penguin sprite
			penSprites[penIndex]:getWidth()/2, penSprites[penIndex]:getHeight())		
			love.graphics.draw(flag2, 40, 270, 0, .4, .75)
			love.graphics.draw(flag2, 640, 270, 0, .4, .75)
		if (gameStarted == 0) then      	                                  	-- for countdown  
			display = os.difftime( os.time() ,countDownStart)  
			if(display <= 2) then 
				love.graphics.print( (3 - display) , 400, 180) 
			elseif (display <= 3) then
			    love.graphics.print( "GO" , 400, 180) 
		    elseif (true) then 
				gameStarted = 1
				countDownStart = os.time()
			end
		elseif (gameStarted == 1)	then
			display = os.difftime( os.time() , countDownStart)
			love.graphics.setFont(fontMed)    
			love.graphics.print( "Time: " ..(display), 10, 10) 
			love.graphics.setFont(fontBig)
			love.graphics.setFont(fontMed) 
			love.graphics.print( after , 100, 100)
			love.graphics.setColor(0,255,0)
			love.graphics.print( before , 100, 100)
			love.graphics.setColor(255, 255, 255)
			if cx >= 700 or px >= 680 then 
				endTime = os.time()
				gameStarted = 2
			end 
		elseif gameStarted == 2 then
					love.graphics.setFont(fontBig)
				if cx > px then
					love.graphics.print( "Better luck next time" , 200, 150)
				elseif cx <= px then
					love.graphics.print( "You Win!" , 300, 150)
				end
				    love.graphics.setFont(fontMed) 
					love.graphics.print( "Stats:   " , 300, 200)
					love.graphics.print( "Time      " ..   os.difftime( endTime , countDownStart) .. ' Seconds', 300, 220 )
					percent = string.format("%.2f", 100 * numKeysRight / numKeysPressed)
					love.graphics.print( "Accuracy  " .. percent   .. '%', 300, 240)		
		            love.graphics.draw(btn, 320, 270, 0, .5, .5)               -- draw buttons
					love.graphics.setFont(fontBig) 
					love.graphics.print( " Menu" , 330, 270)	
			end
		end
end
