# ⚽ Football Ticket Booking System (Database Design & SQL Assignment)

## 📌 Project Overview & Objectives

This project is a simplified **Football Ticket Booking System** designed to demonstrate advanced relational database concepts, Entity-Relationship Diagram (ERD) mapping, and intermediate-to-advanced SQL querying.

The system efficiently manages tournament match details, baseline ticket pricing, user access roles, and unique seat booking transactions.

---

## 🏗️ Database Schema & Architecture

The database consists of three core tables linked together by standard relational rules (`Primary Keys` and `Foreign Keys`) to maintain strict **Referential Integrity**.

### 1. Users Table

Tracks all system administrators, ticket managers, and football fans.

| Field Name     | Data Type     | Description                                                 |
| -------------- | ------------- | ----------------------------------------------------------- |
| `user_id` (PK) | `SERIAL`      | Unique identification number for each user.                 |
| `full_name`    | `VARCHAR(40)` | First and last name of the user.                            |
| `email`        | `VARCHAR(20)` | Unique email address used for login authentication.         |
| `role`         | `VARCHAR(20)` | System role restrictions (`Ticket Manager` or `Football Fan`). |
| `phone_number` | `VARCHAR(20)` | Contact mobile number (supports `NULL`).                    |

### 2. Matches Table

Catalogs tournament events, stadium logistics, and baseline ticket pricing.

| Field Name            | Data Type        | Description                                                      |
| --------------------- | ---------------- | ---------------------------------------------------------------- |
| `match_id` (PK)       | `SERIAL`         | Unique identification number for each football match.            |
| `fixture`             | `VARCHAR(100)`   | Competing teams (e.g., Real Madrid vs Barcelona).                |
| `tournament_category` | `VARCHAR(50)`    | The league/cup title (e.g., Champions League, Premier League).   |
| `base_ticket_price`   | `DECIMAL(10,2)`  | Base price for a standard entry seat.                            |
| `match_status`        | `VARCHAR(20)`    | Ticket state (`Available`, `Selling Fast`, `Sold Out`, `Postponed`). |

### 3. Bookings Table

Records individual seat purchases, linking users to matches.

| Field Name      | Data Type       | Description                                                   |
| --------------- | --------------- | ------------------------------------------------------------- |
| `booking_id` (PK)| `SERIAL`       | Unique booking transaction invoice number.                    |
| `user_id` (FK)  | `INT`           | References the `Users` table.                                 |
| `match_id` (FK) | `INT`           | References the `Matches` table.                               |
| `seat_number`   | `VARCHAR(10)`   | Stadium seat identifier (e.g., A-12).                         |
| `payment_status`| `VARCHAR(20)`   | Payment state (`Pending`, `Confirmed`, `Cancelled`, `Refunded`). |
| `total_cost`    | `DECIMAL(10,2)` | Final invoice amount based on base pricing.                   |

---

## 📊 Sample Dataset

### Users Table

