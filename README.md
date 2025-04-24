# CENG311 - Computer Architecture  
## Programming Assignment #2  

In this homework assignment, you will implement **Queue of recipes** with **MIPS assembly language**.

The queue is a simple linked list, with each node’s data pointing to a recipe. You are expected to modify the source code provided with this homework.

- You are expected to fill given subroutines with the usages at the **Subroutine Usages** table.
- In the `main` subroutine, you should call the other subroutines according to expected operations (Please read each operation carefully!):

---

### Operations to Implement

- **Initialize the Recipe List**  
  Create a linked list (queue) to store recipes and store its address.

- **Create and Add Pancakes Recipe**  
  - Create an array with 5 elements for ingredients:  
    Flour, Milk, Eggs, Sugar, Baking Powder  
  - Create the Pancakes recipe using the ingredients array.  
  - Enqueue the Pancakes recipe into the linked list.

- **Create and Add Spaghetti Bolognese Recipe**  
  - Create an array with 5 elements for ingredients:  
    Spaghetti, Ground Beef, Tomato Sauce, Onion, Garlic  
  - Create the recipe and enqueue it.

- **Print Queue Size**

- **Print Current Recipes in the List**  
  Traverse and print all recipes.

- **Dequeue and Print the First Recipe**  
  Dequeue Pancakes and print its details.

- **Print Queue Size**

- **Print Remaining Recipes**

- **Dequeue and Print the Next Recipe**  
  Dequeue Spaghetti Bolognese and print its details.

- **Dequeue and Print the Next Recipe**  
  Should indicate no recipe to print (empty list).

- **Print Queue Size**

- **Print Remaining Recipes in the List (Empty)**

- **Create and Add Chicken Stir-Fry Recipe**  
  - Ingredients: Chicken, Bell Peppers, Soy Sauce, Ginger, Garlic

- **Print Current Recipes**

- **Create and Add Caesar Salad Recipe**  
  - Ingredients: Romaine Lettuce, Croutons, Caesar Dressing, Parmesan Cheese  
  - Add Chicken Breast (should give warning due to array size 4)

- **Print Queue Size**  
- **Print Current Recipes**

- **Create and Add Chocolate Chip Cookies Recipe**  
  - Ingredients: Butter, Sugar, Eggs, Flour, Chocolate Chips

- **Print Queue Size**  
- **Print Current Recipes**

- **Search for Recipes by Name**  
  Use `findRecipe`, print matched or not matched.

---

### Implementation Notes

- Use `traverse` subroutines to iterate through arrays or lists.
- Generic subroutines must only handle generic logic (e.g., linked list only). No recipe logic inside them.
- All needed variables are already declared. Do not define new ones.
- Structures of the array, linked list, and recipe are given.
- Use naming like:
  - `r#` for recipes (e.g., `r1`)
  - `r#i#` for ingredients (e.g., `r1i2`)
  - `r#c`, `r#d`, `r#r` for cooking time, difficulty, rating
- `search1` and `search2` are the recipe names to search.
- Do not attempt to free memory (not applicable in MIPS).
- **All subroutines must be implemented.**
- Homework will be evaluated in **QtSpim MIPS simulator**.


---

### Data Structures

#### Array  
- 4 Bytes – Address of the Data  
- 4 Bytes – Array Size (Max Element Count)  
- 4 Bytes – Element Size  

#### Linked List  
- 4 Bytes – Address of the First Node  
- 4 Bytes – Size  

#### Linked List Node  
- 4 Bytes – Address of the Data  
- 4 Bytes – Address of the Next Node  

#### Recipe  
- 4 Bytes – Address of the Name  
- 4 Bytes – Address of Ingredients Array  
- 4 Bytes – Cooking Time  
- 4 Bytes – Difficulty  
- 4 Bytes – Rating  

---

### Subroutine Usages

| Subroutine Name        | $a0                         | $a1                         | $a2                     | $a3 / $sp      | Return ($v0)                      |
|------------------------|-----------------------------|-----------------------------|-------------------------|----------------|-----------------------------------|
| `createArray`          | Size of the array           | Element size (bytes)        | -                       | -              | Address of the array              |
| `putElementToArray`    | Address of the array        | Index                       | Address of element      | -              | -                                 |
| `createLinkedList`     | -                           | -                           | -                       | -              | Address of the linked list        |
| `enqueue`              | Address of the linked list  | Address of the element      | -                       | -              | -                                 |
| `dequeue`              | Address of the linked list  | -                           | -                       | -              | Head node address, or 0 if empty  |
| `queueSize`            | Address of the linked list  | -                           | -                       | -              | -                                 |
| `traverseArray`        | Address of the array        | Function (printIngredient)  | -                       | -              | -                                 |
| `traverseLinkedList`   | Address of the linked list  | Function (find/printRecipe) | Extra argument (string) | -              | -                                 |
| `compareString`        | First string address        | Second string address       | -                       | -              | 0 for match, 1 for not matched    |
| `createRecipe`         | Name address                | Ingredients array address   | Cooking time            | Difficulty     | Address of recipe                 |
|                        |                             |                             |                         | Rating (on $sp)|                                   |
| `findRecipe`           | Address of recipe           | Searched name               | -                       | -              | -                                 |
| `printRecipe`          | Address of recipe           | -                           | -                       | -              | -                                 |
| `printIngredient`      | Address of ingredient       | -                           | -                       | -              | -                                 |

---

### Expected Output (Partial)

```
Recipe added.  
Recipe added.  
List Size: 2  

List:  
------------------------------------------------------------------  
Recipe name: Pancakes  
Ingredients:  
Flour  
Milk  
Eggs  
Sugar  
Baking powder  
Cooking time: 15  
Difficulty: 2  
Rating: 4  

Recipe name: Spaghetti Bolognese  
Ingredients:  
Spaghetti  
Ground beef  
Tomato sauce  
Garlic  
Onion  
Cooking time: 30  
Difficulty: 3  
Rating: 5  
------------------------------------------------------------------  

Recipe removed.  
Recipe name: Pancakes  
...  
List Size: 1  
List:  
...  

Recipe removed.  
Recipe name: Spaghetti Bolognese  
...  

List is empty!  
Recipe removed.  
No recipe to print!  

List Size: 0  
List:  
------------------------------------------------------------------  
List is empty!  
------------------------------------------------------------------  

Recipe added.  
List Size: 1  
List:  
...

Index out of bounds!  
Recipe added.  
...

Recipe not matched!  
Recipe matched!  
Recipe not matched!  
...
```
