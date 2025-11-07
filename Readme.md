# Taxi Booking App — SQL Database

A complete SQL Server database for a taxi booking platform (Uber/Lyft-style).  
Includes schema, seed data, views, triggers with audit logging, a stored procedure, a table-valued function, and a cursor demo — all in one script.

## 📦 Contents
- `sql/Script.sql` — run this single script to create the database, load data, and create all objects.
- `README.md` — you’re reading it.

## 🧱 What’s Inside the Script
- **Schema:** `Users`, `Drivers`, `Vehicles`, `Trips`, `Payments`, `Feedback`
- **Data Load:** 10–35 rows per table (dimension + transactional)
- **Views:**
  - `Active_Users_Trip_Details` — recent trips with user/driver/payment
  - `High_Rated_Drivers` — drivers ≥4.0 rating + trip counts
  - `Negative_Feedback_Analysis` — feedback ≤3 with comments
- **Audit Logging:** `Vehicle_Audit` table + `INSERT/UPDATE/DELETE` triggers on `Vehicles`
- **Stored Procedure:** `GetTripsByUser (@user_id_param INT)`
- **Table-Valued Function:** `GetDriverAverageRatingDetails(@driver_id_param INT)`
- **Cursor Demo:** `ProcessUserDetails` procedure

## 🚀 Getting Started (SQL Server)
1. Open **SSMS** or **Azure Data Studio**.
2. Run the entire script:
   ```sql
   :r .\sql\Script.sql
   ```
   (Or copy-paste its contents into a new query window and execute.)
3. The script will:
   - `CREATE DATABASE ;`
   - `USE DATABASE;`
   - Create tables, load sample data, create views/triggers/SP/UDF/cursor.

> **Note:** The script uses T-SQL functions like `GETDATE()` and `DATEADD`, and composite keys. It targets **Microsoft SQL Server**. For MySQL/Postgres you’d need minor syntax changes.

## 🔍 Quick Checks
Verify data:
```sql
SELECT TOP 5 * FROM Users;
SELECT TOP 5 * FROM Drivers;
SELECT TOP 5 * FROM Trips;
```

Run the stored procedure:
```sql
EXEC GetTripsByUser @user_id_param = 1;
```

Get a driver’s average rating:
```sql
SELECT * FROM dbo.GetDriverAverageRatingDetails(1);
```

View recent active-user trips:
```sql
SELECT TOP 10 * FROM Active_Users_Trip_Details ORDER BY trip_date DESC;
```

See audit entries (after any insert/update/delete on `Vehicles`):
```sql
SELECT * FROM Vehicle_Audit ORDER BY audit_id DESC;
```

Process users with the cursor demo:
```sql
EXEC ProcessUserDetails;
```

## 📁 Repo Structure
```
Taxi-Booking-App-SQL-Database/
├── sql/
│   └── Final_project.sql
└── README.md
```

## ⚠️ Cleanup (optional)
If you want to drop everything created by the script, the file includes a teardown section that drops tables (and created objects are dropped in place where appropriate).

## 👤 Author
**Ravi Teja Buchaiahgari**  
