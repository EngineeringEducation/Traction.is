CREATE VIEW collectionsView AS
SELECT collections.collection_id, collections.title, collections.owner_id, articles_collections.article_id, articles.subject
FROM collections, articles, articles_collections
WHERE collections.collection_id = articles_collections.collection_id AND articles.article_id = articles_collections.article_id;