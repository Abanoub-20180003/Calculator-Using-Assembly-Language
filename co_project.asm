#kza kza kza kza 
.data
	#first message
	choseInputType: .asciiz "what kind of element you want to sort ?\n1 - for numbers \n2 - for characters\n"
	
	incorrect_message: .asciiz "incorrect choice \n"
	elements_size_message: .asciiz "how many elements?\n"
	Enter_list_of_numbers_message:.asciiz "Enter your list of numbers\n"
	Enter_list_of_chars_message:.asciiz "Enter your list of chars\n"
	size: .word 0
	
	#array of intger elements 
	.align 2
	unsArrayOfIntElemnts: .space 100
	.align 2
	ArrayOfIntElemnts: .space 100
	
	#array of char elements 
	
	unsArrayOfCharElemnts: .space 100
	
	ArrayOfCharElemnts: .space 100
	
	chooise_kind_OfSort_message: .asciiz "\nWhat kind of sort you want ?\n1- for insertion sort\n2- for merge sort\n3- for quick sort\n"
 	kind_fo_sort: .word 0
 	resalt: .word 0
 	
 	#after sorting messages
 	elements_beforSorting_message :.asciiz "\nelements befor sorting\n"
 	elements_afterSorting_message :.asciiz "\nelements after sorting\n"
 	
 	#final loop mesages
 	end_message_int : .asciiz "\nchoice an option: \n1-searche for number \n2-sort elements\n3-exit\n"
 	end_message_char : .asciiz "\nchoice an option: \n1-searche for char \n2-sort elements\n3-exit\n"
 	
 	#binary search messages
 	num_toSearch_message:.asciiz "\nenter the number to search for:"
 	char_toSearch_message:.asciiz "\nenter the number to search for: "
 	found: .asciiz "\nThe Element is present in the Array at Position: "
	not_found: .asciiz "\nElement not found in the Array.\n"
 	space: .asciiz "  "
 	
 	#merge sort function data 
 	.align 2
 	temp: .space 100   
 	##
 	tempChar: .space 100 
 	
 	
 	#test
 	 finish_fun:.asciiz "finish function \n"
 	 enter_fun:.asciiz "enter function \n"
 	  return_copy:.asciiz "return copy \n"
 	  inMerge:.asciiz "inMerge \n"
 	  inMerge2:.asciiz "inMerge 2\n"
 	  inMerge1:.asciiz "inMerge 1\n"
 	  done: .asciiz "doneeee\n"
 	  
 	  
_msg0:       .asciiz "Unsorted Array"
_msg1:       .asciiz "Sorted Array"
_newline:    .asciiz "\n"
_spaces:   .asciiz " "
 	  #array of char 
 	  
.text
#main function 
main:
	while_global:
		#print message to user  
		la $a0 ,choseInputType
		li $v0, 4
		syscall 
		#get int input from user 
		li $v0, 5
		syscall
		#store int in regester 
		move $t0,$v0
	
		#check input of user 
		beq $t0,1, if_choice_int
		beq $t0,2, if_choice_char
		#print incorrect message 
		li $v0,4
		la $a0 , incorrect_message
		syscall
		#return to main loop
		j while_global
		
		####################################################################
		#if user choice numbers
		if_choice_int:
		
		
			#print message enter size of elements
			li $v0, 4
			la $a0, elements_size_message
			syscall
			#take number and store in t0
			li $v0, 5
			syscall
			move $t0 , $v0
			#stor number of elements in var size 
			la $t1, size
			sw $t0 , 0($t1)
			#print message enter your list of numbers 
			
			la $a0 , Enter_list_of_numbers_message
			li $v0, 4
			syscall 
			#call of getArrayOfIntegers function 
			j getArrayOfIntegers
			
			#copy array to anther function
			copy_fun_int: 
				j copyArrayToAntherInt
			
			
			#sub loop 1 to Choose kind of sort
			sub_While_1_ChooseKindOfSortInt:
				li $v0, 4
				la $a0 ,chooise_kind_OfSort_message
				syscall 
				#take choice from user 
				li $v0 , 5
				syscall
				
				la $t1 , kind_fo_sort
				sw $v0 , 0($t1)
				
				
				#if to chech reselt 
				lw $t1 , kind_fo_sort

				beq $t1 , 1 , insertion_fun 
				beq $t1 , 2, MergeSort
				beq $t1 , 3, quickSortInt
				li $v0 ,4
				la $a0 , incorrect_message
				syscall
				
				j sub_While_1_ChooseKindOfSortInt
				
			print_intElements_afterSort:
				li $v0 ,4
				la $a0 ,elements_beforSorting_message
				syscall
				#call function printIntElemnts
				j print_beforSortInt_fun
				after_sort_int:
				li $v0 ,4
				la $a0 ,elements_afterSorting_message
				syscall
				j print_afterSortInt_fun
				
				
			#chose search , start from beginig for sort or exit 	
			sub_While_2_searcheforInt:
				li $v0 ,4
				la $a0 ,end_message_int 
				syscall
				#take choice from user 
				li $v0 , 5
				syscall	
				#if to check choice 
				move $t2, $0
				addi $t2 , $t2 , 1# set t2 = 1 if chose search
				beq $v0 , $t2 , binarySearchInt
				addi $t2 , $t2 , 1#set t2 = 2   sort again 
				beq $v0 , $t2 ,while_global #go back to start of program 
				addi $t2 , $t2 , 1#set t2 = 3  end program 
				beq $v0 , $t2 ,end_main
				#print ncorrect choice 
				li $v0 , 4
				la $a0 , incorrect_message 
				syscall 
				j sub_While_2_searcheforInt
				
				
					
		####################################################################
		#if user chose char------------------------------------------------#
		if_choice_char:
			#print message enter size of elements
			li $v0, 4
			la $a0, elements_size_message
			syscall
			#take number and store in t0
			li $v0, 5
			syscall
			move $t0 , $v0
			#stor number of elements in var size 
			la $t1, size
			sw $t0 , 0($t1)
			
			#print message enter your list of chars  
			la $a0 , Enter_list_of_chars_message
			li $v0, 4
			syscall 
			#call of getArrayOfChar function 		
			j getArrayOfChars
			
			#copy array to anther function
			copy_fun_char: 
				j copyArrayToAntherChar	
			
			#sub loop 1 to Choose kind of sort
			sub_While_1_ChooseKindOfSortChar:
				li $v0, 4
				la $a0 ,chooise_kind_OfSort_message
				syscall 
				#take choice from user 
				li $v0 , 5
				syscall
				
				la $t1 , kind_fo_sort
				sw $v0 , 0($t1)
				
				
				#if to chech reselt 
				lw $t1 , kind_fo_sort

				beq $t1 , 1 , insertion_fun_char    
				beq $t1 , 2,  MergeSort_char		
				beq $t1 , 3, quickSort_charGlobal 
				
				#print incorrect message 
				li $v0 ,4
				la $a0 , incorrect_message
				syscall
				
				j sub_While_1_ChooseKindOfSortChar
				
			print_charElements_afterSort:
				li $v0 ,4
				la $a0 ,elements_beforSorting_message
				syscall
				#call function printCharElemnts
				j print_beforSortChar_fun
				after_sort_char:
				li $v0 ,4
				la $a0 ,elements_afterSorting_message
				syscall
				j print_afterSortChar_fun
				
				
			#chose search , start from beginig for sort or exit 	
			sub_While_2_searcheforChar:
				li $v0 ,4
				la $a0 ,end_message_char
				syscall
				#take choice from user 
				li $v0 , 5
				syscall	
				#if to check choice 
				move $t2, $0
				addi $t2 , $t2 , 1# set t2 = 1 if chose search
				beq $v0 , $t2 , binarySearchChar		
				addi $t2 , $t2 , 1#set t2 = 2   sort again 
				beq $v0 , $t2 ,while_global #go back to start of program 
				addi $t2 , $t2 , 1#set t2 = 3  end program 
				beq $v0 , $t2 ,end_main
				#print ncorrect choice 
				li $v0 , 4
				la $a0 , incorrect_message 
				syscall 
				j sub_While_2_searcheforInt	
	
		j end_main	
	
	#end of main
	end_main:
		li $v0 ,10
		syscall
		
