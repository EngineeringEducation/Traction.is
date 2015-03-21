\c traction

CREATE VIEW user_view AS
	SELECT users.user_id, users.name, users.user_name, users.email, permissions.role
	FROM users, permissions
	WHERE users.user_id = permissions.user_id;

CREATE VIEW section_view AS
	SELECT sec.title, secv.created, secv.owner_id, secv.approved
	FROM sections sec, section_versions secv 
	WHERE sec.section_id = secv.section_id
	ORDER BY secv.approved, secv.created 
	DESC LIMIT 10;

CREATE VIEW proposed_edits AS
	SELECT users.user_name, secv.owner_id, secv.approved, secv.body 
	FROM section_versions secv, users
	WHERE users.user_id = secv.owner_id AND approved = false;