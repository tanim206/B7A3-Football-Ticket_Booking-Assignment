-- =========================================================================
-- SYSTEM: Football Ticket Booking System Database Setup 
-- =========================================================================


-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
drop table if exists Users;
drop table if exists Matches;
drop table if exists Bookings;

-- ======================================
-- Database Create
create database football_ticket_booking;
-- ======================================


-- 1. CREATE "USERS" TABLE
create table Users (
  user_id serial primary key,
  full_name varchar(40) not null,
  email varchar(20) unique not null,
  role varchar(20) not null check(role in('Ticket Manager', 'Football Fan')),
  phone_number varchar(20)
);

-- 2. CREATE "MATCHES" TABLE
create table Matches (
    match_id serial primary key,
    fixture varchar(100) not null,
    tournament_category varchar(50) not null,
    base_ticket_price decimal(10,2) not null check (base_ticket_price > 0),
    match_status varchar(20) not null check (
    match_status in ('Available', 'Selling Fast', 'Sold Out','Postponed'))
);
  
-- 3. CREATE "BOOKINGS" TABLE
create table Bookings (
    booking_id serial primary key,
    user_id int references users(user_id) not null,
    match_id int references matches(match_id) not null,
    seat_number varchar(10),
    payment_status varchar(20) check (
    payment_status in ('Confirmed', 'Pending', 'Cancelled', 'Refunded')),
    total_cost decimal(10,2) not null CHECK (total_cost > 0)
);


-- 01. ===============================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO "USERS"
-- ===================================================

insert into users (user_id, full_name, email, role, phone_number)
values
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL),
(5, 'Rakib Hasan', 'rakib@mail.com', 'Football Fan', '+8801744444444'),
(6, 'Nusrat Jahan', 'nusrat@mail.com', 'Football Fan', NULL),
(7, 'Mehedi Hasan', 'mehedi@mail.com', 'Football Fan', '+8801766666666'),
(8, 'Farhan Ahmed', 'farhan@mail.com', 'Football Fan', '+8801777777777'),
(9, 'Rifat Hossain', 'rifat@mail.com', 'Football Fan', NULL),
(10, 'Mim Akter', 'mim@mail.com', 'Football Fan', '+8801788888888'),
(11, 'Arif Islam', 'arif@mail.com', 'Ticket Manager', '+8801799999999'),
(12, 'Sabbir Ahmed', 'sabbir@mail.com', 'Football Fan', NULL),
(13, 'Priya Sharma', 'priya@mail.com', 'Football Fan', '+8801811111111'),
(14, 'Ayaan Ali', 'ayaan@mail.com', 'Football Fan', NULL),
(15, 'Lina Rahman', 'lina@mail.com', 'Football Fan', '+8801833333333'),
(16, 'Mark Taylor', 'mark@mail.com', 'Football Fan', '+8801844444444'),
(17, 'Sophia Lee', 'sophia@mail.com', 'Football Fan', NULL),
(18, 'Daniel Martinez', 'daniel@mail.com', 'Football Fan', '+8801855555555'),
(19, 'Emma Brown', 'emma@mail.com', 'Football Fan', NULL),
(20, 'John Smith', 'john@mail.com', 'Ticket Manager', '+8801877777777');


-- 02. ==================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO "MATCHES"
-- ======================================================
insert into Matches (match_id, fixture, tournament_category, base_ticket_price, match_status)
values
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available'),
(106, 'Arsenal vs Chelsea', 'Premier League', 110.00, 'Available'),
(107, 'PSG vs Dortmund', 'Champions League', 140.00, 'Available'),
(108, 'Barcelona vs Atletico Madrid', 'La Liga', 125.00, 'Selling Fast'),
(109, 'Inter Milan vs Napoli', 'Serie A', 95.00, 'Available'),
(110, 'Real Madrid vs Man City', 'Champions League', 155.00, 'Sold Out');


-- 03. =================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO "BOOKINGS"
-- =====================================================

insert into Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost)
values
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Refunded', 150.00),
(504, 2, 103, 'C-15', 'Pending', 130.00),
(505, 3, 102, 'C-20', 'Pending', 120.00),
(506, 4, 104, 'D-10', 'Confirmed', 90.00),
(507, 5, 105, 'E-05', NULL, 80.00),
(508, 6, 106, 'F-12', 'Pending', 110.00),
(509, 7, 107, 'F-08', 'Confirmed', 140.00),
(510, 8, 108, 'G-11', NULL, 125.00),
(511, 9, 109, 'H-03', 'Pending', 95.00),
(512, 10, 110, 'I-15', 'Confirmed', 155.00),
(513, 11, 101, 'J-09', 'Cancelled', 150.00),
(514, 12, 102, 'K-18', 'Pending', 120.00),
(515, 13, 103, 'L-21', NULL, 130.00);


-- =================
-- SQL Queries
-- =================

-- Query 1: Retrieve all upcoming football matches belonging to the
-- 'Champions League' where the match status is 'Available'.

select match_id, fixture, round(base_ticket_price) as base_ticket_price from matches
where tournament_category = 'Champions League';

  
-- Query 2: Search for all users whose full names start with 'Tanvir'
-- or contain the phrase 'Haque' (case-insensitive).

select user_id, full_name, email from users
where full_name like 'Tanvir%' or full_name like '%Haque%';

  
-- Query 3: Retrieve all booking records where the payment status is missing (NULL),
--replacing the empty result with 'Action Required'.

select booking_id, user_id, match_id, coalesce(payment_status,'Action Required')
as systematic_status
from bookings
where payment_status is Null ;

  
-- Query 4: Retrieve match booking details along with the User's
-- full name and the scheduled Match fixture teams.

select booking_id, full_name, fixture, round(total_cost) as total_cost from bookings
inner join matches on bookings.match_id = matches.match_id
inner join users on bookings.user_id = users.user_id;


-- Query 5: Display a comprehensive list of all users and their booking IDs,
-- ensuring that fans who have never bought a ticket are still listed.

select users.user_id, users.full_name, bookings.booking_id from users
left join bookings on bookings.user_id = users.user_id;

  
-- Query 6: Find all ticket bookings where the total cost is strictly
-- higher than the average cost of all ticket bookings.

select booking_id, match_id, round(total_cost) as total_cost from bookings
where total_cost > (
    select avg(total_cost)
    from bookings
);


-- Query 7: Retrieve the top 2 most expensive matches sorted by base
-- ticket price, skipping the absolute highest premium match.
select match_id, fixture, base_ticket_price
from matches
order by base_ticket_price desc
limit 2 offset 1;