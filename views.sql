\c traction;
CREATE VIEW collectionsView AS
SELECT collections.collection_id, collections.title, collections.user_id, articles_collections.article_id
FROM collections, articles_collections, articles
WHERE collections.collection_id = articles_collections.collection_id AND articles.article_id = articles_collections.article_id;

CREATE VIEW collectionsRecentChanges AS
SELECT collections.collection_id, collections.title, collections.user_id, article_versions.article_id, article_versions.article_version_id
FROM collections, article_versions
WHERE auditor_id = NULL AND approved = 'false'
ORDER BY article_versions.created DESC
LIMIT 10

-- // Collections
-- {
--     "collection_title" : "",
--     "collection_owner" : "",
--     "articles" : [article, article, article]
-- }
-- // Collections Recent changes (returns if user is logged in)
-- {
--     "collection_title" : "",
--     "collection_owner" : "",
--     "articles" : [article, article, article],
--     "recent_changes": [article_version, article_version]
-- }