###################################################################################
###################################################################################
#kamal
#fun to copy unstracture array into new array 
copyArrayToAntherInt:
	addi $t1 , $zero,0
	addi $t3 , $zero,0
	lw $t2, size
	
	while_copy_array_to_anther_int:
		#if size == 0 exit loop 
		beq $t2 ,$0,exit_while_copy_array_to_anther_int
		 	lw $t4, unsArrayOfIntElemnts($t3)
		
  	  	 	sw $t4 , ArrayOfIntElemnts($t1)
			
			#increment pointer of the two arrayes
    			addu $t1, $t1, 4
    			addu $t3, $t3, 4
    			#decrment loop var by 1
    			subi $t2 ,$t2 ,1
   			#blt $t1, $t0, copy_loop # if load pointer < src_array + 30*4
			j while_copy_array_to_anther_int
		
	exit_while_copy_array_to_anther_int:
	      
		j sub_While_1_ChooseKindOfSortInt

copyArrayToAntherChar:
	addi $t1 , $zero,0
	addi $t3 , $zero,0
	lw $t2, size
	
	while_copy_array_to_anther_char:
		#if size == 0 exit loop 
		beq $t2 ,$0,exit_while_copy_array_to_anther_char
		 	lb $t4, unsArrayOfCharElemnts($t3)
		
  	  	 	sb $t4 , ArrayOfCharElemnts($t1)
			
			#increment pointer of the two arrayes
    			addu $t1, $t1, 1
    			addu $t3, $t3, 1
    			#decrment loop var by 1
    			subi $t2 ,$t2 ,1
   			#blt $t1, $t0, copy_loop # if load pointer < src_array + 30*4
			j while_copy_array_to_anther_char
		
	exit_while_copy_array_to_anther_char:
		j sub_While_1_ChooseKindOfSortChar
		
	
###################################################################################	
###################################################################################
#raafat
getArrayOfIntegers:
	addi $t1 , $zero,0
	lw $t2 ,size
	while_getArrayOfIntegers:
		beq $t2 ,$0,exit_getArrayOfIntegers	        
			li   $v0,5
          		syscall 
          		move $t3 ,  $v0
			sw  $t3,unsArrayOfIntElemnts($t1)
			addi $t1 , $t1 ,4
         		#decrment loop var by 1
			subi $t2 ,$t2 ,1
           		j while_getArrayOfIntegers

	exit_getArrayOfIntegers: 
		j copy_fun_int
		
getArrayOfChars:
	lw $t0, size 
	addi , $t0 ,$t0 , 1
	#get array from user as string 
	li $v0 , 8
	la $a0 , unsArrayOfCharElemnts
	move $a1 , $t0
	syscall
	
	j copy_fun_char
		
		
		
		
print_beforSortInt_fun:
	lw $t3 , size
	addi $t0, $zero ,0
	while_print_beforSortInt_fun:
		beq $t3,$0,exit_print_beforSortInt_fun		# end loop condition
	
		lw $at,unsArrayOfIntElemnts($t0) 	#load element in $t6
	
		#increament the index to show next elelment 
		add  $t0,$t0,4
	
		#print the element in the screen
		li   $v0,1
		move $a0,$at
		syscall 
	
		#make new line
		li   $v0,4
		la $a0,space
		syscall 
		subi $t3 , $t3 , 1
	
		j while_print_beforSortInt_fun
		exit_print_beforSortInt_fun:
		 j after_sort_int
		 
