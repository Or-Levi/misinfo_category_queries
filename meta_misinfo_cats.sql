--Top Misinfo Sub-Categories on Meta in the last week
SELECT icv.ICV_NAME,count(*)
FROM PROD.measurement.meta_post_concept_scores_dim s
INNER JOIN PROD.REPORTING.LATEST_INVENTORY_CONCEPT_VERSION icv ON icv.ICV_UUID = s.TAXONOMY_UUID
WHERE icv.IC_NAME like '%Misinformation%' and last_updated_date_time>current_date-8
and (not CONTAINS(icv.IC_NAME, '4A') and not CONTAINS(icv.IC_NAME, 'GARM'))
GROUP BY icv.ICV_NAME
