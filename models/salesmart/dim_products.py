def model(dbt, session):
    
    customer_df = dbt.ref('trf_products')
 
    
    return customer_df 