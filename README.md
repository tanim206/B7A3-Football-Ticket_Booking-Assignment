# Football Ticket Booking System Database

This repository contains the database setup and sample queries for a Football Ticket Booking System.

## Files

- `Query.sql` — SQL script for creating the database, tables, inserting sample data, and example queries.

## What is included

The SQL script defines:

- `Users` — fan and manager user records
- `Matches` — scheduled football matches with ticket pricing and status
- `Bookings` — ticket bookings linked to users and matches

It also includes sample data and queries such as:

- available Champions League matches
- user search by name
- bookings with missing payment status
- match booking details with user names
- users without bookings
- bookings above average cost
- top expensive matches

## Usage

1. Open `Query.sql` in your SQL editor.
2. Execute the SQL script on a Postgres-compatible database.
3. Adjust the dialect if needed for other databases.

## Notes

- The script uses `serial` types and `CHECK` constraints, which are supported by PostgreSQL.
- If you want, I can also add an ER diagram or convert this script to MySQL/SQLite syntax.
