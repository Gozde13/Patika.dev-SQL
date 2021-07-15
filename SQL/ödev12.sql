--1-film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?

    SELECT COUNT(length)
    FROM film
    WHERE length > (SELECT AVG(length) FROM film);
    
--2-film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

    SELECT COUNT(rental_rate)
    FROM film
    WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

--3-film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.

    SELECT title
    FROM film
    WHERE (rental_rate=(SELECT  MIN(rental_rate) FROM film)) AND  (replacement_cost = (SELECT MIN(replacement_cost) FROM film));

--4-payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

    SELECT COUNT(*) AS shopping_number, first_name, last_name FROM payment
    JOIN customer ON payment.customer_id = customer.customer_id
    GROUP BY first_name, last_name
    ORDER BY shopping_number DESC;
    
--bu soruyu en fazla harcama yapan müşteri için şu şekilde çözebiliriz.

    SELECT SUM(amount), customer.first_name, customer.last_name
    FROM payment
    JOIN customer ON customer.customer_id = payment.customer_id
    GROUP BY payment.customer_id, customer.first_name, customer.last_name
    ORDER BY SUM(amount) DESC
    LIMIT 1;