SELECT project.title, pledge.amount FROM project
JOIN pledge
ON project.id = pledge.project_id;

#Select the user name, age, and pledge amount for all pledges.
SELECT user.name, user.age, pledge.amount
FROM user
JOIN pledge on pledge.user_id = user.id
order by user.name;

#Select the titles of all projects that have met their funding goal.
#find the sum of the funding of each project
#sum pledge amounts by project
#compare that result to the funding goal
SELECT project.title, project.funding_goal, SUM(pledge.amount) AS money_raised
FROM pledge
JOIN project
ON pledge.project_id = project.id
GROUP BY project.id
HAVING SUM(pledge.amount) >= project.funding_goal

-- Select user names and amounts of all pledges. Order them by the amount.
SELECT user.name, SUM(pledge.amount) AS total_pledges
FROM user
JOIN pledge
ON user.id = pledge.user_id
GROUP by amount

-- Select the category names, and pledge amounts of all pledges in the music category.
SELECT project.category, project.title, pledge.amount
FROM project
JOIN pledge
ON project.id = pledge.project_id
WHERE project.category = 'music'

-- Select the category names and the sum total of the pledge amounts
# of all the pledges in the book category.
SELECT project.category, SUM(pledge.amount) AS total_pledges
FROM project
JOIN pledge
ON project.id = pledge.project_id
WHERE project.category = 'books'
 