print_afterSortInt_fun:
	lw $t3 , size
	addi $t0 , $zero , 0
	
	
	while_print_afterSortInt_fun:
		beq $t3,$0,exit_afterSortInt_fun		# end loop condition
	
		lw $at,ArrayOfIntElemnts($t0) 	#load element in $t6
	
		#increament the index to show next elelment 
		add  $t0,$t0,4
	
		#print the element in the screen
		li   $v0,1
		move $a0,$at
		syscall 
	
		#make new line
		li   $v0,4
		la $a0,space
		syscall 
		subi $t3 , $t3 , 1
	
		j while_print_afterSortInt_fun
		exit_afterSortInt_fun:
		 j sub_While_2_searcheforInt
			#sub_While_2_searcheforInt
			
			
print_beforSortChar_fun:
	lw $t3 , size
	addi $t0, $zero ,0
	while_print_beforSortChar_fun:
		beq $t3,$0,exit_print_beforSortChar_fun		# end loop condition
	
		#print the element in the screen
		lb $a0 ,unsArrayOfCharElemnts($t0) 	
		li   $v0, 11
		syscall 
		#increament the index to show next elelment 
		add  $t0,$t0,1

		#make new line
		li   $v0,4
		la $a0,space
		syscall 
		subi $t3 , $t3 , 1
	
		j while_print_beforSortChar_fun
		exit_print_beforSortChar_fun:
		 j after_sort_char
		 
print_afterSortChar_fun:
	lw $t3 , size
	addi $t0 , $zero , 0
	
	
	while_print_afterSortChar_fun:
		beq $t3,$0,exit_afterSortChar_fun		# end loop condition
	
		#print the element in the screen
		lb $a0, ArrayOfCharElemnts($t0) 	#load element in $t6
		li   $v0,11
		syscall 
		
		#increament the index to show next elelment 
		add  $t0,$t0,1

		#make space 
		li   $v0,4
		la $a0,space
		syscall 
		
		#decrement size by 1 
		subi $t3 , $t3 , 1
	
		j while_print_afterSortChar_fun
		exit_afterSortChar_fun:
		 j sub_While_2_searcheforChar
			

###################################################################################
###################################################################################
#gerges
#pre:you should rename the array ==> array  and initialize t9==> size of array * 4
#post: it will sort the array and print it
insertion_fun:
	
	
	lw $t0 , size
	
	addi $t1 , $zero , 0
	addi $t1 ,$zero, 4
	
	mult $t0 , $t1
	mflo $t9
	
	insertoin:
		add $t7,$zero,0 	#boolean flag
		add $t2,$zero,-4	#previous index
		add $t3,$zero,0		#current index
	
		jal insertoinloopInstead
	
	
	j insertoin

	
	#this is private function don't call it in main
	insertoinloopInstead:
		add $t2,$t2,4		#previous index ++
		add $t3,$t3,4		#current index ++
	 
		beq $t3,$t9,EndInsertion
		lw $t4,ArrayOfIntElemnts($t2) 	#previous element
		lw $t5,ArrayOfIntElemnts($t3) 	#current element
	
		blt $t5,$t4,foundSwappableAndSwap #if(arr[i]<arr[i-1]){flag=1 and make swape}
	
	j insertoinloopInstead

	#this is private function don't call it in main 
	foundSwappableAndSwap:
		add $t7,$zero,1 	#set flag equal 1
		#make swape to the two element in array
		sw $t5,ArrayOfIntElemnts($t2)	#take element from t5 and put it in array
		sw $t4,ArrayOfIntElemnts($t3)	#take element from t4 and put it in array
	jal insertoinloopInstead#go back to loop
	
	#this is private function don't call it in main
	EndInsertion:
		add $t0,$zero,0
		
		beqz $t7,return_to_main #Insertion Algo End And print the array
		j insertoin
	return_to_main:
		
		j print_intElements_afterSort
		
#------------------------char--------------------------#
insertion_fun_char:
	
	
	lw $t0 , size
	
	addi $t1 , $zero , 0
	addi $t1 ,$zero, 1
	
	mult $t0 , $t1
	mflo $t9
	
	insertoin_char:
		add $t7,$zero,0 	#boolean flag
		add $t2,$zero,-1	#previous index
		add $t3,$zero,0		#current index
	
		jal insertoinloopInstead_char
	
	
	j insertoin_char

	
	#this is private function don't call it in main
	insertoinloopInstead_char:
		add $t2,$t2,1		#previous index ++
		add $t3,$t3,1		#current index ++
	 
		beq $t3,$t9,EndInsertion_char
		lb $t4,ArrayOfCharElemnts($t2) 	#previous element
		lb $t5,ArrayOfCharElemnts($t3) 	#current element
	
		blt $t5,$t4,foundSwappableAndSwap_char #if(arr[i]<arr[i-1]){flag=1 and make swape}
	
	j insertoinloopInstead_char

	#this is private function don't call it in main 
	foundSwappableAndSwap_char:
		add $t7,$zero,1 	#set flag equal 1
		#make swape to the two element in array
		sb $t5,ArrayOfCharElemnts($t2)	#take element from t5 and put it in array
		sb $t4,ArrayOfCharElemnts($t3)	#take element from t4 and put it in array
	jal insertoinloopInstead_char#go back to loop
	
	#this is private function don't call it in main
	EndInsertion_char:
		add $t0,$zero,0
		
		beqz $t7,return_to_main_char #Insertion Algo End And print the array
		j insertoin_char
	return_to_main_char:
	
		j print_charElements_afterSort
		
