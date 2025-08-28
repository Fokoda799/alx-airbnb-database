# 🏡 Database Normalization Report – Airbnb Clone Project

## 📖 Introduction

This document presents the **database normalization process** for the Airbnb Clone project.  
The goal of normalization is to **reduce data redundancy**, **prevent anomalies** (insertion, update, deletion), and **ensure data integrity**. ✅

Our schema has been carefully designed from the start to comply with **Third Normal Form (3NF)** principles.

---

## 1️⃣ First Normal Form (1NF)

**Rule:**  
A table is in 1NF if all columns contain **atomic values** (indivisible) and each record is **unique**.  
No repeating groups are allowed.

**Application:**  
All tables in our schema satisfy 1NF:
- 🗂️ Each cell stores a single piece of information (e.g., `User` table separates `first_name` and `last_name` instead of a combined `full_name`).  
- 🔑 Every table has a **unique primary key** (`user_id`, `property_id`, etc.), ensuring uniqueness of each row.

---

## 2️⃣ Second Normal Form (2NF)

**Rule:**  
A table is in 2NF if it is in 1NF and **all non-key attributes are fully dependent on the entire primary key**.  
This mainly concerns **composite primary keys** (keys with two or more columns).

**Application:**  
All tables in our schema satisfy 2NF:
- 🗝️ Every table uses a **single-column primary key** (`user_id`, `booking_id`, etc.).  
- ❌ No composite keys → no partial dependencies → 2NF is inherently satisfied.

---

## 3️⃣ Third Normal Form (3NF)

**Rule:**  
A table is in 3NF if it is in 2NF and **has no transitive dependencies**.  
A transitive dependency occurs when a non-key attribute depends on another non-key attribute instead of directly on the primary key.

**Application:**  
All tables in our schema satisfy 3NF:
- ✅ Every non-key attribute depends **directly on the primary key only**.  
- Example: `Property` table attributes (`name`, `description`, `price_per_night`) depend on `property_id`.  
- We **avoid transitive dependencies** by separating entities:
  - Host info is not duplicated in `Property`; instead, `host_id` (FK) links to the `User` table.  
  - `Booking`, `Review`, and `Payment` tables each reference only necessary foreign keys.

---

## 🎯 Conclusion

The Airbnb Clone database is **fully normalized to 3NF**.  

This ensures:
- ⚡ Efficient queries and storage  
- 🔒 Data integrity  
- 📈 Scalability for production-level usage

By adhering to 3NF principles, the database design is **robust, reliable, and maintainable**.
