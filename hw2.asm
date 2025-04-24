##############################################################
#Array
##############################################################
#   4 Bytes - Address of the Data
#   4 Bytes - Size of array
#   4 Bytes - Size of elements
##############################################################

##############################################################
#Linked List
##############################################################
#   4 Bytes - Address of the First Node
#   4 Bytes - Size of linked list
##############################################################

##############################################################
#Linked List Node
##############################################################
#   4 Bytes - Address of the Data
#   4 Bytes - Address of the Next Node
##############################################################

##############################################################
#Recipe
##############################################################
#   4 Bytes - Name (address of the name)
#	4 Bytes - Ingredients (address of the ingredients array)
#   4 Bytes - Cooking Time
#	4 Bytes - Difficulty
#	4 Bytes - Rating
##############################################################


.data
space: .asciiz " "
newLine: .asciiz "\n"
tab: .asciiz "\t"
lines: .asciiz "------------------------------------------------------------------\n"

listStr: .asciiz "List: \n"
recipeName: .asciiz "Recipe name: "
ingredients: .asciiz "Ingredients: "
cookingTime: .asciiz "Cooking time: "
difficulty: .asciiz "Difficulty: "
rating: .asciiz "Rating: "
listSize: .asciiz "List Size: "
emptyListWarning: .asciiz "List is empty!\n"
indexBoundWarning: .asciiz "Index out of bounds!\n"
recipeNotMatch: .asciiz "Recipe not matched!\n"
recipeMatch: .asciiz "Recipe matched!\n"
recipeAdded: .asciiz "Recipe added.\n"
recipeRemoved: .asciiz "Recipe removed.\n"
noRecipeWarning: .asciiz "No recipe to print!\n"

addressOfRecipeList: .word 0 #the address of the array of recipe list stored here!


# Recipe 1: Pancakes
r1: .asciiz "Pancakes"
r1i1: .asciiz "Flour"
r1i2: .asciiz "Milk"
r1i3: .asciiz "Eggs"
r1i4: .asciiz "Sugar"
r1i5: .asciiz "Baking powder"
r1c: .word 15							# Cooking time in minutes
r1d: .word 2							# Difficulty (scale 1-5)
r1r: .word 4							# Rating (scale 1-5)

# Recipe 2: Spaghetti Bolognese
r2: .asciiz "Spaghetti Bolognese"
r2i1: .asciiz "Spaghetti"
r2i2: .asciiz "Ground beef"
r2i3: .asciiz "Tomato sauce"
r2i4: .asciiz "Garlic"
r2i5: .asciiz "Onion"
r2c: .word 30
r2d: .word 3
r2r: .word 5

# Recipe 3: Chicken Stir-Fry
r3: .asciiz "Chicken Stir-Fry"
r3i1: .asciiz "Chicken breast"
r3i2: .asciiz "Soy sauce"
r3i3: .asciiz "Bell peppers"
r3i4: .asciiz "Broccoli"
r3i5: .asciiz "Garlic"
r3c: .word 20
r3d: .word 3
r3r: .word 4

# Recipe 4: Caesar Salad
r4: .asciiz "Caesar Salad"
r4i1: .asciiz "Romaine lettuce"
r4i2: .asciiz "Caesar dressing"
r4i3: .asciiz "Parmesan cheese"
r4i4: .asciiz "Croutons"
r4i5: .asciiz "Chicken breast (optional)"
r4c: .word 10
r4d: .word 1
r4r: .word 4

# Recipe 5: Chocolate Chip Cookies
r5: .asciiz "Chocolate Chip Cookies"
r5i1: .asciiz "Butter"
r5i2: .asciiz "Sugar"
r5i3: .asciiz "Flour"
r5i4: .asciiz "Eggs"
r5i5: .asciiz "Chocolate chips"
r5c: .word 25
r5d: .word 2
r5r: .word 5


search1: .asciiz "Caesar Salad"
search2: .asciiz "Shepherd's Pie"

