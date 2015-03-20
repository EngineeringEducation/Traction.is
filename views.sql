\c traction

CREATE VIEW user_view AS
	SELECT users.user_id, users.name, users.user_name, users.email, permissions.role
	FROM users, permissions
	WHERE users.user_id = permissions.user_id;

CREATE VIEW article_view as
SELECT a.article_id, a.created, a.subject, a.owner_id, u.user_name
	FROM articles a, users u
	WHERE a.owner_id = u.user_id;

CREATE VIEW sections_view as
select c.category_id, c.article_id, c.title as category_title, 
	s.section_id as section_id, s.sequence, s.title as section_title, 
	sv.body as section_body, sv.owner_id, sv.created 
	from categories c, 
	sections s, section_versions sv where c.category_id = s.category_id and 
	s.section_id = sv.section_id and sv.approved = true order by s.sequence;

CREATE VIEW resources_view as
select s.section_id, s.article_id, r.resource_id, r.title as 
	resource_title, r.owner_id, u.user_name, r.created, r.body from sections s, 
	resources r, users u where s.section_id = r.section_id and u.user_id = r.owner_id 
	order by s.section_id, s.sequence;
