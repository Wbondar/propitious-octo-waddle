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
	class_name VARCHAR(100) NOT NULL UNIQUE
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
	FOREIGN KEY (task_id) REFERENCES tasks (id)
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
SELECT id, username, password
FROM accounts
;

CREATE VIEW standard_options AS 
SELECT id, task_id, description, reward 
FROM options 
;

CREATE VIEW standard_tasks AS 
SELECT tasks.id, task_types.class_name, description 
FROM tasks JOIN task_types ON tasks.type_id = task_types.id
;

CREATE VIEW standard_pools AS 
SELECT id, title 
FROM pools 
;

CREATE VIEW standard_pools_tasks AS 
SELECT pools_tasks.pool_id, standard_tasks.* 
FROM pools_tasks JOIN standard_tasks ON pools_tasks.task_id = standard_tasks.id 
;

CREATE VIEW shuffled_pools_tasks AS 
SELECT * 
FROM standard_pools_tasks
ORDER BY RANDOM( )
;

CREATE VIEW standard_exams AS 
SELECT id, title 
FROM exams 
;

CREATE VIEW standard_exams_pools AS 
SELECT exams_pools.exam_id, standard_pools.*, exams_pools.tasks
FROM exams_pools JOIN standard_pools ON exams_pools.pool_id = standard_pools.id 
;

-- Stored procedures.

CREATE FUNCTION account_create (arg_creator_id BIGINT, arg_username VARCHAR(100), arg_password TEXT)
RETURNS SETOF standard_accounts
AS
$$
BEGIN
	INSERT INTO accounts (id, username, password) 
	VALUES (DEFAULT, arg_username, arg_password)
	;
	IF FOUND THEN 
		RETURN QUERY SELECT * FROM standard_accounts WHERE id = currval('accounts_id_seq')
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL
;

CREATE FUNCTION pool_create (arg_creator_id BIGINT, arg_title VARCHAR(100))
RETURNS SETOF standard_pools 
AS 
$$
BEGIN
	INSERT INTO pools (id, title) 
	VALUES (DEFAULT, arg_title)
	;
	IF FOUND THEN 
		RETURN QUERY SELECT * FROM standard_pools WHERE id = currval('pools_id_seq')
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL
STRICT
;

CREATE FUNCTION pool_update (arg_pool_id BIGINT, arg_updator_id BIGINT, arg_title VARCHAR(100))
RETURNS BOOLEAN
AS 
$$
BEGIN
UPDATE pools 
SET title = arg_title 
WHERE id = arg_pool_id 
;
SELECT TRUE 
;
END
;
$$
LANGUAGE PLpgSQL
STRICT
;

CREATE FUNCTION exam_create (arg_creator_id BIGINT, arg_title VARCHAR(100))
RETURNS SETOF standard_exams 
AS 
$$
BEGIN
INSERT INTO exams (id, title) 
VALUES (DEFAULT, arg_title)
RETURNING (id, title)
;
END
;
$$
LANGUAGE PLpgSQL
STRICT
;

CREATE FUNCTION exam_update (arg_exam_id BIGINT, arg_updator_id BIGINT, arg_title VARCHAR(100))
RETURNS BOOLEAN
AS 
$$
BEGIN
UPDATE exams 
SEt title = arg_title 
WHERE id = arg_exam_id 
;
SELECT TRUE
;
END
;
$$
LANGUAGE PLpgSQL
STRICT
;

CREATE FUNCTION option_create (arg_creator_id BIGINT, arg_task_id BIGINT, arg_descripton TEXT, arg_reward SMALLINT)
RETURNS SETOF standard_options 
AS 
$$
BEGIN
	INSERT INTO options (id, task_id, description, reward) 
	VALUES (DEFAULT, arg_task_id, arg_description, arg_reward)
	;
	IF FOUND THEN
		RETURN QUERY SELECT * FROM standard_options WHERE id = currval('options_id_seq'); 
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL 
STRICT 
;

CREATE FUNCTION task_create (arg_creator_id BIGINT, arg_class_name VARCHAR(100), arg_description TEXT)
RETURNS SETOF standard_tasks 
AS 
$$
DECLARE
	var_type_id SMALLINT;
BEGIN
	SELECT id INTO var_type_id 
	FROM task_types 
	WHERE class_name = arg_class_name 
	;
	INSERT INTO tasks (id, type_id, description) 
	VALUES (DEFAULT, var_type_id, arg_description)
	;
	IF FOUND THEN 
		RETURN QUERY SELECT * FROM standard_tasks WHERE id = currval('tasks_id_seq');
	END IF  
	;
END
;
$$
LANGUAGE PLpgSQL 
STRICT 
;

CREATE FUNCTION task_update (arg_task_id BIGINT, arg_description TEXT)
RETURNS BOOLEAN 
AS 
$$
BEGIN
	UPDATE tasks 
	SET description = arg_description 
	WHERE id = arg_task_id
	;
	IF FOUND THEN
		SELECT TRUE
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL 
STRICT 
;

CREATE FUNCTION option_update (arg_option_id BIGINT, arg_updator_id BIGINT, arg_description TEXT, arg_reward SMALLINT)
RETURNS BOOLEAN
AS 
$$
BEGIN
	UPDATE options 
	SET description = arg_description,
	 reward = arg_reward 
	WHERE options.id = arg_option_id 
	;
	IF FOUND THEN
		SELECT TRUE
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL 
STRICT 
;

CREATE FUNCTION option_update_description (arg_option_id BIGINT, arg_updator_id BIGINT, arg_description TEXT)
RETURNS BOOLEAN
AS 
$$
BEGIN
	UPDATE options 
	SET description = arg_description
	WHERE options.id = arg_option_id 
	;
	IF FOUND THEN
		SELECT TRUE
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL 
STRICT 
;

CREATE FUNCTION option_update_reward (arg_option_id BIGINT, arg_updator_id BIGINT, arg_reward SMALLINT)
RETURNS BOOLEAN
AS 
$$
BEGIN
	UPDATE options 
	SET reward = arg_reward
	WHERE options.id = arg_option_id 
	;
	IF FOUND THEN
		SELECT TRUE
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL 
STRICT 
;