.text 
main:
	# Write your instructions here!
	
    	# Step 1: Initialize the Recipe List (Create Linked List)
    	jal createLinkedList
    	la $t5, addressOfRecipeList
    	sw $v0, 0($t5)

    	# Step 2: Create an Array for Ingredients (Pancakes)
    	li $a0, 5
    	li $a1, 4
    	jal createArray
    	move $t6, $v0

    	# Step 3: Add Ingredients to the Array

    	move $a0, $t6
    	la $a1, r1i1
    	li $a2, 0
    	jal putElementToArray

    	move $a0, $t6
    	la $a1, r1i2
    	li $a2, 1
    	jal putElementToArray

    	move $a0, $t6
    	la $a1, r1i3
    	li $a2, 2
    	jal putElementToArray

    	move $a0, $t6
    	la $a1, r1i4
    	li $a2, 3
    	jal putElementToArray

    	move $a0, $t6
    	la $a1, r1i5
    	li $a2, 4
    	jal putElementToArray

    	la $a0, r1
    	move $a1, $t6
    	lw $a2, r1c
    	lw $a3, r1d
    	lw $t7, r1r
    	sw $t7, 0($sp)
    	jal createRecipe
    	move $t8, $v0

    	lw $a0, addressOfRecipeList
    	move $a1, $t8
    	jal enqueue

    	la $a0, recipeAdded
    	li $v0, 4
    	syscall

    	# Step 4: Create an Array for Ingredients (Spaghetti Bolognese)
    	li $a0, 5
    	li $a1, 4
    	jal createArray
    	move $t6, $v0

    	# Step 5: Add Ingredients to the Array for Spaghetti Bolognese

    	move $a0, $t6
    	la $a1, r2i1
    	li $a2, 0
    	jal putElementToArray

    	move $a0, $t6
    	la $a1, r2i2
    	li $a2, 1
    	jal putElementToArray

    	move $a0, $t6
    	la $a1, r2i3
    	li $a2, 2
    	jal putElementToArray

    	move $a0, $t6
    	la $a1, r2i4
    	li $a2, 3
    	jal putElementToArray

    	move $a0, $t6
    	la $a1, r2i5
    	li $a2, 4
    	jal putElementToArray

    	la $a0, r2
	move $a1, $t6
    	lw $a2, r2c
    	lw $a3, r2d
    	lw $t7, r2r
    	sw $t7, 0($sp)
    	jal createRecipe
    	move $t9, $v0

   	lw $a0, addressOfRecipeList
    	move $a1, $t9
    	jal enqueue

    	la $a0, recipeAdded
    	li $v0, 4
    	syscall

    	# Step 6: Print Queue Size
    	lw $a0, addressOfRecipeList
    	jal queueSize
    	move $t1, $v0
    	la $a0, listSize
    	li $v0, 4
    	syscall
    	move $a0, $t1
    	li $v0, 1
    	syscall

    	la $a0, newLine
    	li $v0, 4
    	syscall

    	la $a0, listStr
    	li $v0, 4
    	syscall

    	la $a0, lines
    	li $v0, 4
    	syscall

    	lw $a0, addressOfRecipeList
    	la $a1, printRecipe
    	jal traverseLinkedList

    	la $a0, lines
    	li $v0, 4
    	syscall

    	la $a0, newLine
    	li $v0, 4
    	syscall

    	# Step 7: Dequeue and Print the First Recipe
    	lw $a0, addressOfRecipeList       
    	jal dequeue                       
    	move $t9, $v0                
    
        la $a0, recipeRemoved
    	li $v0, 4
    	syscall

    	bnez $t9, printDequeuedRecipe   
    	la $a0, noRecipeWarning           
    	li $v0, 4
    	syscall
    	j afterFirstDequeue

	printDequeuedRecipe:
    	move $a0, $t9
    	jal printRecipe

	afterFirstDequeue:
    	lw $a0, addressOfRecipeList
    	jal queueSize
    	move $t1, $v0
    	la $a0, listSize
    	li $v0, 4
    	syscall
    	move $a0, $t1
    	li $v0, 1
    	syscall

    	la $a0, newLine
    	li $v0, 4
    	syscall

    	la $a0, listStr
    	li $v0, 4
    	syscall

    	la $a0, lines
    	li $v0, 4
    	syscall

    	lw $a0, addressOfRecipeList
    	la $a1, printRecipe
    	jal traverseLinkedList

    	la $a0, lines
    	li $v0, 4
    	syscall

    	la $a0, newLine
    	li $v0, 4
    	syscall

    	# Step 8: Dequeue and Print the Next Recipe
    	lw $a0, addressOfRecipeList
    	jal dequeue
    	move $t9, $v0
    
        la $a0, recipeRemoved
    	li $v0, 4
    	syscall

    	bnez $t9, printDequeuedRecipeNext
    	la $a0, noRecipeWarning
    	li $v0, 4
    	syscall
    	j afterSecondDequeue

	printDequeuedRecipeNext:
    	move $a0, $t9
    	jal printRecipe

	afterSecondDequeue:

    	# Step 9: Dequeue and Print the Next Recipe (List is empty)
    	lw $a0, addressOfRecipeList
    	jal dequeue
    	move $t9, $v0

    	bnez $t9, printDequeuedRecipeEmpty
    	la $a0, noRecipeWarning
    	li $v0, 4
    	syscall
    	j afterThirdDequeue

	printDequeuedRecipeEmpty:
    	move $a0, $t9
    	jal printRecipe

	afterThirdDequeue:
    	lw $a0, addressOfRecipeList
    	jal queueSize
    	move $t1, $v0
    	la $a0, listSize
    	li $v0, 4
    	syscall
    	move $a0, $t1
    	li $v0, 1
    	syscall

    	la $a0, newLine
    	li $v0, 4
    	syscall

    	la $a0, listStr
    	li $v0, 4
    	syscall

    	la $a0, lines
    	li $v0, 4
    	syscall

    	lw $a0, addressOfRecipeList
    	la $a1, printRecipe
	jal traverseLinkedList

    	la $a0, lines
    	li $v0, 4
    	syscall

    	la $a0, newLine
    	li $v0, 4
    	syscall

	# Step 9: Create and Add Chicken Stir-Fry Recipe
	li $a0, 5              
	li $a1, 4                         
	jal createArray                   
	move $t6, $v0                    
	move $a0, $t6
	la $a1, r3i1                      
	li $a2, 0
	jal putElementToArray

	move $a0, $t6
	la $a1, r3i2                      
	li $a2, 1
	jal putElementToArray

	move $a0, $t6
	la $a1, r3i3                      
	li $a2, 2
	jal putElementToArray


	move $a0, $t6
	la $a1, r3i4                     
	li $a2, 3
	jal putElementToArray


	move $a0, $t6
	la $a1, r3i5                      
	li $a2, 4
	jal putElementToArray

	la $a0, r3                    
	move $a1, $t6                  
	lw $a2, r3c                    
	lw $a3, r3d                   
	lw $t7, r3r                     
	sw $t7, 0($sp)                    
	jal createRecipe
	move $t9, $v0                     

	lw $a0, addressOfRecipeList
	move $a1, $t9
	jal enqueue

	la $a0, recipeAdded
	li $v0, 4
	syscall

	la $a0, listStr
	li $v0, 4
	syscall

	la $a0, lines
	li $v0, 4
	syscall

	lw $a0, addressOfRecipeList
	la $a1, printRecipe
	jal traverseLinkedList

	la $a0, lines
	li $v0, 4
	syscall

	la $a0, newLine
	li $v0, 4
	syscall

	# Step 10: Create and Add Caesar Salad Recipe
	li $a0, 4
	li $a1, 4
	jal createArray
	move $t6, $v0

	move $a0, $t6
	la $a1, r4i1
	li $a2, 0
	jal putElementToArray

	move $a0, $t6
	la $a1, r4i2
	li $a2, 1
	jal putElementToArray

	move $a0, $t6
	la $a1, r4i3
	li $a2, 2
	jal putElementToArray

	move $a0, $t6
	la $a1, r4i4
	li $a2, 3
	jal putElementToArray

	move $a0, $t6
	la $a1, r4i5
	li $a2, 4
	jal putElementToArray

	la $a0, r4
	move $a1, $t6
	lw $a2, r4c
	lw $a3, r4d
	lw $t7, r4r
	sw $t7, 0($sp)
	jal createRecipe
	move $t9, $v0

	lw $a0, addressOfRecipeList
	move $a1, $t9
	jal enqueue

	la $a0, recipeAdded
	li $v0, 4
	syscall

	lw $a0, addressOfRecipeList
	jal queueSize
	move $t1, $v0
	la $a0, listSize
	li $v0, 4
	syscall
	move $a0, $t1
	li $v0, 1
	syscall

	la $a0, newLine
	li $v0, 4
	syscall

	la $a0, listStr
	li $v0, 4
	syscall

	la $a0, lines
	li $v0, 4
	syscall

	lw $a0, addressOfRecipeList
	la $a1, printRecipe
	jal traverseLinkedList

	la $a0, lines
	li $v0, 4
	syscall

	la $a0, newLine
	li $v0, 4
	syscall


	# Step 10: Create and Add Chocolate Chip Cookies Recipe
	li $a0, 5
	li $a1, 4
	jal createArray
	
	move $t6, $v0
	move $a0, $t6
	la $a1, r5i1
	li $a2, 0
	jal putElementToArray
	
	move $a0, $t6
	la $a1, r5i2
	li $a2, 1
	jal putElementToArray
	
	move $a0, $t6
	la $a1, r5i3
	li $a2, 2
	jal putElementToArray
	
	move $a0, $t6
	la $a1, r5i4
	li $a2, 3
	jal putElementToArray
	
	move $a0, $t6
	la $a1, r5i5
	li $a2, 4
	jal putElementToArray
	
	la $a0, r5
	move $a1, $t6
	lw $a2, r5c
	lw $a3, r5d
	lw $t7, r5r
	sw $t7, 0($sp)
	jal createRecipe
	
	move $t9, $v0
	lw $a0, addressOfRecipeList
	
	move $a1, $t9
	jal enqueue
	la $a0, recipeAdded
	
	li $v0, 4
	syscall
	lw $a0, addressOfRecipeList
	
	jal queueSize
	move $t1, $v0
	la $a0, listSize
	li $v0, 4
	syscall
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	la $a0, newLine
	li $v0, 4
	syscall
	
	la $a0, listStr
	li $v0, 4
	syscall
	
	la $a0, lines
	li $v0, 4
	syscall
	
	lw $a0, addressOfRecipeList
	la $a1, printRecipe
	jal traverseLinkedList
	
	la $a0, lines
	li $v0, 4
	syscall
	
	la $a0, newLine
	li $v0, 4
	syscall

	# Step 11: Search for Recipes by Name
    	la $a0, addressOfRecipeList      
    	la $a1, search1                 
    	jal findRecipe                  

    	la $a0, newLine
    	li $v0, 4
    	syscall

    	la $a0, addressOfRecipeList      
    	la $a1, search2                
    	jal findRecipe                  

    	la $a0, newLine
    	li $v0, 4
    	syscall	
	
