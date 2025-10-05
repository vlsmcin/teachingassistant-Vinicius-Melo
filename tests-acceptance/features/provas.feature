Feature: As a professor
         I want to edit existing exams and adjust the difficulty level of specific questions
         So that I can ensure the final assessment is aligned with the class's learning curve, resulting in a fair and accurate evaluation

Scenario: Increasing the difficulty of questions in a pre-existing exam
Given I am logged in as a Professor
And the exam "Final Assessment - Module 3" exists with 5 questions
And Question 3 is currently set to "Medium" Difficulty
When I access the edit screen for the "Final Assessment - Module 3" exam
And I change the Difficulty Level of Question 3 to "Hard"
And I save the changes
Then Question 3 in the "Final Assessment - Module 3" exam should have "Hard" Difficulty
And the system should record the last modification date for the exam

Scenario: Adjusting difficulty of new questions and verifying score impact
Given I am logged in as a Professor
And I am editing the exam "Practice Test 1 - Basic Concepts"
And the exam has a current total score of 50 points
When I add a new question
And I set the Difficulty Level of the new question to "Easy"
And I set the score for the new question to 5 points
And I add a second new question
And I set the Difficulty Level of the second new question to "Hard"
And I set the score for the second new question to 15 points
Then the new Total Score of the exam should be 70 points
And the exam should be ready to be distributed with mixed difficulty levels

Scenario: Attempting to assign an invalid difficulty level
Given I am logged in as a Professor
And I am editing the exam "Final Assessment - Module 3"
And Question 3 is currently set to "Medium" Difficulty
When I try to change the Difficulty Level of Question 3 to "Very Hard" (an invalid option)
And I click "Save"
Then the system should display an error message "Invalid difficulty level selected. Please choose from: Easy, Medium, Hard."
And the Difficulty Level of Question 3 should remain "Medium"
And the changes should not be saved to the exam history

Scenario: Attempting to edit an exam that is currently in progress
Given I am logged in as a Professor
And the exam "Midterm Review" is currently "In Progress" by at least one student
And Question 2 is set to "Medium" Difficulty
When I access the edit screen for the "Midterm Review" exam
And I attempt to change the Difficulty Level of Question 2 to "Easy"
Then the system should block the editing of questions and display a warning message
And the warning message should be "Cannot modify questions or difficulty: The exam is currently in progress."
And Question 2 should retain its "Medium" Difficulty setting