| user_id | full_name       | email           | role           | phone_number   |
| ------- | --------------- | --------------- | -------------- | -------------- |
| 1       | Tanvir Rahman   | tanvir@mail.com | Football Fan   | +8801711111111 |
| 2       | Asif Haque      | asif@mail.com   | Football Fan   | +8801722222222 |
| 3       | Sajjad Rahman   | sajjad@mail.com | Ticket Manager | +8801733333333 |
| 4       | Jannat Ara      | jannat@mail.com | Football Fan   | _NULL_         |
| 5       | Rakib Hasan     | rakib@mail.com  | Football Fan   | +8801744444444 |
| 6       | Nusrat Jahan    | nusrat@mail.com | Football Fan   | _NULL_         |
| 7       | Mehedi Hasan    | mehedi@mail.com | Football Fan   | +8801766666666 |
| 8       | Farhan Ahmed    | farhan@mail.com | Football Fan   | +8801777777777 |
| 9       | Rifat Hossain   | rifat@mail.com  | Football Fan   | _NULL_         |
| 10      | Mim Akter       | mim@mail.com    | Football Fan   | +8801788888888 |
| 11      | Arif Islam      | arif@mail.com   | Ticket Manager | +8801799999999 |
| 12      | Sabbir Ahmed    | sabbir@mail.com | Football Fan   | _NULL_         |
| 13      | Priya Sharma    | priya@mail.com  | Football Fan   | +8801811111111 |
| 14      | Ayaan Ali       | ayaan@mail.com  | Football Fan   | _NULL_         |
| 15      | Lina Rahman     | lina@mail.com   | Football Fan   | +8801833333333 |
| 16      | Mark Taylor     | mark@mail.com   | Football Fan   | +8801844444444 |
| 17      | Sophia Lee      | sophia@mail.com | Football Fan   | _NULL_         |
| 18      | Daniel Martinez | daniel@mail.com | Football Fan   | +8801855555555 |
| 19      | Emma Brown      | emma@mail.com  | Football Fan   | _NULL_         |
| 20      | John Smith      | john@mail.com   | Ticket Manager | +8801877777777 |

### Matches Table

| match_id | fixture                      | tournament_category | base_ticket_price | match_status |
| -------- | ---------------------------- | ------------------ | ----------------- | ------------ |
| 101      | Real Madrid vs Barcelona     | Champions League    | 150.00            | Available    |
| 102      | Man City vs Liverpool        | Premier League      | 120.00            | Selling Fast |
| 103      | Bayern Munich vs PSG         | Champions League    | 130.00            | Available    |
| 104      | AC Milan vs Inter Milan      | Serie A             | 90.00             | Sold Out     |
| 105      | Juventus vs Roma             | Serie A             | 80.00             | Available    |
| 106      | Arsenal vs Chelsea           | Premier League      | 110.00            | Available    |
| 107      | PSG vs Dortmund              | Champions League    | 140.00            | Available    |
| 108      | Barcelona vs Atletico Madrid | La Liga             | 125.00            | Selling Fast |
| 109      | Inter Milan vs Napoli        | Serie A             | 95.00             | Available    |
| 110      | Real Madrid vs Man City      | Champions League    | 155.00            | Sold Out     |

### Bookings Table

| booking_id | user_id | match_id | seat_number | payment_status | total_cost |
| ---------- | ------- | -------- | ----------- | -------------- | ---------- |
| 501        | 1       | 101      | A-12        | Confirmed      | 150.00     |
| 502        | 1       | 102      | B-04        | Confirmed      | 120.00     |
| 503        | 2       | 101      | A-13        | Refunded       | 150.00     |
| 504        | 2       | 103      | C-15        | Pending        | 130.00     |
| 505        | 3       | 102      | C-20        | Pending        | 120.00     |
| 506        | 4       | 104      | D-10        | Confirmed      | 90.00      |
| 507        | 5       | 105      | E-05        | _NULL_         | 80.00      |
| 508        | 6       | 106      | F-12        | Pending        | 110.00     |
| 509        | 7       | 107      | F-08        | Confirmed      | 140.00     |
| 510        | 8       | 108      | G-11        | _NULL_         | 125.00     |
| 511        | 9       | 109      | H-03        | Pending        | 95.00      |
| 512        | 10      | 110      | I-15        | Confirmed      | 155.00     |
| 513        | 11      | 101      | J-09        | Cancelled      | 150.00     |
| 514        | 12      | 102      | K-18        | Pending        | 120.00     |
| 515        | 13      | 103      | L-21        | _NULL_         | 130.00     |

---

## 🔍 SQL Queries & Expected Output

### Query 1: Champions League matches with status `Available`

```sql
SELECT
    match_id,
    fixture,
    ROUND(base_ticket_price) AS base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
  AND match_status = 'Available';
```

#### Expected Output

