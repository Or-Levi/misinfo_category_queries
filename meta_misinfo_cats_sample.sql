--Sample of Meta Content and the Misinfo Sub-Categories Classifications
WITH misinfo_scores as (
 SELECT post_id,icv.ICV_NAME,score
  FROM PROD.measurement.meta_post_concept_scores_dim s
  INNER JOIN PROD.REPORTING.LATEST_INVENTORY_CONCEPT_VERSION icv ON icv.ICV_UUID = s.TAXONOMY_UUID
    WHERE icv.IC_NAME like '%Misinformation%' and last_updated_date_time>current_date-8
    and (not CONTAINS(icv.IC_NAME, '4A') and not CONTAINS(icv.IC_NAME, 'GARM'))
)
SELECT m.post_id,m.view_url,m.title,s.ICV_NAME,s.score
FROM  misinfo_scores s
JOIN prod.measurement.meta_post_metadata_dim m
ON s.post_id=m.post_id
LIMIT 1000