mainTerminate:
	li $v0, 10
	syscall


createArray:
	# Create an array
	# Inputs: $a0 - max number of elements (size), $a1 - size of elements
	# Outputs: $v0 - address of array
	
	# Write your instructions here!
	
    	move $t0, $a0
    	move $t2, $a1

    	li $v0, 9
    	li $a0, 12
    	syscall

    	move $t1, $v0
    	sw $t0, 4($t1)
    	sw $t2, 8($t1)

    	mul $t0, $t0, $t2
    	li $v0, 9
    	move $a0, $t0
    	syscall

    	sw $v0, 0($t1)

    	move $v0, $t1
    	jr $ra

putElementToArray:
	# Store an element (recipe) in an array.
	# Inputs: $a0 - address of array, $a1 - element address, $a2 - index
	
	# Write your instructions here!
	
    	lw $t1, 4($a0)
    	bge $a2, $t1, indexOutOfBounds

    	lw $t2, 0($a0)
    	lw $t3, 8($a0)
    	mul $t4, $a2, $t3
    	add $t5, $t2, $t4
    	sw $a1, 0($t5)
    	jr $ra

	indexOutOfBounds:
    	la $a0, indexBoundWarning
    	li $v0, 4
    	syscall
    	jr $ra

createLinkedList:
	# Create a linked list.
	# Outputs: $v0 - address of linked List
	
	# Write your instructions here!
	
	li $v0, 9
	li $a0, 8
	syscall
	
	move $t0, $v0
	
	li $t1, 0
	sw $t1, 0($t0)
	sw $t1, 4($t0)
	move $v0, $t0
	
	jr $ra