| match_id | fixture                  | base_ticket_price |
| -------- | ------------------------ | ----------------- |
| 101      | Real Madrid vs Barcelona | 150               |
| 103      | Bayern Munich vs PSG     | 130               |
| 107      | PSG vs Dortmund          | 140               |

---

### Query 2: Search users by name pattern

```sql
SELECT user_id, full_name, email
FROM users
WHERE full_name LIKE 'Tanvir%'
   OR full_name LIKE '%Haque%';
```

#### Expected Output

| user_id | full_name     | email                                     |
| ------- | ------------- | ----------------------------------------- |
| 1       | Tanvir Rahman | [tanvir@mail.com](mailto:tanvir@mail.com) |
| 2       | Asif Haque    | [asif@mail.com](mailto:asif@mail.com)     |

---

### Query 3: Bookings with missing payment status

```sql
SELECT booking_id,
       user_id,
       match_id,
       COALESCE(payment_status, 'Action Required') AS systematic_status
FROM bookings
WHERE payment_status IS NULL;
```

#### Expected Output

| booking_id | user_id | match_id | systematic_status |
| ---------- | ------- | -------- | ----------------- |
| 507        | 5       | 105      | Action Required   |
| 510        | 8       | 108      | Action Required   |
| 515        | 13      | 103      | Action Required   |

---

### Query 4: Match booking details with user and fixture

```sql
SELECT bookings.booking_id,
       users.full_name,
       matches.fixture,
       ROUND(bookings.total_cost) AS total_cost
FROM bookings
INNER JOIN matches
    ON bookings.match_id = matches.match_id
INNER JOIN users
    ON bookings.user_id = users.user_id;
```

#### Expected Output (Sample)

| booking_id | full_name     | fixture                  | total_cost |
| ---------- | ------------- | ------------------------ | ---------- |
| 501        | Tanvir Rahman | Real Madrid vs Barcelona | 150        |
| 502        | Tanvir Rahman | Man City vs Liverpool    | 120        |
| 503        | Asif Haque    | Real Madrid vs Barcelona | 150        |
| 504        | Asif Haque    | Bayern Munich vs PSG     | 130        |
| 505        | Sajjad Rahman | Man City vs Liverpool    | 120        |

---

### Query 5: All users with bookings (including users without tickets)

```sql
SELECT users.user_id,
       users.full_name,
       bookings.booking_id
FROM users
LEFT JOIN bookings
    ON bookings.user_id = users.user_id;
```

#### Expected Output (Sample)

| user_id | full_name     | booking_id |
| ------- | ------------- | ---------- |
| 1       | Tanvir Rahman | 501        |
| 1       | Tanvir Rahman | 502        |
| 2       | Asif Haque    | 503        |
| 2       | Asif Haque    | 504        |
| 3       | Sajjad Rahman | 505        |

---

### Query 6: Bookings above average total cost

```sql
SELECT booking_id,
       match_id,
       ROUND(total_cost) AS total_cost
FROM bookings
WHERE total_cost > (
    SELECT AVG(total_cost)
    FROM bookings
);
```

#### Expected Output

| booking_id | match_id | total_cost |
| ---------- | -------- | ---------- |
| 501        | 101      | 150        |
| 503        | 101      | 150        |
| 504        | 103      | 130        |
| 509        | 107      | 140        |
| 512        | 110      | 155        |
| 513        | 101      | 150        |
| 515        | 103      | 130        |

---

### Query 7: Top 2 most expensive matches, skipping the highest priced one

```sql
SELECT match_id,
       fixture,
       ROUND(base_ticket_price) AS base_ticket_price
FROM matches
ORDER BY base_ticket_price DESC
LIMIT 2 OFFSET 1;
```

#### Expected Output

| match_id | fixture                  | base_ticket_price |
| -------- | ------------------------ | ----------------- |
| 101      | Real Madrid vs Barcelona | 150               |
| 107      | PSG vs Dortmund          | 140               |