###################################################################################
###################################################################################
#ahmad
binarySearchInt:
	li $v0 , 4
	la $a0 , num_toSearch_message
	syscall
					
	#take number to search for 
	li $v0, 5
	syscall
	
	#a3=number to be searched
	addi $a3, $v0, 0

	#a0 array

	la $a0, ArrayOfIntElemnts

	#a1=low

	addi $a1, $zero, 0

	#a2=high
	lw $t0 , size
	addi $a2, $t0, -1
	
	
	#Function

	binary_search:
		
		#$s2=mid
		la $a0, ArrayOfCharElemnts

		addi $s2, $zero, 0

		slt $t1, $a2, $a1

		beq $t1, $zero, if1
		
		#if elemnt not found , print not message 
		li $v0, 4
		la $a0, not_found
		syscall
		
		#retrun to mian 
		j sub_While_2_searcheforInt

		if1:

		add $s2, $a2, $a1

		#t9=2 so that i could divide mid with by 2

		addi $t9, $zero, 2

		div $s2, $t9

		mflo $s2 

		mflo $s3

		mul $s3, $s3, 4 

		add $a0, $a0, $s3

		lw $s4, 0($a0)

		bne $s4, $a3, if2
		
		#elemnt is found message 
		li $v0, 4
		la $a0, found
		syscall
		#print position of founded element 
		move $t7 , $s2
		addi $t7 ,$t7 , 1
		li $v0, 1
		addi $a0, $t7, 0	
		syscall
		
		#return to main 
		j sub_While_2_searcheforInt

		if2:

		slt $t5, $a3, $s4

		beq $t5, $zero, else

		addi $a2, $s2, -1

		addi $sp, $sp, -4

		sw $ra, 0($sp)

		j binary_search



		j exit

		else:

		addi $a1, $s2, 1

		addi $sp, $sp, -4

		sw $ra, 0($sp)

		j binary_search

		j exit

		exit:
		j sub_While_2_searcheforInt
		
#---------------------------------char-----------------------#		
		
binarySearchChar:
	li $v0 , 4
	la $a0 , ###char that want to Search message
	syscall
					
	#take char to search for 
	li $v0, 12
	syscall
	#a3=char to be searched
	move $a3, $v0

	#a0 array

	la $a0, ### name of array of chars

	#a1=low

	addi $a1, $zero, 0

	#a2=high
	lw $t0 , size
	addi $a2, $t0, -1
	
	
	#Function

	binary_search_char:
		
		#$s2=mid
		la $a0, ArrayOfCharElemnts

		addi $s2, $zero, 0

		slt $t1, $a2, $a1

		beq $t1, $zero, if1_char
		
		#if elemnt not found , print not message 
		li $v0, 4
		la $a0, not_found
		syscall
		
		#retrun to mian 
		j sub_While_2_searcheforChar

		if1_char:

		add $s2, $a2, $a1

		#t9=2 so that i could divide mid with by 2

		addi $t9, $zero, 2

		div $s2, $t9

		mflo $s2 

		mflo $s3

		mul $s3, $s3, 1 ####m

		add $a0, $a0, $s3

		lb $s4, 0($a0)

		bne $s4, $a3, if2_char ###########################
		
		#elemnt is found message 
		li $v0, 4
		la $a0, found
		syscall
		#print position of founded element 
		move $t7 , $s2
		addi $t7 ,$t7 , 1
		li $v0, 1
		addi $a0, $t7, 0	
		syscall
		
		#return to main 
		j sub_While_2_searcheforChar

		if2_char:

		slt $t5, $a3, $s4

		beq $t5, $zero, else_char

		addi $a2, $s2, -1

		addi $sp, $sp, -4

		sw $ra, 0($sp)

		j binary_search_char



		j exit_char

		else_char:

		addi $a1, $s2, 1

		addi $sp, $sp, -4

		sw $ra, 0($sp)

		j binary_search_char

		j exit_char

		exit_char:
		j ### retrun to main mnue
	
######################################################################################
######################################################################################
#Andro

quickSortInt:
	
	# let's first prepare the arguments
	la $a0, ArrayOfIntElemnts # a0 = arr
	li $a1, 0 # a1 = 0
	lw $a2, size
	subi $a2, $a2, 1 # a2 = array_size-1

quickSort:
	# function body
	
	# let's store some variables in the stack first
	# because we will need them after
	
	subi $sp, $sp, 24
	# allocate 24 byte in the stack to store 24/4=6 words
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $a1, 12($sp)
	sw $a2, 16($sp)
	sw $ra, 20($sp)
	
	move $s0, $a1 # l = left
	move $s1, $a2 # r = right
	move $s2, $a1 # pivot = left
	
	# main loop
main_loop:
	bge $s0, $s1, main_loop_exit # this branch is in the end of this file
	# go to main_loop_exit if s0 >= s1
	# else continue execution
	
inner_loop1:
	# while(arr[l] <= arr[p] && l < right )
	# let's get arr[l] first
	# set t7 with 4
	li $t7, 4
	
	mult $s0, $t7
	mflo $t0 # t0 = s0*4
	add $t0, $a0, $t0 # t0 = &arr[l]
	lw $t0, 0($t0) # t0 = arr[l]
	
	# now let's get arr[p]
	mult $s2, $t7
	mflo $t1
	add $t1, $a0, $t1 # t1 = &arr[p]
	lw $t1, 0($t1) # t1 = arr[p]
	
	bgt $t0, $t1, inner_loop1_exit # if arr[l] > arr[p] exit the loop
	bge $s0, $a2, inner_loop1_exit # if l >= right exit the loop
	
	addi $s0, $s0, 1 # l++
	j inner_loop1
	
inner_loop1_exit:
	# when we exit the first inner loop we enter to
	# the second inner loop 
