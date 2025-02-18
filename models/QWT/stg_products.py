def model(dbt, session):
    
    customer_df = dbt.source('raw_qwt','PRODUCTS')
 
    
    return customer_df 