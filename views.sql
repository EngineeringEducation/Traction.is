\c traction

CREATE VIEW user_view AS
	SELECT users.user_id, users.name, users.user_name, users.email, permissions.role
	FROM users, permissions
	WHERE users.user_id = permissions.user_id AND ;

SELECT sub.body, av.user_id, av.created 
	FROM article_versions av, subjects sub, articles a 
	WHERE sub.subject_id = a.subject_id 
	AND a.article_id = av.article_id;

SELECT sub.body, subv.user_id, subv.created 
	FROM subject_versions sv, subjects sub 
	WHERE sub.subject_id = subv.subject_id 
	ORDER BY subv.created 
	DESC LIMIT 10;

SELECT sec.title, secv.user_id 
	FROM sections sec, section_versions secv 
	WHERE sec.section_id = secv.section_id 
	ORDER BY secv.created 
	DESC LIMIT 10;

CREATE VIEW article_view as
select av.article_id, av.created, av.user_id, s.body 
	from article_versions av, subjects s, articles a 
	where a.article_id = av.article_id and s.subject_id = a.subject_id 
	and av.approved = true;

CREATE VIEW collectionsView AS
SELECT collections.collection_id, collections.title, collections.user_id, articles_collections.article_id
FROM collections, articles
WHERE collections.collection_id = articles_collections.collection_id AND articles.article_id = articles_collections.article_id;

CREATE VIEW collectionsRecentChanges AS
SELECT collections.collection_id, collections.title, collections.user_id, article_versions.article_id, article_versions.article_version_id
FROM collections
WHERE approved = 'false' AND auditor_id is NULL
ORDER BY article_versions.created DESC
LIMIT 10