enqueue:
	# Inputs: $a0 - address of the linked list structure, $a1 - address of data to add
	
	# Write your instructions here!
	
	addi $sp, $sp, -8
	sw $ra, 0($sp)

	move $t3, $a0
	move $t4, $a1

	lw $t5, 0($t3)
	beqz $t5, addFirstNode

	findLastNode:
	lw $t6, 4($t3)
	beqz $t6, addNewNode
	move $t3, $t6
	j findLastNode

	addFirstNode:
	sw $t4, 0($t3)
	sw $t3, 4($sp)
	jal createLinkedList
	lw $t3, 4($sp)
	sw $v0, 4($t3)
	j endEnqueue

	addNewNode:
	sw $t4, 0($t3)
	sw $t3, 4($sp)
	jal createLinkedList
	lw $t3, 4($sp)
	sw $v0, 4($t3)

	endEnqueue:
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra

dequeue:
	# Inputs: $a0 - address of the linked list structure
	# Outputs: $v0 - removed head node, 0 if empty
	
	# Write your instructions here!

	move $t0, $a0            

	lw $t1, 0($t0)            
	move $v0, $t1
	beqz $t1, removeHeadNode    

	lw $t2, 4($t0)		
	lw $t3, 0($t2)		
	lw $t4, 4($t2)		

	sw $t3, 0($t0)
	sw $t4, 4($t0)

	jr $ra

	removeHeadNode:
	li $v0, 0                 
	jr $ra

