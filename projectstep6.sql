--Name: Austin Stiffler
--File: projectstep6.sql
--Date: 19 February, 2021

use FitnessTracker;

drop table if exists dbo.users;
go
create table dbo.users
(
userId int,
userName varchar(50)
constraint users_PK primary key(userId)
);
go

drop table if exists dbo.workoutPlan;
go
create table dbo.workoutPlan
(
workoutPlanId int,
planName varchar(50),
nutritionPlanId int,
userId int,
ExercisePlanID int,
constraint workoutPlan_PK primary key(workoutPlanId)
);
go
alter table workoutPlan add foreign key (userID) references users (userid);
alter table workoutPlan add foreign key (nutritionplanid) references nutritionplan (nutritionplanid);
alter table workoutPlan add foreign key (exerciseplanid) references exerciseplan (exerciseplanid);

	
drop table if exists dbo.exercisePlan;
go
create table dbo.exercisePlan
(
exercisePlanId int,
planName varchar(50),
workoutDayId int,
constraint exercisePlan_PK primary key(exercisePlanId)
);
go
alter table exerciseplan add foreign key (workoutdayid) references workoutday (workoutdayid);


drop table if exists dbo.workoutDay;
go
create table dbo.workoutDay
(
workoutDayId int,
daysName varchar(50),
daysDate date,
workoutId int,
constraint workoutDay_PK primary key(workoutDayId)
);
go
alter table workoutday add foreign key (workoutid) references workout (workoutid);

drop table if exists dbo.workout;
go
create table dbo.workout
(
workoutId int,
workoutName varchar(50),
setNumber int,
repNumber int,
repTime int,
constraint workout_PK primary key(workoutId)
);
go

drop table if exists dbo.nutritionPlan;
go
create table dbo.nutritionPlan
(
nutritionPlanId int,
planName varchar(50),
nutritionDayID int,
constraint nutritionPlan_PK primary key(nutritionPlanId)
);
go
alter table nutritionplan add foreign key (nutritiondayid) references nutritionday (nutritiondayid);


drop table if exists dbo.nutritionDay;
go
create table dbo.nutritionDay
(
nutritionDayId int,
daysName varchar(50),
daysDate date,
mealId int,
constraint nutritionDay_PK primary key(nutritionDayId)
);
go
alter table nutritionday add foreign key (mealid) references meals (mealid);


drop table if exists dbo.meals;
go
create table dbo.meals
(
mealId int,
mealName varchar(50),
foodId int,
constraint meals_PK primary key(mealId)
);
go
alter table meals add foreign key (foodid) references food (foodid);

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
constraint food_PK primary key(foodId)
);
go


select u.username, wp.planname
from users u
	join workoutPlan wp
		on u.userid = wp.userId;

select f.foodname, m.mealname
from food f
	join meals m
		on f.mealid = m.mealid;