inner_loop2:
	
	# while (arr[r] >= arr[p] && r> left)
	# let's get arr[r]
	li $t7, 4
	mult $s1, $t7
	mflo $t0
	add $t0, $a0, $t0
	lw $t0, 0($t0) # t0 = arr[r]
	
	# now let's get arr[p]
	mult $s2, $t7
	mflo $t1
	add $t1, $a0, $t1
	lw $t1, 0($t1) # t1 = arr[p]
	
	blt $t0, $t1, inner_loop2_exit # if arr[r] < arr[p] exit the loop
	ble $s1, $a1, inner_loop2_exit # if r <= left exit the loop
	
	subi $s1, $s1, 1
	j inner_loop2

inner_loop2_exit:
	# when we exit the second inner loop we enter to
	# the if statement
	
	# if( l >= r )
	blt $s0, $s1, exit_if
	# swap (arr[p], arr[r])
	# arr[p]
	li $t7, 4
	mult $s2, $t7
	mflo $t6 # t6 = p * 4 bytes
	add $t0, $a0, $t6 # t0 = &arr[p]
	
	# arr[r]
	mult $s1, $t7
	mflo $t6
	add $t1, $a0, $t6 #t1 = &arr[r]
	
	#swaping
	lw $t2, 0($t0)
	lw $t3, 0($t1)
	sw $t3, 0($t0)
	sw $t2, 0($t1)
	
	# calling quickSort function (recursion) first time
	move	$a2, $s1
	subi	$a2, $a2, 1	# a2 = r - 1
	jal		quickSort # quickSort(arr, left, r-1)
	# after calling quickSort, we load the previous 
	# values to its appropriate registers
	lw $a1, 12($sp) # load a1
	lw $a2, 16($sp) # load a2
	lw $ra, 20($sp) # load ra
	
	# calling quickSort function (recursion) second time
	move $a1, $s1
	addi $a1, $a1, 1 # a1 = r + 1
	jal quickSort
		
	# after calling quickSort, we load the previous 
	# values to its appropriate registers
	lw $s0, 0($sp) # load s0
	lw $s1, 4($sp) # load s1
	lw $s2, 8($sp) # load s2
	lw $a1, 12($sp) # load a1
	lw $a2, 16($sp) # load a2
	lw $ra, 20($sp) # load ra
	addi $sp, $sp, 24 # return the allocated space to the stack
	
	# return to the caller (exit the function entirely) return to main 
	j print_intElements_afterSort

exit_if:
	# swap(arr[l], arr[r])
	li $t7, 4
	mult $s0, $t7
	mflo $t6
	add $t0, $a0, $t6 # t0 = &arr[l]
	
	mult $s1, $t7
	mflo $t6
	add $t1, $a0, $t6 # t1 = &arr[r]
	
	# swapping
	lw $t2, 0($t0)
	lw $t3, 0($t1)
	sw $t3, 0($t0)
	sw $t2, 0($t1)
	
	# jump to the main loop
	j main_loop
	
main_loop_exit:
	# return and exit the function
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 24 # return the allocated space to the stack
	jr $ra


#---------------------------------CHARACTERS SORTING-----------------------------------#

quickSort_charGlobal:
	la $a0, ArrayOfCharElemnts # a0 = arr
	li $a1, 0 # a1 = 0
	lw $a2, size
	subi $a2, $a2, 1 # a2 = array_size-1
quickSort_char:
	# function body
	
	# let's store some variables in the stack first
	# because we will need them after
	
	subi $sp, $sp, 24
	# allocate 24 byte in the stack to store 24/4=6 words
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $a1, 12($sp)
	sw $a2, 16($sp)
	sw $ra, 20($sp)
	
	move $s0, $a1 # l = left
	move $s1, $a2 # r = right
	move $s2, $a1 # pivot = left
	
	# main loop
main_loop_char:
	bge $s0, $s1, main_loop_exit_char # this branch is in the end of this file
	# go to main_loop_exit if s0 >= s1
	# else continue execution
	
inner_loop1_char:
	# while(arr[l] <= arr[p] && l < right )
	# let's get arr[l] first

	move $t0, $s0
	add $t0, $a0, $t0 # t0 = &arr[l]
	lb $t0, 0($t0) # t0 = arr[l]
	
	# now let's get arr[p]
	move $t1, $s2
	add $t1, $a0, $t1 # t1 = &arr[p]
	lb $t1, 0($t1) # t1 = arr[p]
	
	bgt $t0, $t1, inner_loop1_exit_char # if arr[l] > arr[p] exit the loop
	bge $s0, $a2, inner_loop1_exit_char # if l >= right exit the loop
	
	addi $s0, $s0, 1 # l++
	j inner_loop1_char
	
inner_loop1_exit_char:
	# when we exit the first inner loop we enter to
	# the second inner loop 
inner_loop2_char:
	
	# while (arr[r] >= arr[p] && r> left)
	# let's get arr[r]
	
	move $t0, $s1
	add $t0, $a0, $t0
	lb $t0, 0($t0) # t0 = arr[r]
	
	# now let's get arr[p]
	move $t1, $s2
	add $t1, $a0, $t1
	lb $t1, 0($t1) # t1 = arr[p]
	
	blt $t0, $t1, inner_loop2_exit_char # if arr[r] < arr[p] exit the loop
	ble $s1, $a1, inner_loop2_exit_char # if r <= left exit the loop
	
	subi $s1, $s1, 1
	j inner_loop2_char

