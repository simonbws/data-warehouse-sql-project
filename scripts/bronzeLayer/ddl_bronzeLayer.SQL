/*
============================================================
Script Purpose:
This script created tables in the 'bronzeLayer' schema, dropping existing ones if exist.

IF OBJECT_ID('bronzeLayer.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronzeLayer.crm_cust_info;
============================================================
*/
CREATE TABLE bronzeLayer.crm_cust_info (
    cst_id              INT,
    cst_key             NVARCHAR(50),
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_marital_status  NVARCHAR(50),
    cst_gndr            NVARCHAR(50),
    cst_create_date     DATE
);
GO

IF OBJECT_ID('bronzeLayer.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronzeLayer.crm_prd_info;
GO

CREATE TABLE bronzeLayer.crm_prd_info (
    prd_id       INT,
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(50),
    prd_cost     INT,
    prd_line     NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);
GO

IF OBJECT_ID('bronzeLayer.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronzeLayer.crm_sales_details;
GO

CREATE TABLE bronzeLayer.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);
GO

IF OBJECT_ID('bronzeLayer.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronzeLayer.erp_loc_a101;
GO

CREATE TABLE bronzeLayer.erp_loc_a101 (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);
GO

IF OBJECT_ID('bronzeLayer.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronzeLaye.erp_cust_az12;
GO

CREATE TABLE bronzeLaye.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);
GO

IF OBJECT_ID('bronzeLaye.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronzeLaye.erp_px_cat_g1v2;
GO

CREATE TABLE bronzeLaye.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
);
GO
