# JupiterTest
1.What other possible scenario’s would you suggest for testing the Jupiter Toys application? 

  Scenerio1 - Login Credentials
  
     1.a - Validate if the user can login using valid credentials
     1.b - Validate if the user will not be able to login using invalid credentials
     1.c - Validate if the system will prompt an error if the user click login button with password field = blank
     1.d - Validate if the system will prompt an error if the user click login button with username field = blank
     1.e - Validate if the password field accepts special characters and alphanumeric characters
     
   Scenario2 - Checkout 
     2.a - Validate that the user can checkout items without loggin in
     2.b - Validate that the user can checkout items after loggin in
     
   Scenario3 - Payment Validation
     3.a - Validate that payment is successful after using valid credit cards
     3.b - Validate that the payment is not accepted when using invalid credit card
     
   Scenario4 - Computation
     4.a - Validate that price is computed correctly after changing the item quantity
     4.b - Validate that subtotal is computed correctly after removing item from the cart
     
2.Jupiter Toys is expected to grow and expand its offering into books, tech, and modern art. We are expecting the of tests will grow to a very large number. 

  1.What approaches could you used to reduce overall execution time? 
  
    Categorized the test cases based on its module and priority. If the changes from the development are minimal, we can run regression scripts with only priority 1 and 2 to check if there are modules, functionalities affected.
    
  2.How will your framework cater for this?
  
    I will separate test cases between modules and add tagging every test cases with priorities. For example I just want to run priorite 1 and 2, I can add on my Execute setup to exclude priority 3 and 4.
    
3.Describe when to use a BDD approach to automation and when NOT to use BDD

   If the project is not yet starting, deciding if the team will use BDD needs also to take into consideration:
   
       - how long is the estimated end of project (BDD is good on maintaining several iterations)
       - budget 
       - the ability of the team to adopt designing BDD approach
       
   If the project is in the midst of development and the team plans to adopt BDD aproach from their existing framework, the team should be prepared to consider the amount of time and effort on redisignin test scripts.
   
   Non-functional test cases are not applicable for BDD approach. Short term projects can use TDD or other approach instead of using BDD, as it will just eat the time planned for the project for designing the BDD framework.
