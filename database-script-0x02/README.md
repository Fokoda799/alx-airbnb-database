# Airbnb Clone – Sample Data

This repository contains **SQL scripts** to populate the Airbnb Clone database with **realistic sample data**.  
The data is designed to reflect common real-world scenarios: multiple users (guests, hosts, admin), properties, bookings, payments, reviews, and messages.

---

## 📂 Files
- **schema.sql** → Creates the database tables, constraints, and indexes.  
- **seed.sql** → Inserts sample data into the schema for testing and development.  

---

## 🚀 Getting Started

### Prerequisites
- PostgreSQL installed on your machine.
- Database created (e.g., `airbnb_clone`).
- `pgcrypto` extension enabled (for `gen_random_uuid()`).

```sql
CREATE EXTENSION IF NOT EXISTS pgcrypto;
```

### Setup

Run the following commands from your terminal (replace <username> with your PostgreSQL user):

Create schema
```sql
psql -U <username> -d airbnb_clone -f schema.sql
```

Insert sample data
```sql
psql -U <username> -d airbnb_clone -f seed.sql
```
