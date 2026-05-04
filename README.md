# Meta DB Engineer Capstone Project

A full-stack database engineering project for the **Little Lemon Restaurant**, developed as the capstone for the [Meta Database Engineer Professional Certificate](https://www.coursera.org/professional-certificates/meta-database-engineer) on Coursera.

---

## Project Overview

This project involves designing, implementing, and querying a relational database for Little Lemon — a fictional restaurant chain. It covers database modeling, SQL scripting, stored procedures, Python-based database clients, and Tableau data analysis.

---

## Tech Stack

- **Database:** MySQL 8.0
- **Modeling Tool:** MySQL Workbench
- **Programming Language:** Python 3.11
- **Python Library:** `mysql-connector-python`
- **Data Analysis & Visualization:** Tableau Desktop
- **Notebook Environment:** Jupyter Notebook

---

## Repository Structure

```
Meta-DB-Engineer-CapstoneProject/
│
├── DATA_MODEL/
│   ├── Database_Script.sql         # Forward-engineered DB creation script
│   ├── LittleLemonDM.png           # ER Diagram (MySQL Workbench)
│   └── Database_Presence_Check.png # Screenshot confirming DB setup in Workbench
│
├── AVAILABLE_BOOKING_QUERIES/
│   ├── InsertionQuery.sql          # Seed data for Bookings table
│   ├── CheckBookings.sql           # Procedure to check table availability
│   └── AddValidBookings.sql        # Procedure with transaction + rollback logic
│
├── ADD_UPDATE_CANCEL_BOOKINGS/
│   ├── Procedure__AddBookings.sql  # Procedure to add a new booking
│   ├── Procedure__UpdateBooking.sql# Procedure to update booking date
│   └── Procedure__CancelBooking.sql# Procedure to cancel a booking by ID
│
├── OPTIMISED_QUERIES/
│   ├── PreparedStatement_GetOrderDetail.sql  # Prepared statement for order lookup
│   ├── Procedure_GetMaxQuantity.sql          # Procedure to find max order quantity
│   └── Procedure_CancelOrder.sql             # Procedure to delete an order by ID
│
├── VIEWS+JOINS+SUBQUERY/
│   ├── VIRTUAL TABLE.sql           # View: OrdersView (orders with quantity > 2)
│   ├── MULTIPLE TABLE JOIN.sql     # View: CustomerDetailsView (multi-table join)
│   └── SUBQUERY.sql                # View: MenuDetailsView (subquery with ANY)
│
├── DATABASE_CLIENT_CODE/
│   └── DATABASE-CLIENT-NOTEBOOK.ipynb  # Jupyter Notebook — Python MySQL client
│
├── LittleLemon_DATA_ANALYSIS/
│   ├── LittleLemon-DB.xlsx                      # Source data
│   ├── Little_Lemon_Data_Analysis.twbx          # Tableau packaged workbook
│   ├── CuisineSalesAndProfits_BAR_CHART.png     # Bar chart: sales by cuisine & year
│   ├── CustomerSales_BarChart.png               # Bar chart: sales per customer
│   ├── Profit_LineChart.png                     # Line chart: profit trend 2019–2022
│   ├── Sales_BubbleChart.png                    # Bubble chart: sales & profit by customer
│   └── CustomerSalesAndProfits_DASHBOARD.png    # Combined Tableau dashboard
│
└── README.md
```

---

## Database Schema

The `little_lemon_db` database consists of 7 tables:

| Table | Description |
|-------|-------------|
| `Customers` | Customer personal and contact details |
| `Staff` | Staff roles and salary information |
| `MenuItems` | Individual menu item names, categories, and prices |
| `Menu` | Menu categories linked to menu items |
| `Bookings` | Table reservations linked to customers |
| `Orders` | Order records linked to bookings, menu, staff, and customers |
| `OrderDeliveryStatus` | Delivery status and date for each order |

The ER diagram is available in `DATA_MODEL/LittleLemonDM.png`.

---

## Key Features

- **Stored Procedures** — Add, update, and cancel bookings; cancel orders; retrieve max quantity
- **Transaction Management** — `AddValidBooking` uses `START TRANSACTION` / `ROLLBACK` to prevent double-booking
- **Prepared Statements** — Parameterised query for secure order detail retrieval
- **Views** — Virtual tables for orders, customer details, and menu filtering
- **Python Client** — Jupyter Notebook connecting to MySQL via `mysql-connector-python`, executing joins and queries programmatically
- **Tableau Dashboards** — Sales, profit, and customer analysis across cuisine types and years

---

## How to Run

### 1. Set up the Database
Run `DATA_MODEL/Database_Script.sql` in MySQL Workbench to create the schema and all tables.

### 2. Seed the Bookings Table
Run `AVAILABLE_BOOKING_QUERIES/InsertionQuery.sql` to insert initial booking records.

### 3. Run SQL Scripts
Open any `.sql` file in MySQL Workbench and execute against `little_lemon_db`.

### 4. Run the Python Notebook
```bash
pip install mysql-connector-python
jupyter notebook
```
Open `DATABASE_CLIENT_CODE/DATABASE-CLIENT-NOTEBOOK.ipynb` and update the connection credentials:
```python
connection = connector.connect(user='your_username', password='your_password', db='little_lemon_db')
```

### 5. View Tableau Analysis
Open `LittleLemon_DATA_ANALYSIS/Little_Lemon_Data_Analysis.twbx` in Tableau Desktop.

---

## Course Attribution

**Meta Database Engineer Professional Certificate**  
Offered by Meta × Coursera  
[https://www.coursera.org/professional-certificates/meta-database-engineer](https://www.coursera.org/professional-certificates/meta-database-engineer)
