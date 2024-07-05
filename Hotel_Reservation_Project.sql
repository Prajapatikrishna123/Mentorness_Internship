SELECT * FROM hotel_reservation.hotel_data;
-- 1. What is the total number of reservations in the dataset?
select count(*) as total_reservations from hotel_reservation.hotel_data; 

-- 2. Which meal plan is the most popular among guests?
select type_of_meal_plan, count(*) as plan_count
from hotel_reservation.hotel_data
group by type_of_meal_plan
order by plan_count desc limit 1;

-- 3. What is the average price per room for reservations involving children?
select avg(avg_price_per_room) as avg_price_with_children
from hotel_reservation.hotel_data 
where no_of_children >=1;

-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)?
select count(*) as reservation_in_2017
from hotel_reservation.hotel_data
where arrival_date like '%2017%';

-- 5. What is the most commonly booked room type?
select room_type_reserved, count(*) as count_room_type
from hotel_reservation.hotel_data
group by room_type_reserved
order by count_room_type desc limit 1;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select count(*) as weekend_reservation
from hotel_reservation.hotel_data
where no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?
select max(lead_time) as Highest_lead_time,
min(lead_time) as lowest_lead_time 
from hotel_reservation.hotel_data;

-- 8. What is the most common market segment type for reservations?
select market_segment_type, count(*) as most_common_segment_type
from hotel_reservation.hotel_data
group by market_segment_type
order by most_common_segment_type desc limit 1;

-- 9. How many reservations have a booking status of "Confirmed"?
select count(booking_status) as confirmed_reservation
from hotel_reservation.hotel_data
where booking_status = 'Not_Canceled';

-- 10. What is the total number of adults and children across all reservations?
select sum(no_of_adults) as total_adults,
sum(no_of_children) as total_children
from hotel_reservation.hotel_data;

-- 11. What is the average number of weekend nights for reservations involving children?
select avg(no_of_weekend_nights) as avg_weekend_night_with_children
from hotel_reservation.hotel_data
where no_of_children >=1;

-- 12. How many reservations were made in each month of the year?
select month(str_to_date(arrival_date,'%d-%m-%y')) as month,
count(*) as reservation_count from hotel_reservation.hotel_data
group by month order by month;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select room_type_reserved,
(avg(no_of_weekend_nights + no_of_week_nights)) as avg_nights
from hotel_reservation.hotel_data 
group by room_type_reserved;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
select room_type_reserved as most_common_type,
count(*) as count, avg(avg_price_per_room) as avg_price
from hotel_reservation.hotel_data
where no_of_children >=1
group by room_type_reserved
order by room_type_reserved asc limit 1;

-- 15. Find the market segment type that generates the highest average price per room.
select market_segment_type , avg(avg_price_per_room) as highest_average_price_per_room
from hotel_reservation.hotel_data
group by market_segment_type
order by highest_average_price_per_room desc limit 1;