queueSize:
	# Inputs: $a0 - address of the linked list structure
	
	# Write your instructions here!
	
	move $t0, $a0
	li $t1, 0

	lw $t2, 0($t0)
	beqz $t2, exitQueueSize

	countNodes:
	lw $t0, 4($t0)
	beqz $t0, exitQueueSize
	addi $t1, $t1, 1
	j countNodes

	exitQueueSize:
	move $v0, $t1 
	jr $ra

traverseArray:
	# Traverse and print recipes from array.
	# Inputs: $a0 - address of array, $a1 - called function
	
	# Write your instructions here!
	
    	addi $sp, $sp, -4         
    	sw $ra, 0($sp)            

    	jal prepareTraversal    

    	jal traverse             

    	lw $ra, 0($sp)
    	addi $sp, $sp, 4          
    	jr $ra                    

	prepareTraversal:
    	lw $t0, 0($a0)            
    	lw $t1, 4($a0)            
    	li $t2, 0                 

    	jr $ra                    

	traverse:
    	bge $t2, $t1, traverseExit   
    	lw $a0, 0($t0)            
    	jalr $a1                  
    	addi $t0, $t0, 4         
    	addi $t2, $t2, 1          
    	j traverse                

	traverseExit:
	lw $ra, 0($sp)           
    	addi $sp, $sp, 4   
    	jr $ra   

traverseLinkedList:
	# Traverse linked list.
	# Inputs: $a0 - head node of linked list, $a1 - called function(findRecipe, printRecipe), $a2 - extra arguments(string for findRecipe)
	
	# Write your instructions here!
	
    	addi $sp, $sp, -24
    	sw $ra, 0($sp)
    	sw $t0, 4($sp)
    	sw $t1, 8($sp)
    	sw $a1, 12($sp)
    	sw $t2, 16($sp)
    	sw $t3, 20($sp)

    	move $t0, $a0
    	li $t2, 0

    	jal prepareListTraversal

    	jr $ra                    

	prepareListTraversal:
    	beqz $t0, traverseListExit
    	lw $t1, 0($t0)
    	beqz $t1, traverseListExit

    	move $a0, $t1
    	jalr $a1

    	lw $t3, 4($t0)
    	move $t0, $t3
    	addi $t2, $t2, 1

    	j prepareListTraversal

	traverseListExit:
    	lw $a1, 12($sp)
    	lw $t1, 8($sp)
    	lw $t0, 4($sp)
    	lw $ra, 0($sp)
    	addi $sp, $sp, 24
    	jr $ra

compareString:
	# Compare two strings.
	# Inputs: $a0 - string 1 address, $a1 - string 2 address
	# Outputs: $v0 - 0 found, 1 not found
	
	# Write your instructions here!
	
    	li $v0, 0              
    	compareStringLoop:
        lb $t0, 0($a0)     
        lb $t1, 0($a1)     
        beqz $t0, exitCompareString  
        bne $t0, $t1, notEqual  

        addi $a0, $a0, 1    
        addi $a1, $a1, 1    
        j compareStringLoop       

    	exitCompareString:
        lb $t1, 0($a1)      
        bnez $t1, notEqual   

    	jr $ra                  

    	notEqual:
        li $v0, 1           
        jr $ra        

