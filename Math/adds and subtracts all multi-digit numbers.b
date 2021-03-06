Adds and subtracts all multidigit numbers with pluses and minuses separating them
Goes up to 10^10 (you can increase the power easily by adding plus rights to the initial setup)

Some notes:
	The 255 1 1 255 at the end of the initialisation will be referred to as the signChunk
	The chunk of 0s that is initially before the signChunk will be referred to as the 0chunk
	Large amounts of dashes and pluses will be enclosed in a bracket along with how many of them there are
	Individual digits are usually stored with an added one
		This is because the program relies on moving to the end of a sequence by running until it finds a 0
	The current total is stored in normal order; like 123 will look like 1 1 1 1 1 1 1 2 3 4
	The current number being added is stored in reverse order after the 255 marker; like 123 will look like 255 2 3 4
	The sign of the number being recorded will be inside the signChunk between the 255s
		The second is the sign of the current number being added/subtracted
		The first is the sign of the next number

Sets up the board in the format
0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 1 1 0
(>>>+>+>+>+>+>+>+>+>+>>>>>>)+>+>

Gets first input and puts it after the signChunk
>,
[
	gets all numbers and places them after the signChunk in order until it reaches a plus minus or EOF
	[
		(45---------------------------------------------)
		[>>]<[<]<[<]<[>>[>]]>>[+[>]>[>]-->>>]<<

		<++
		[(4----)>>] < [>>>>] < [>,>] <
	]

	Checks if the sign of this number is negative
	<<[<]<[<]>>-
	[
		Turn the number into 10^x minus the number where x is the length of the number
		[>]>[>]<
		[>(11+++++++++++)<[->-<]<]
		>>[[-<+>]>]
		<<+[<]<[<]
	]
	>[>]<+

	moves to the last digit of the inputted number
	[>]>[>]<
	[
		[
			Subtracts 1 to prepare it to add to the current solution
			-
			adds it to the number before the 0chunk
			[[<]<[<]<[<]<<<<+>>>>>[>]>[>]>[>]<-]
			Moves the pointer to the number before the 0chunk and subtracts 1
			<[<]<[<]<[<]<<<<-
			Initialises the modulo part
			>(10++++++++++)>+<<
			This checks whether the number is above 10 and carries the 1 if so
			It is in the format: Number Modulo 1 0 0
			The 1 0 0 is formed out of the 0chunk and is needed to check whether the modulo has reached 0
			[
				Subtracts one from Number and Modulo
				->-
				Splits the pointer based on whether Modulo is 0 or not
				If it is not the pointer will end up on the second 0
				If it is the pointer will end up on the 1
				[>]>
				If the pointer is on the 1;
				[
					Reset the Modulo back to 10
					<(10++++++++++)
					Carry the 1 onto the next number
					<<+
					Align the pointer back with where it would be if the Modulo above 0
					>>>>>
				]
				Move the pointer back to the Number to check whether it has reached 0 yet
				<<<<
			]
			At the end of that the Number will equal 0 and the Modulo will equal 10 minus the actual modulo
			Remove the 1 from the 0chunk
			>>->>
			Add 11 to the rightmost 0 of the 0chunk
			(11+++++++++++) <<<
			Subtract the Modulo from that 11
			[->>>-<<<]
			With this the 0chunk has moved 1 space to the left
		]
		Move the pointer back to the end of the number being added
		(or if that number is the 255 on the right of the signChunk move the pointer 3 to the right (which is always 0))
		>>>[>]>[>]>[>]<
		Effectively the 0chunk has moved one to the left and the number in focus is now the next power of 10
		The next power of the number to be added is also increased because the previous number is now 0
	]

	Check if the sign is negative
	<[<]>>-
	[
		if negative subtract 10^x where x is the length of the inputted number
		<[<]<[<]<<<-
		[<- [>++>]>[>>>(10++++++++++)<<<+>]<<-]
		>>>>[>]>>-
		overall with subtraction it becomes
		original minus 10^x plus (10^x minus number)
		which simplifies to just original minus number and is way easier to code
	]
	<
	[->+<]
	+

	Move the pointer to the number at the right of the 0chunk
	<[<]<[<]<<<<

	Carries the one if need be
	[(11-----------) [11(+++++++++++)>>>] < [+>>>>>+<<<<]<]
	>>>>[<]>

	Move the zero chunk back to the signChunk one number at a time
	[
		[-<<<<+>>>>]
		>
	]

	Look for the next number to add
	>>[>]>,
]
Moves to the very beginning of the number
<<[<]<<<<<[<]>
Check if the number is negative (a 255 will be in front if it is)
+
[<<]>
[
	prints a dash
	<(45+++++++++++++++++++++++++++++++++++++++++++++).[-]>
	get the one's complement of the number (which I accidentally recreated *shrug*)
	[<(11+++++++++++)>[-<->]>]<<+
	Carries the one if need be
	[(11-----------) [11(+++++++++++)>>>] < [+>>>>+<<<]<]
	Moves the digits back if the one was carried
	>>>
	[
		[-<<<+>>>]
		>
	]
	<<<<[<]>+<
]
>-

Looks for the first number that does not represent 0
[
	Subtracts 1
	-
	If the Number is not 0 move the pointer back 2 to the definite 0
	[<<]
	Move forward one
	>
	If the Number was not 0 the pointer is now on the 0 one left of the Number
	else the pointer is now on the next number to the right and repeat
]

Add one to compensate for the above check
>+
Print out every number with added 47 to get it to ASCII
[
	(47+++++++++++++++++++++++++++++++++++++++++++++++)
	.>
]
