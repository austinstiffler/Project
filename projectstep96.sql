--Name: Austin Stiffler
--File: projectstep06.sql
--Date: 21 February, 2021

use fitTracker;

drop table if exists dbo.users;
go
create table dbo.users
(
userId int,
userName varchar(50)
constraint users_PK primary key(userId)
);
go

update dbo.users set userName = 'Austin' where userid = '1';

drop table if exists dbo.workoutPlan;
go
create table dbo.workoutPlan
(
workoutPlanId int,
planName varchar(50),
nutritionPlanId int,
userId int,
constraint workoutPlan_PK primary key(workoutPlanId)
);
go
alter table workoutPlan add foreign key (userID) references users (userid);
	
update dbo.workoutPlan set planName = 'hypertrophy', userid = '1' where workoutplanid = 1;

drop table if exists dbo.exercisePlan;
go
create table dbo.exercisePlan
(
exercisePlanId int,
planName varchar(50),
workoutPlanId int,
constraint exercisePlan_PK primary key(exercisePlanId)
);
go
alter table exerciseplan add foreign key (workoutplanid) references workoutplan (workoutplanid);

update dbo.exerciseplan set planname = 'gainz', workoutplanid = '1' where exerciseplanid = '1';

drop table if exists dbo.workoutDay;
go
create table dbo.workoutDay
(
workoutDayId int,
daysName varchar(50),
daysDate date,
exerciseplanid int,
constraint workoutDay_PK primary key(workoutDayId)
);
go
alter table workoutday add foreign key (exerciseplanid) references exerciseplan (exerciseplanid);

update dbo.workoutday set daysname = 'chest', daysDate = '2021-02-22', exerciseplanid = '1' where workoutdayid = '1';

drop table if exists dbo.workout;
go
create table dbo.workout
(
workoutId int,
workoutName varchar(50),
setNumber int,
repNumber int,
repTime int,
workoutdayid int,
constraint workout_PK primary key(workoutId)
);
go
alter table workout add foreign key (workoutdayid) references workoutday (workoutdayid);

update dbo.workout set workoutname = 'benchPress', setNumber = '4', repNumber = '8' where workoutid = '1';

drop table if exists dbo.nutritionPlan;
go
create table dbo.nutritionPlan
(
nutritionPlanId int,
planName varchar(50),
workoutplanid int,
constraint nutritionPlan_PK primary key(nutritionPlanId)
);
go
alter table nutritionplan add foreign key (workoutplanid) references workoutplan (workoutplanid);

update dbo.nutritionPlan set planName = 'bulk' where nutritionPlanid = '1';

drop table if exists dbo.nutritionDay;
go
create table dbo.nutritionDay
(
nutritionDayId int,
daysName varchar(50),
daysDate date,
nutritionplanid int,
constraint nutritionDay_PK primary key(nutritionDayId)
);
go
alter table nutritionday add foreign key (nutritionplanid) references nutritionplan (nutritionplanid);

update dbo.nutritionDay set daysName = 'monday', daysDate = '2020-02-22' where nutritionDayid = '1';

drop table if exists dbo.meals;
go
create table dbo.meals
(
mealId int,
mealName varchar(50),
nutritiondayid int,
constraint meals_PK primary key(mealId)
);
go
alter table meals add foreign key (nutritiondayid) references nutritionday (nutritiondayid);

update dbo.meals set mealName = 'breakfast' where mealid = '1';

drop table if exists dbo.food;
go
create table dbo.food
(
foodId int,
foodName varchar(50),
calories int,
carbs int,
proteins int,
fats int,
mealid int,
constraint food_PK primary key(foodId)
);
go
alter table food add foreign key (mealid) references meals (mealid);

update dbo.food set foodName = 'eggs' where foodid = '1';

select u.username, wp.planname
from users u
	join workoutPlan wp
		on u.userid = wp.userId;

select f.foodname, m.mealname
from food f
	join meals m
		on f.mealid = m.mealid;