createRecipe:
	# Create a recipe and store in the recipe struct.
	# Inputs: $a0 - recipe name, $a1 - address of ingredients array,
	#         $a2 - cooking time, $a3 - difficulty, 0($sp) - rating
	# Outputs: $v0 - recipe address
	
	# Write your instructions here!
	
    	move $t5, $a0

    	li $v0, 9
    	li $a0, 20
    	syscall
    	move $t0, $v0

    	move $t6, $a1
    	move $t7, $a2
    	move $t8, $a3

    	sw $t5, 0($t0)
    	sw $t6, 4($t0)
    	sw $t7, 8($t0)
    	sw $t8, 12($t0)

    	lw $t9, 0($sp)
    	sw $t9, 16($t0)

   	move $v0, $t0
    	jr $ra 

findRecipe:
	# Compare two recipe names.
	# Inputs: $a0 - recipe struct address, $a1 - searched recipe name
	
	# Write your instructions here!
	
	addi $sp, $sp, -16
    	sw $ra, 0($sp)
    	sw $s0, 4($sp)
    	sw $s1, 8($sp)
    	sw $s2, 12($sp)
    
    	move $s0, $a0
    	move $s1, $a1
    
    	lw $s2, 0($s0)
    
	search:
    	beqz $s2, searchEnd
    
    	lw $t1, 0($s2)
    	beqz $t1, searchEnd
    	
    	lw $a0, 0($t1)
    	move $a1, $s1
    	jal compareString
    
    	beqz $v0, searchSuccess
    
    	la $a0, recipeNotMatch
    	li $v0, 4
    	syscall
    	
    	j continueTraversing

	searchSuccess:
    	la $a0, recipeMatch
    	li $v0, 4
    	syscall
    
    	lw $a0, 0($s2)
    	jal printRecipe
    	
    	continueTraversing:
    	lw $s2, 4($s2)
    	bnez $s2, search

	searchEnd:
    	lw $s2, 12($sp)
    	lw $s1, 8($sp)
    	lw $s0, 4($sp)
    	lw $ra, 0($sp)
    	addi $sp, $sp, 16
    	jr $ra

printRecipe:
	# Print recipe details.
	# Inputs: $a0 - address of recipe struct
	
	# Write your instructions here!
	
    	addi $sp, $sp, -20
    	sw $ra, 0($sp)
    	sw $s0, 4($sp)
    	sw $t0, 8($sp)
    	sw $t1, 12($sp)
    	sw $a1, 16($sp)
    
    	move $s0, $a0

    	la $a0, recipeName
    	li $v0, 4
    	syscall

    	lw $t0, 0($s0)
    	move $a0, $t0
    	li $v0, 4
    	syscall

    	la $a0, newLine
    	li $v0, 4
    	syscall
    
    	la $a0, ingredients
    	li $v0, 4
    	syscall
    
    	la $a0, newLine
    	li $v0, 4
    	syscall

    	lw $t1, 4($s0)
    	move $a0, $t1

    	lw $t0, 4($s0)
    	move $a0, $t0
    	la $a1, printIngredient
    	jal traverseArray

    	la $a0, cookingTime
    	li $v0, 4
    	syscall
    
    	lw $t2, 8($s0)
    	move $a0, $t2
    	li $v0, 1
    	syscall

    	la $a0, newLine
    	li $v0, 4
    	syscall
    
    	la $a0, difficulty
    	li $v0, 4
    	syscall

    	lw $t3, 12($s0)
    	move $a0, $t3
    	li $v0, 1
    	syscall

    	la $a0, newLine
    	li $v0, 4
    	syscall
    
    	la $a0, rating
    	li $v0, 4
    	syscall

    	lw $t4, 16($s0)
    	move $a0, $t4
    	li $v0, 1
    	syscall

    	la $a0, newLine
    	li $v0, 4
    	syscall
    
    	lw $a1, 16($sp)
    	lw $t1, 12($sp)
    	lw $t0, 8($sp)
    	lw $s0, 4($sp)
    	lw $ra, 0($sp)
    	addi $sp, $sp, 20

    	jr $ra

printIngredient:
	# Print ingredient.
	# Inputs: $a0 - address of ingredient
	
	# Write your instructions here!
	
	move $t3, $a0
	
	la $t4, tab                
	
	li $v0, 4                  
	la $a0, tab
	syscall
	
	li $v0, 4                  
	move $a0, $t3              
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	jr $ra
	
	