inner_loop2_exit_char:
	# when we exit the second inner loop we enter to
	# the if statement
	
	# if( l >= r )
	blt $s0, $s1, exit_if_char
	# swap (arr[p], arr[r])
	# arr[p]

	move $t6, $s2
	add $t0, $a0, $t6 # t0 = &arr[p]
	
	# arr[r]
	move $t6, $s1
	add $t1, $a0, $t6 #t1 = &arr[r]
	
	#swaping
	lb $t2, 0($t0)
	lb $t3, 0($t1)
	sb $t3, 0($t0)
	sb $t2, 0($t1)
	
	# calling quickSort function (recursion) first time
	move	$a2, $s1
	subi	$a2, $a2, 1	# a2 = r - 1
	jal		quickSort_char # quickSort(arr, left, r-1)
	# after calling quickSort, we load the previous 
	# values to its appropriate registers
	lw $a1, 12($sp) # load a1
	lw $a2, 16($sp) # load a2
	lw $ra, 20($sp) # load ra
	
	# calling quickSort function (recursion) second time
	move $a1, $s1
	addi $a1, $a1, 1 # a1 = r + 1
	jal quickSort_char
		
	# after calling quickSort, we load the previous 
	# values to its appropriate registers
	lw $s0, 0($sp) # load s0
	lw $s1, 4($sp) # load s1
	lw $s2, 8($sp) # load s2
	lw $a1, 12($sp) # load a1
	lw $a2, 16($sp) # load a2
	lw $ra, 20($sp) # load ra
	addi $sp, $sp, 24 # return the allocated space to the stack
	
	# return to the caller (exit the function entirely) main function 
	j print_charElements_afterSort

exit_if_char:
	# swap(arr[l], arr[r])
	
	move $t6, $s0
	add $t0, $a0, $t6 # t0 = &arr[l]
	
	move $t6, $s1
	add $t1, $a0, $t6 # t1 = &arr[r]
	
	# swapping
	lb $t2, 0($t0)
	lb $t3, 0($t1)
	sb $t3, 0($t0)
	sb $t2, 0($t1)
	
	# jump to the main loop
	j main_loop_char
	
main_loop_exit_char:
	# return and exit the function
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 24 # return the allocated space to the stack
	jr $ra
