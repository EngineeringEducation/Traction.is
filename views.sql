CREATE VIEW collectionsView AS
SELECT collections.title, subjects.subject_id, subject_versions.user_id, subject_versions.created, subject_versions.approved, subject_versions.body
FROM collections, subjects, subject_versions
WHERE subjects.subject_id = subject_versions.subject_id AND collections.user_id = subject_versions.user_id;

--Collection title, color scheme Subject listing Recent changes (accepted changes, proposals)