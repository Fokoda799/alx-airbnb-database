# Airbnb Clone Database Schema

This project defines the PostgreSQL schema for an **Airbnb Clone** application.  
It includes users, properties, bookings, payments, reviews, and messaging features.

---

## 📂 Schema Overview

### Tables
- **User** → Stores all users (guests, hosts, admins).
- **Property** → Details of properties listed by hosts.
- **Booking** → Records reservations made by users.
- **Payment** → Tracks payment info for bookings.
- **Review** → Stores property reviews and ratings.
- **Message** → Enables guest-host communication.

### ENUM Types
- **user_role** → `guest`, `host`, `admin`
- **booking_status** → `pending`, `confirmed`, `canceled`
- **payment_method** → `credit_card`, `paypal`, `stripe`

### Indexes
Indexes are created on commonly queried columns (`email`, `host_id`, `user_id`, `property_id`, etc.) for better performance.

---

## 🚀 Getting Started

### Prerequisites
- PostgreSQL installed on your system.
- A database created (e.g., `airbnb_clone`).

### Setup
1. Clone this repo or copy `schema.sql`.
2. Run the script in psql:
   ```bash
   psql -U <username> -d airbnb_clone -f schema.sql
