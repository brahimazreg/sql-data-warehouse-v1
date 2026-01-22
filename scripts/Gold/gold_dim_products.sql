create view gold.dim_products as 

SELECT
      ROW_NUMBER() OVER (ORDER BY pr.prd_start_dt,pr.prd_key) AS product_key,
      pr.prd_id as product_id,
	  pr.prd_key as product_number,
	  pr.prd_nm as product_name,
      pr.cat_id as category_id,      
      cat.cat as category,
	  cat.subcat as subcategory,
	  cat.maintenance as maintenance,
      pr.prd_cost as cost,
      pr.prd_line as product_line,
      pr.prd_start_dt as start_date
	  
  FROM silver.crm_prd_info as pr   
  LEFT JOIN silver.erp_px_cat_g1v2 as cat
  ON pr.cat_id=cat.id
  where pr.prd_end_dt IS NULL  
 
