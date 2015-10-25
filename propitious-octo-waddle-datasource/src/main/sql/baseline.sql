-- Tables.

CREATE TABLE accounts
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	username VARCHAR(100) NOT NULL UNIQUE,
	password TEXT NOT NULL
)
;

CREATE TABLE task_types
(
	id SMALLSERIAL NOT NULL PRIMARY KEY,
	behaviour_name VARCHAR(100) NOT NULL UNIQUE
)
;

CREATE TABLE tasks
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	type_id SMALLINT NOT NULL,
	description TEXT NOT NULL,
	FOREIGN KEY (type_id) REFERENCES task_types (id)
)
;

CREATE TABLE options
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	task_id BIGINT NOT NULL,
	description TEXT NOT NULL,
	reward SMALLINT NOT NULL,
	FOREIGN KEY (task_id) REFERENCES task (id)
)
;

CREATE TABLE pools
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	title VARCHAR(100) NOT NULL UNIQUE
)
;

CREATE TABLE pools_tasks
(
	pool_id BIGINT NOT NULL,
	task_id BIGINT NOT NULL,
	PRIMARY KEY (pool_id, task_id),
	FOREIGN KEY (pool_id) REFERENCES pools (id),
	FOREIGN KEY (task_id) REFERENCES tasks (id)
)
;

CREATE TABLE exams
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	title VARCHAR(100) NOT NULL UNIQUE
)
;

CREATE TABLE exams_pools
(
	exam_id BIGINT NOT NULL,
	pool_id BIGINT NOT NULL,
	tasks   SMALLINT NOT NULL,
	PRIMARY KEY (exam_id, pool_id),
	FOREIGN KEY (exam_id) REFERENCES exams (id),
	FOREIGN KEY (pool_id) REFERENCES pools (id)
)
;

-- Views.

CREATE VIEW standard_accounts AS 
SELECT id, username
FROM accounts
;

CREATE VIEW standard_options AS 
SELECT id, task_id, description, reward 
FROM options 
;

CREATE VIEW standard_tasks AS 
SELECT id, type_id, description 
FROM task 
;

CREATE VIEW standard_pools AS 
SELECT id, title 
FROM pools 
;

CREATE VIEW standard_pools_tasks AS 
SELECT pools_tasks.pool_id, standard_tasks.* 
FROM pools_tasks JOIN standard_tasks ON pools_tasks.task_id = standard_tasks.id 
;

CREATE VIEW standard_exams AS 
SELECT id, title 
FROM exams 
;

CREATE VIEW standard_exams_pools AS 
SELECT exams_pools.exam_id, standard_pools.*,  
FROM exams_pools.exam_id JOIN standard_pools ON exam_pools.pool_id = standard_pools.id 
;

-- Stored procedures.

CREATE FUNCTION account_create (arg_creator_id BIGINT NULL, arg_username VARCHAR(100), arg_password TEXT)
RETURNS SETOF standard_accounts
AS
$$
INSERT INTO accounts (id, username, password) 
VALUES (DEFAULT, arg_username, arg_password)
RETURNING (id, username)
;
$$
LANGUAGE SQL
STRICT
;

CREATE FUNCTION pool_create (arg_creator_id BIGINT, arg_title VARCHAR(100))
RETURNS SETOF standard_pools 
AS 
$$
INSERT INTO pools (id, title) 
VALUES (DEFAULT, arg_title)
RETURNING (id, title)
;
$$
LANGUAGE
SQL
STRICT
;

CREATE FUNCTION pool_update (arg_pool_id BIGINT, arg_updator_id BIGINT, arg_title VARCHAR(100))
RETURNS BOOLEAN
AS 
$$
UPDATE pools 
SET title = arg_title 
WHERE id = arg_pool_id 
;
SELECT TRUE 
;
$$
LANGUAGE SQL
STRICT
;

CREATE FUNCTION exam_create (arg_creator_id BIGINT, arg_title VARCHAR(100))
RETURNS SETOF standard_exams 
AS 
$$
INSERT INTO exams (id, title) 
VALUES (DEFAULT, arg_title)
RETURNING (id, title)
;
$$
LANGUAGE
SQL
STRICT
;

CREATE FUNCTION exam_update (arg_exam_id BIGINT, arg_updator_id BIGINT, arg_title VARCHAR(100))
RETURNS BOOLEAN
AS 
$$
UPDATE exams 
SEt title = arg_title 
WHERE id = arg_exam_id 
;
SELECT TRUE
;
$$
LANGUAGE SQL
STRICT
;

CREATE FUNCTION option_create (arg_creator_id BIGINT, arg_task_id BIGINT, arg_descripton TEXT, arg_reward SMALLINT)
RETURNS SETOF standard_options 
AS 
$$
INSERT INTO options (id, task_id, description, reward) 
VALUES (DEFAULT, arg_task_id, arg_description, arg_reward)
RETURNING (id, task_id, description, reward)
;
$$
LANGUAGE SQL 
STRICT 
;

CREATE FUNCTION task_create (arg_creator_id BIGINT, arg_description TEXT)
RETURNS SETOF standard_tasks 
AS 
$$
INSERT INTO tasks (id, type_id, description) 
VALUES (DEFAULT, DEFAULT, arg_description)
;
$$
LANGUAGE SQL 
STRICT 
;

CREATE FUNCTION task_update (arg_task_id BIGINT, arg_description TEXT)
RETURNS BOOLEAN 
AS 
$$
UPDATE tasks 
SET description = arg_description 
WHERE id = arg_task_id
;
SELECT TRUE
;
$$
LANGUAGE SQL 
STRICT 
;

CREATE FUNCTION option_update (arg_option_id BIGINT, arg_updator_id BIGINT, arg_description TEXT, arg_reward SMALLINT)
RETURNS BOOLEAN
AS 
$$
UPDATE options 
SET description = arg_description,
SET reward = arg_reward 
WHERE options.id = arg_option_id 
;
SELECT TRUE
;
$$
LANGUAGE SQL 
STRICT 
;

CREATE FUNCTION option_update_description (arg_option_id BIGINT, arg_updator_id BIGINT, arg_description TEXT)
RETURNS BOOLEAN
AS 
$$
UPDATE options 
SET description = arg_description
WHERE options.id = arg_option_id 
;
SELECT TRUE
;
$$
LANGUAGE SQL 
STRICT 
;

CREATE FUNCTION option_update_reward (arg_option_id BIGINT, arg_updator_id BIGINT, arg_reward SMALLINT)
RETURNS BOOLEAN
AS 
$$
UPDATE options 
SET reward = arg_reward
WHERE options.id = arg_option_id 
;
SELECT TRUE
;
$$
LANGUAGE SQL 
STRICT 
;