#####################################################################################################
#####################################################################################################
#magdy 
MergeSort:
	 
   #Load array address
   la   $a0, temp       # address of temp array
   la   $a1, ArrayOfIntElemnts       # load address of unsorted array
   lw   $a2, size    # load size of array into $a2 
   and   $a3, $zero, $zero   # initializing low = 0

   or   $t0, $a1, $zero       # address of unsorted array
   or   $t3, $a2, $zero       # array length

 
	PrepSort:

   		addi   $sp,   $sp,    -16   # make room on the stack
   		sw   $ra,   0($sp)       # return address
  		 sw   $a1,   8($sp)       # save address unsorted array
   		add   $a2, $a2, -1       # setting $a2 to (high - 1)
   		sw   $a2,   4($sp)       # save the size of the (array-1)
   		sw   $a3,   0($sp)       # low parameter
   		jal   MSORT           # jump to merge sort with arguments (array, high, low)
  

   		j print_intElements_afterSort

	MSORT:
	
  		 addi $sp, $sp, -20       # make room on the stack
   		sw $ra, 16($sp)           # save return address
   		sw $s1, 12($sp)           # save arguments unsorted array address
   		sw $s2, 8($sp)           # save arguments size of array = high
   		sw $s3, 4($sp)           # save low size of array
   		sw $s4, 0($sp)           # save register for mid
   		or $s1, $zero, $a1       # $s1 <- array address
   		or $s2, $zero, $a2       # $s2 <- size of array - 1 = high
   		or $s3, $zero, $a3       # $s3 <- low size
   		slt $t3, $s3, $s2           # low < high
   		beq $t3, $zero, DONE       # if $t3 == 0, DONE
   		add $s4, $s3, $s2       # low + high
		div $s4, $s4, 2           # $s4 <- (low+high)/2
   		or $a2, $zero, $s4       # argument low
   		or $a3, $zero, $s3       # argument mid
   		jal   MSORT           # recursive call for (array, low, mid)

   		# mergesort (a, mid+1, high)
   		addi $t4, $s4, 1           # argument mid +1
  		 or $a3, $zero, $t4       # low gets (mid+1)
  		 or $a2, $zero, $s2       # high gets high
   		jal   MSORT           # recursive call for (a, mid+1, high)

   		or $a1, $zero, $s1       # Argument 1 gets array address
   		or $a2, $zero, $s2       # Argument 2 gets high
   		or $a3, $zero, $s3       # Argument 3 gets low
   		or $a0, $zero, $s4       # Argument 4 gets mid
   		jal   MERGE           # jump to merge (array, high, low, mid)
  
	DONE:
          
   		lw   $ra,   16($sp)       # load return address
   		lw   $s1,   12($sp)       # load arguments array address
   		lw   $s2,   8($sp)       # load arguments size of array = high
   		lw   $s3,   4($sp)       # low size of array
   		lw   $s4,   0($sp)       # register for mid
   		addi   $sp,   $sp,    20   # clear room on the stack
   		jr $ra               # jump to register

	MERGE:  

   		addi $sp, $sp, -20       # make room on the stack
   		sw $ra, 16($sp)           # save return address
   		sw $s1, 12($sp)           # save arguments unsorted array address
   		sw $s2, 8($sp)           # save arguments size of array = high
   		sw $s3, 4($sp)           # save low size of array
   		sw $s4, 0($sp)           # save register for mid
   		or $s1, $zero, $a1       # array address
   		or $s2, $zero, $a2       # $s2 <- size of array = high
   		or $s3, $zero, $a3       # $s3 <- low size
   		or $s4, $zero, $a0       # $s4 <- mid
   		or $t1, $zero, $s3       # i= $t1 gets low
   		or $t2, $zero, $s4       # j= $t2 gets mid
   		addi $t2, $t2, 1           # j= $t2 gets mid + 1
   		or $t3, $zero, $a3       # k = low

	WHILE:

   		slt $t4, $s4, $t1       # mid < i (i>=mid)
   		bne $t4, $zero, while2   # go to while 2 if i >= mid
   		slt $t5, $s2, $t2       # high < j (j>=high)
   		bne $t5, $zero, while2   # && go to while 2 if j >= high
   		sll $t6, $t1, 2       # i*4
   		add $t6, $s1, $t6   # $t6 = address a[i]
   		lw $s5, 0($t6)       # $s5 = a[i]
   		sll $t7, $t2, 2       # j*4
   		add $t7, $s1, $t7   # $t7 = address a[j]
   		lw $s6, 0($t7)       # $s6 = a[j]
   		slt $t4, $s5, $s6       # a[i] < a[j]
   		beq $t4, $zero, ELSE   # go to else if a[i] >= a[j}
   		sll $t8, $t3, 2       # k*4
   		la $a0, temp       # load address of temporary array (neccasary if using $a0 for print statements)
   		add $t8, $a0, $t8   # $t8 = address c[k]
   		sw $s5, 0($t8)       # c[k] = a[i]
   		addi $t3, $t3, 1       # k++
   		addi $t1, $t1, 1       # i++
   		j   WHILE

	ELSE:

   		sll $t8, $t3, 2       # i*4
   		la $a0, temp       # # load address of temporary array (neccasary if using $a0 for print statements)
   		add $t8, $a0, $t8   # $t8 = address c[k]
   		sw $s6, 0($t8)       # c[k] = a[j]
   		addi $t3, $t3, 1       # k++
   		addi $t2, $t2, 1       # j++
   		j   WHILE

	while2:

   		slt $t4, $s4, $t1       # mid < i (i>=mid)
   		bne $t4, $zero, while3   # go to while3 if i >= mid
  		 sll $t6, $t1, 2       # i*4
  		 add $t6, $s1, $t6   # $t6 = address a[i]
		lw $s5, 0($t6)       # $s5 = a[i]
   		sll $t8, $t3, 2       # i*4
   		la $a0, temp       # load address of temporary array (neccasary if using $a0 for print statements)
   		add $t8, $a0, $t8   # $t8 = address c[k]
   		sw $s5, 0($t8)       # c[k] = a[i]
   		addi $t3, $t3, 1       # k++
   		addi $t1, $t1, 1       # i++
   		j   while2

	while3:

   		slt $t5, $s2, $t2       # high < j (j>=high)
   		bne $t5, $zero, start   # go to for loop if j >= high
   		sll $t7, $t2, 2       # i*4
   		add $t7, $s1, $t7   # $t7 = address a[j]
   		lw $s6, 0($t7)       # $s6 = a[j]
   		sll $t8, $t3, 2       # i*4
   		la $a0, temp       # load address of temporary array (neccasary if using $a0 for print statements)
   		add $t8, $a0, $t8   # $t8 = address c[k]
   		sw $s6, 0($t8)       # c[k] = a[j]
   		addi $t3, $t3, 1       # k++
   		addi $t2, $t2, 1       # j++
   		j   while3

	start:

   		or $t1, $zero, $s3   # i <- low

	forloop:

   		slt $t5, $t1, $t3       # i < k
   		beq $t5, $zero, DONE   # branch if merging is complete
  		 sll $t6, $t1, 2       # i*4
  		 add $t6, $s1, $t6   # $t6 = address a[i]
  		 sll $t8, $t1, 2       # i*4
  		 la $a0, temp       # load address of temporary array (neccasary if using $a0 for print statements)
  		 add $t8, $a0, $t8       # $t8 = address c[i]
  		 lw $s7, 0($t8)       # $s7 = c[i]
  		 sw $s7, 0($t6)       # a[i]
  		 addi $t1, $t1, 1       # i++
  		 j   forloop
  		 
  		 
 #-------------------------------------------char--------#
 MergeSort_char:
	 
   #Load array address
   la   $a0, tempChar       # address of temp array
   la   $a1, ArrayOfCharElemnts       # load address of unsorted array
   lw   $a2, size    # load size of array into $a2 
   and   $a3, $zero, $zero   # initializing low = 0

   or   $t0, $a1, $zero       # address of unsorted array
   or   $t3, $a2, $zero       # array length

 
	PrepSort_char:

   		addi   $sp,   $sp,    -16   # make room on the stack
   		sw   $ra,   0($sp)       # return address
  		 sw   $a1,   8($sp)       # save address unsorted array
   		add   $a2, $a2, -1       # setting $a2 to (high - 1)
   		sw   $a2,   4($sp)       # save the size of the (array-1)
   		sw   $a3,   0($sp)       # low parameter
   		jal   MSORT_char            # jump to merge sort with arguments (array, high, low)
  

   		j print_charElements_afterSort

	MSORT_char :
	
  		 addi $sp, $sp, -20       # make room on the stack
   		sw $ra, 16($sp)           # save return address
   		sw $s1, 12($sp)           # save arguments unsorted array address
   		sw $s2, 8($sp)           # save arguments size of array = high
   		sw $s3, 4($sp)           # save low size of array
   		sw $s4, 0($sp)           # save register for mid
   		or $s1, $zero, $a1       # $s1 <- array address
   		or $s2, $zero, $a2       # $s2 <- size of array - 1 = high
   		or $s3, $zero, $a3       # $s3 <- low size
   		slt $t3, $s3, $s2           # low < high
   		beq $t3, $zero, DONE_char        # if $t3 == 0, DONE
   		add $s4, $s3, $s2       # low + high
		div $s4, $s4, 2           # $s4 <- (low+high)/2
   		or $a2, $zero, $s4       # argument low
   		or $a3, $zero, $s3       # argument mid
   		jal   MSORT_char            # recursive call for (array, low, mid)

   		# mergesort (a, mid+1, high)
   		addi $t4, $s4, 1           # argument mid +1
  		 or $a3, $zero, $t4       # low gets (mid+1)
  		 or $a2, $zero, $s2       # high gets high
   		jal   MSORT_char            # recursive call for (a, mid+1, high)

   		or $a1, $zero, $s1       # Argument 1 gets array address
   		or $a2, $zero, $s2       # Argument 2 gets high
   		or $a3, $zero, $s3       # Argument 3 gets low
   		or $a0, $zero, $s4       # Argument 4 gets mid
   		jal   MERGE_char            # jump to merge (array, high, low, mid)
  
	DONE_char :
          
   		lw   $ra,   16($sp)       # load return address
   		lw   $s1,   12($sp)       # load arguments array address
   		lw   $s2,   8($sp)       # load arguments size of array = high
   		lw   $s3,   4($sp)       # low size of array
   		lw   $s4,   0($sp)       # register for mid
   		addi   $sp,   $sp,    20   # clear room on the stack
   		jr $ra               # jump to register

	MERGE_char :  

   		addi $sp, $sp, -20       # make room on the stack
   		sw $ra, 16($sp)           # save return address
   		sw $s1, 12($sp)           # save arguments unsorted array address
   		sw $s2, 8($sp)           # save arguments size of array = high
   		sw $s3, 4($sp)           # save low size of array
   		sw $s4, 0($sp)           # save register for mid
   		or $s1, $zero, $a1       # array address
   		or $s2, $zero, $a2       # $s2 <- size of array = high
   		or $s3, $zero, $a3       # $s3 <- low size
   		or $s4, $zero, $a0       # $s4 <- mid
   		or $t1, $zero, $s3       # i= $t1 gets low
   		or $t2, $zero, $s4       # j= $t2 gets mid
   		addi $t2, $t2, 1           # j= $t2 gets mid + 1
   		or $t3, $zero, $a3       # k = low

	WHILE_char :

   		slt $t4, $s4, $t1       # mid < i (i>=mid)
   		bne $t4, $zero, while2_char    # go to while 2 if i >= mid
   		slt $t5, $s2, $t2       # high < j (j>=high)
   		bne $t5, $zero, while2_char    # && go to while 2 if j >= high
   		
   		#increase i by 1 
   		
   		sll $t6, $t1,0      # i*4
   		
   		add $t6, $s1, $t6   # $t6 = address a[i]
   		lb $s5, 0($t6)       # $s5 = a[i]
   		
   		#increase j by 1 
   		
   		sll $t7, $t2 ,0    # j*4
   		
   		add $t7, $s1, $t7   # $t7 = address a[j]
   		lb $s6, 0($t7)       # $s6 = a[j]
   		slt $t4, $s5, $s6       # a[i] < a[j]
   		beq $t4, $zero, ELSE_char    # go to else if a[i] >= a[j}
   		
   		#increase  k by 1 
   		
   		sll $t8, $t3 ,0     # k*4
   		
   		la $a0, tempChar       # load address of temporary array (neccasary if using $a0 for print statements)
   		add $t8, $a0, $t8   # $t8 = address c[k]
   		sb $s5, 0($t8)       # c[k] = a[i]
   		addi $t3, $t3, 1       # k++
   		addi $t1, $t1, 1       # i++
   		j   WHILE_char 

	ELSE_char :

   		
   		sll $t8, $t3  ,0      # i*4
   		
   		la $a0, tempChar       # # load address of temporary array (neccasary if using $a0 for print statements)
   		add $t8, $a0, $t8   # $t8 = address c[k]
   		sb $s6, 0($t8)       # c[k] = a[j]
   		addi $t3, $t3, 1       # k++
   		addi $t2, $t2, 1       # j++
   		j   WHILE_char 

	while2_char :

   		slt $t4, $s4, $t1       # mid < i (i>=mid)
   		bne $t4, $zero, while3_char    # go to while3 if i >= mid
  		
  		
   		sll $t6, $t1 ,0     # i*4
  		 
  		add $t6, $s1, $t6   # $t6 = address a[i]
		lb $s5, 0($t6)       # $s5 = a[i]
   		
   		
   		sll $t8, $t3 ,0     # i*4
   		
   		la $a0, tempChar       # load address of temporary array (neccasary if using $a0 for print statements)
   		add $t8, $a0, $t8   # $t8 = address c[k]
   		sb $s5, 0($t8)       # c[k] = a[i]
   		addi $t3, $t3, 1       # k++
   		addi $t1, $t1, 1       # i++
   		j   while2_char 

	while3_char :

   		slt $t5, $s2, $t2       # high < j (j>=high)
   		bne $t5, $zero, start_char   # go to for loop if j >= high
   		
   		
   		sll $t7, $t2,0       # i*4
   		
   		add $t7, $s1, $t7   # $t7 = address a[j]
   		lb $s6, 0($t7)       # $s6 = a[j]
   		
   		
   		sll $t8, $t3,0       # i*4
   		
   		la $a0, tempChar       # load address of temporary array (neccasary if using $a0 for print statements)
   		add $t8, $a0, $t8   # $t8 = address c[k]
   		sb $s6, 0($t8)       # c[k] = a[j]
   		addi $t3, $t3, 1       # k++
   		addi $t2, $t2, 1       # j++
   		j   while3_char

	start_char:

   		or $t1, $zero, $s3   # i <- low

	forloop_char:

   		slt $t5, $t1, $t3       # i < k
   		beq $t5, $zero, DONE_char   # branch if merging is complete
  		 
  		 
  		
  		 sll $t6, $t1, 0       # i*4
  		 
  		 
  		add $t6, $s1, $t6   # $t6 = address a[i]
  		 sll $t8, $t1, 0      # i*4
  		 la $a0, tempChar       # load address of temporary array (neccasary if using $a0 for print statements)
  		 add $t8, $a0, $t8       # $t8 = address c[i]
  		 lb $s7, 0($t8)       # $s7 = c[i]
  		 sb $s7, 0($t6)       # a[i]
  		 addi $t1, $t1, 1       # i++
  		 j   forloop_char
		

