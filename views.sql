
CREATE VIEW article_view as
select av.article_id, av.created, av.user_id, s.body 
	from article_versions av, subjects s, articles a 
	where a.article_id = av.article_id and s.subject_id = a.subject_id 
	and av.approved = true;

