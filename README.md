# README
Please describe your process for approaching the code challenge. What kind of planning did you do? Did your plans change as you began coding?
At first,
1.	I thought to use Devise for User and Login Authentication
2.	CanCanCan gem for User Role, I want to get Admin and User role. Admin will be responsible for User Management and Report.
3.	I used Rails 6, Webpacker
Then in the middle of coding, although devise, cancancan are all working well, I found the problem. I cannot work datepicker to show up. I try different means to solve it. I am still fairly new to rails 6 and webpacker so it gives me lots of headache. So I step down to Rails 5. I use a lot of time in building all three devise, cancancan and Rails 6, I just keep it simple when I back down to Rails 5.

Right now, 
1. I have two roles; <b>Admin and User</b>. 
2. Admin can do User Management and see Report. And also can do clockin/out. User can only do clockin/out. 
3. I make it a little beautiful with some <b>Design theme from HiMaMa</b>. 
4. I use <b>acts_as_paranoid gem</b> for logical delete. I want to keep track of history so I choose to soft delete. 
5. I use <b>ransack</b> for search. I definitely would like to search with username and email but unfortunately not included this time. 
6. I use <b>kaminari gem</b> for pagination.

Describe the schema design you chose. Why did you choose this design? What other alternatives did you consider?

I choose to have <b>User(One) and ClockEvent(Many)</b> relationship. In order to keep track of clockevent from user and vise vasa to know user info from clockevent. I also want to have another relation like Role to help the authentication process but in order to keep it simple, I just choose to have a <b>flag for role</b>. At first, I have superadminrole or userrole for cancancan gem, I remove it after I change the design. 

 If you were given another day to work on this, how would you spend it? What if you were given a month?
1. I definitely want to <b>add more test cases</b>. I don’t have much time to add more test cases so if I have one more day, I would make it more emphasize. 
2. If I have a month, I will make to work with <b>Rails 6, webpacker, devise and cancancan gem</b>. I definitely would like to add <b>better authentication</b>. 
3. I also want to add more <b>search criteria in Report</b> part. For admin, it would be nice to have a <b>good tracker</b> to know everyone’s clockevent. 
4. I want to modify database schema by <b>adding index to fetch data faster</b>, some required column to use in the future <b>for history</b> purpose, and some more. 
5. I want to <b>add security to website</b> too. It is still so weak right now. 
6. And I want to add <b>Cache</b> in order to <b>save memory and faster performance</b>. 
7. I would like to <b>handle more for the session</b>. 
8. I need to add <b>Rack Attack gem</b> for <b>blocking and throttling abusive requests</b>. 
These are what I can think of right now. It may have more if I have a month to develop it.
