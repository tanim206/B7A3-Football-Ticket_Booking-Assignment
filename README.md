# ⚽ Football Ticket Booking System (Database Design & SQL Assignment)

## 📌 Project Overview & Objectives
This project is a simplified **Football Ticket Booking System** designed to demonstrate advanced relational database concepts, Entity-Relationship Diagram (ERD) mapping, and intermediate-to-advanced SQL querying. 

The system efficiently manages tournament match details, baseline ticket pricing, user access roles, and unique seat booking transactions.

---

## 🏗️ Database Schema & Architecture

The database consists of three core tables linked together by standard relational rules (`Primary Keys` and `Foreign Keys`) to maintain strict **Referential Integrity**.

### 1. Users Table
Tracks all system administrators, ticket managers, and football fans.
| Field Name | Data Type | Description |
| :--- | :--- | :--- |
| `user_id` (PK) | `SERIAL` | Unique identification number for each user. |
| `full_name` | `VARCHAR(40)` | First and last name of the user. |
| `email` | `VARCHAR(20)` | Unique email address used for login authentication. |
| `role` | `VARCHAR(20)` | System role restrictions (`Ticket Manager` or `Football Fan`). |
| `phone_number` | `VARCHAR(20)` | Contact mobile number (Supports `NULL` values). |

### 2. Matches Table
Catalogs the tournament events, stadium logistics, and baseline ticket pricing.
| Field Name | Data Type | Description |
| :--- | :--- | :--- |
| `match_id` (PK) | `SERIAL` | Unique identification number for each football match. |
| `fixture` | `VARCHAR(100)` | Competing teams (e.g., Real Madrid vs Barcelona). |
| `tournament_category`| `VARCHAR(50)` | The league/cup title (e.g., Champions League, Premier League). |
| `base_ticket_price` | `DECIMAL(10,2)`| The foundational price for a single standard entry seat. |
| `match_status` | `VARCHAR(20)` | Ticket state (`Available`, `Selling Fast`, `Sold Out`, `Postponed`). |

### 3. Bookings Table
A transactional table recording individual seat purchases linking users to matches.
| Field Name | Data Type | Description |
| :--- | :--- | :--- |
| `booking_id` (PK)| `SERIAL` | Unique tracking transaction invoice number. |
| `user_id` (FK) | `INT` | Links the booking directly to the `Users` table. |
| `match_id` (FK) | `INT` | Links the booking directly to the `Matches` table. |
| `seat_number` | `VARCHAR(10)` | Specific allocated stadium seat identifier (e.g., A-12). |
| `payment_status` | `VARCHAR(20)` | Financial resolution (`Pending`, `Confirmed`, `Cancelled`, `Refunded`). |
| `total_cost` | `DECIMAL(10,2)`| Calculated final invoice price based on baseline pricing. |

---

## 📊 Sample Datasets (Seeded Values)

### Users Table
| user_id | full_name | email | role | phone_number |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Tanvir Rahman | tanvir@mail.com | Football Fan | +8801711111111 |
| 2 | Asif Haque | asif@mail.com | Football Fan | +8801722222222 |
| 3 | Sajjad Rahman | sajjad@mail.com | Ticket Manager | +8801733333333 |
| 4 | Jannat Ara | jannat@mail.com | Football Fan | *NULL* |

### Matches Table
| match_id | fixture | tournament_category | base_ticket_price | match_status |
| :--- | :--- | :--- | :--- | :--- |
| 101 | Real Madrid vs Barcelona | Champions League | 150.00 | Available |
| 102 | Man City vs Liverpool | Premier League | 120.00 | Selling Fast |
| 103 | Bayern Munich vs PSG | Champions League | 130.00 | Available |
| 104 | AC Milan vs Inter Milan | Serie A | 90.00 | Sold Out |
| 105 | Juventus vs Roma | Serie A | 80.00 | Available |

### Bookings Table
| booking_id | user_id | match_id | seat_number | payment_status | total_cost |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 501 | 1 | 101 | A-12 | Confirmed | 150.00 |
| 502 | 1 | 102 | B-04 | Confirmed | 120.00 |
| 503 | 2 | 101 | A-13 | Refunded | 150.00 |
| 504 | 2 | 103 | C-15 | Pending | 130.00 |
| 505 | 3 | 102 | C-20 | Pending | 120.00 |

---

## 🔍 SQL Queries & Expected Output

Below are the sequential SQL query implementations along with their respective database outputs.

### 🔷 Query 1
**Question:** Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.

```sql
SELECT match_id, fixture, ROUND(base_ticket_price) AS base_ticket_price 
FROM matches
WHERE tournament_category = 'Champions League' AND match_status = 'Available';