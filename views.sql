\c traction;
CREATE VIEW collectionsView AS
SELECT collections.collection_id, collections.title, articles.subject, users.user_name
FROM collections, articles, articles_collections, users
WHERE collections.collection_id = articles_collections.collection_id AND articles.article_id = articles_collections.article_id AND users.user_id = collections.owner_id;