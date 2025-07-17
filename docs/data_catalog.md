# 📘 Gold Layer – Data Catalog
# 🔍 Introduction
The Gold Layer represents curated, analytics-ready data structured into dimension and fact tables. 
It serves as the foundation for business intelligence reporting and analytical insights. 
Below is a breakdown of its primary entities.

# 📂 Dimension Tables
# gold.dim_customers – Customer Dimension
This dimension contains enriched customer information, combining identification data with demographics and geographic context.
Each customer is assigned a unique surrogate key (customer_key) to ensure data integrity in analytical joins.
### Key Attributes:
#### Identifiers:
customer_key (INT): Surrogate key used in fact relationships.

customer_id (INT): System-generated unique ID.

customer_number (NVARCHAR): Alphanumeric external/customer-facing ID.

#### Personal Information:

first_name, last_name (NVARCHAR): Captures the customer's full name.

gender (NVARCHAR): Gender identification, including 'n/a' if unspecified.

birthdate (DATE): Birth date formatted as YYYY-MM-DD.

marital_status (NVARCHAR): E.g., 'Single', 'Married'.

#### Location & Metadata:

country (NVARCHAR): Country of residence (e.g., Australia).

create_date (DATE): Timestamp of when the record was first created.

# gold.dim_products – Product Dimension
This dimension provides detailed metadata about products, including classification, cost, and availability.
It supports product-based slicing of metrics and is normalized for analytical scalability.

### Key Attributes:

#### Identification:

product_key (INT): Surrogate key for linking with fact tables.

product_id (INT): Source system unique identifier.

product_number (NVARCHAR): Alphanumeric product code for referencing.

#### Description & Classification:

product_name (NVARCHAR): Human-readable product label including descriptors like size or color.

category / subcategory (NVARCHAR): Multi-level classification (e.g., Bikes > Mountain).

category_id (NVARCHAR): Code used to represent product categories.

#### Product Attributes:

maintenance_required (NVARCHAR): Indicates if product needs servicing ('Yes'/'No').

product_line (NVARCHAR): Specific line the product belongs to (e.g., Road, Touring).

cost (INT): Product’s base cost in currency units.

start_date (DATE): Launch date or market availability date.

# 📊 Fact Tables
# gold.fact_sales – Sales Fact Table
This transactional fact table stores all sales-related events, capturing key metrics and associated foreign keys to dimension tables. Each record reflects a line item in an order.

### Key Attributes:

#### Order Details:

order_number (NVARCHAR): Unique identifier of the order (e.g., SO54496).

order_date (DATE): Date of the order placement.

shipping_date / due_date (DATE): Shipment and payment due timelines.

#### Linking Keys:

product_key (INT): Foreign key referencing the product dimension.

customer_key (INT): Foreign key referencing the customer dimension.

#### Sales Metrics:

sales_amount (INT): Total amount for the line item.

price (INT): Unit price of the product.

quantity (INT): Number of units sold in the order.

# 🧭 Summary
This catalog defines the structure of the Gold Layer, ensuring clarity for BI analysts, data engineers, and business users. 
Each table is designed for efficient querying and meaningful insights, using surrogate keys and normalized structures where necessary.
