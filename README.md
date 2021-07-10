# Patika.dev-SQL
## ÖDEV 1 - Dvdrental veritabanından film ve customer tablolarında sorgulamalar yapılmıştır.



 ### 1-film tablosunda bulunan title ve description sütunlarındaki verileri sıralayınız.

     SELECT title, description FROM film;
     
### 2-film tablosunda bulunan tüm sütunlardaki verileri film uzunluğu (length) 60 dan büyük VE 75 ten küçük olma koşullarıyla sıralayınız.   

    SELECT * FROM film

    WHERE length > 60 AND length < 75;

### 3-film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma koşullarıyla sıralayınız.

    SELECT * FROM film
    
    WHERE rental_rate = 0.99 AND (replacement_cost = 12.99 OR replacement_cost =28.99);

### 4-customer tablosunda bulunan first_name sütunundaki değeri 'Mary' olan müşterinin last_name sütunundaki değeri nedir?

    SELECT last_name FROM customer
   
    WHERE first_name = 'Mary';

### 5-film tablosundaki uzunluğu(length) 50 ten büyük OLMAYIP aynı zamanda rental_rate değeri 2.99 veya 4.99 OLMAYAN verileri sıralayınız.

    SELECT * FROM film
  
    WHERE length <= 50 AND NOT (rental_rate = 2.99 OR rental_rate = 4.99);


## Ödev 2 BETWEEN AND ve IN yapıları kullanılarak sorgulamalar yapılmıştır.

### 1-film tablosunda bulunan tüm sütunlardaki verileri replacement cost değeri 12.99 dan büyük eşit ve 16.99 küçük olma koşuluyla
sıralayınız ( BETWEEN - AND yapısını kullanınız.)
      
    SELECT * FROM film
   
    WHERE replacement_cost BETWEEN 12.99 AND 16.99;

### 2. actor tablosunda bulunan first_name ve last_name sütunlardaki verileri first_name 'Penelope' veya 'Nick' veya 'Ed' değerleri olması
koşuluyla sıralayınız. ( IN operatörünü kullanınız.)

    SELECT first_name, last_name FROM actor
    WHERE first_name IN('Penelope', 'Nick', 'Ed');
    
### 3. film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99, 2.99, 4.99 VE replacement_cost 12.99, 15.99, 28.99 olma koşullarıyla sıralayınız.
(IN operatörünü kullanınız.)

    SELECT * FROM film
    WHERE rental_rate IN (0.99, 2.99, 4.99) AND replacement_cost IN (12.99, 15.99, 28.99);
    
## ÖDEV 3

### 1-country tablosunda bulunan country sütunundaki ülke isimlerinden 'A' karakteri ile başlayıp 'a' karakteri ile sonlananları sıralayınız.

    SELECT country  FROM country
    WHERE country LIKE 'A%a';
    
### 2-country tablosunda bulunan country sütunundaki ülke isimlerinden en az 6 karakterden oluşan ve sonu 'n' karakteri ile sonlananları sıralayınız.

    SELECT country  FROM country
    WHERE country LIKE '_____%n'; 
            
    ya da benzer şekilde böyle de yazılabilir.
    
    SELECT country FROM country
    WHERE length(country)>=6 AND country LIKE '%n';
    
### 3-film tablosunda bulunan title sütunundaki film isimlerinden en az 4 adet büyük ya da küçük harf farketmesizin 'T' karakteri içeren film isimlerini sıralayınız.

    SELECT title FROM film
    WHERE title ILIKE '%t%t%t%t';
    
### 4. film tablosunda bulunan tüm sütunlardaki verilerden title 'C' karakteri ile başlayan ve uzunluğu (length) 90 dan büyük olan ve rental_rate 2.99 olan verileri sıralayınız.   
    SELECT title FROM film
    WHERE title LIKE 'C%' AND  length >90 AND rental_rate = 2.99; 
    
## ÖDEV 4 
    
### 1-film tablosunda bulunan replacement_cost sütununda bulunan birbirinden farklı değerleri sıralayınız.
 
    SELECT DISTINCT(replacement_cost) FROM film;

### 2-film tablosunda bulunan replacement_cost sütununda birbirinden farklı kaç tane veri vardır?

    SELECT COUNT( DISTINCT replacement_cost) FROM film;
### 3-film tablosunda bulunan film isimlerinde (title) kaç tanesini T karakteri ile başlar ve aynı zamanda rating 'G' ye eşittir?

    SELECT count(title) FROM film
    WHERE title LIKE 'T%' AND rating = 'G'; 

### 4-country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluşmaktadır?

    SELECT COUNT (country) FROM country
    WHERE LENGTH(country) = 5;

### 5-city tablosundaki şehir isimlerinin kaçtanesi 'R' veya r karakteri ile biter?
    
    
    SELECT COUNT(city) FROM city
    WHERE city ILIKE '%r';
    
## ÖDEV 5
 
### 1-film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi sıralayınız.

    SELECT title FROM film
    WHERE title LIKE '%n' 
    ORDER BY length DESC
    LIMIT 5;

### 2-film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en kısa (length) ikinci 5 filmi sıralayınız.

    SELECT title FROM film
    WHERE title LIKE '%n' 
    ORDER BY length ASC
    OFFSET 5
    LIMIT 5;

### 3-customer tablosunda bulunan last_name sütununa göre azalan yapılan sıralamada store_id 1 olmak koşuluyla ilk 4 veriyi sıralayınız.
    
    SELECT * FROM customer
    WHERE store_id = 1
    ORDER BY last_name DESC;
    LIMIT 4;
    
## ÖDEV 6
  
### 1-film tablosunda bulunan rental_rate sütunundaki değerlerin ortalaması nedir?

    SELECT ROUND(AVG(rental_rate),5) FROM film;  
    
### 2-film tablosunda bulunan filmlerden kaçtanesi 'C' karekteri ile başlar?

    SELECT COUNT(title) FROM film
    WHERE title LIKE 'C%';
    
### 3-film tablosunda bulunan filmlerden rental_rate değeri 0.99 a eşit olan en uzun (length) film kaç dakikadır?
    
    SELECT MAX(length) FROM film
    WHERE rental_rate = 0.99;
    
### 4-film tablosunda bulunan filmlerin uzunluğu 150 dakikadan büyük olanlarına ait kaç farklı replacement_cost değeri vardır?
    
    SELECT COUNT(DISTINCT(replacement_cost)) FROM film
    WHERE  length > 150;
    
## ÖDEV 7    
    
### 1-film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.

    SELECT rating FROM film
    GROUP BY rating;
### 2-film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda film sayısı 50 den fazla olan replacement_cost değerinive karşılık gelen film sayısını sıralayınız.

    SELECT replacement_cost, COUNT(*) FROM film
    GROUP BY replacement_cost
    HAVING COUNT(*) > 50;

### 3-customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir?

    SELECT store_id, COUNT(*) FROM customer
    GROUP BY store_id;
    
### 4-city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra en fazla şehir sayısı barındıra country_id bilgisini ve şehir sayısını paylaşınız.
    
    SELECT country_id, COUNT(*) FROM city
    GROUP BY country_id
    ORDER BY count DESC
    LIMIT 1;
    
    
## ÖDEV 8

### 1-	test veritabanınızda employee isimli sütun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE, email VARCHAR(100) olan bir tablo oluşturalım.

    CREATE TABLE employee (
      id INTEGER PRIMARY KEY,
      first_name VARCHAR(50) NOT NULL,
      last_name VARCHAR(50) NOT NULL,
      email VARCHAR(100),
      birthday DATE
    );

### 2-	Oluşturduğumuz employee tablosuna 'Mockaroo' servisini kullanarak 50 adet veri ekleyelim.
#### 1. soruda oluşturduğum employees tablosuna uygun 'Mockaroo' sitesini kullanarak oluşturduğum 50 satırlık veri.

    insert into employee (id, name, email, birthday) values (1, 'Kellen', 'khauxley0@businessweek.com', '2020-10-19');
    insert into employee (id, name, email, birthday) values (2, 'Adamo', 'amatschuk1@mtv.com', '2021-04-04');
    insert into employee (id, name, email, birthday) values (3, 'Adolph', 'adale2@meetup.com', '2020-08-19');
    insert into employee (id, name, email, birthday) values (4, 'Cooper', 'ctute3@google.co.uk', '2021-06-17');
    insert into employee (id, name, email, birthday) values (5, 'Cassandra', 'cdanell4@cbc.ca', '2020-11-02');
    insert into employee (id, name, email, birthday) values (6, 'Karly', 'kfruish5@usnews.com', '2021-05-07');
    insert into employee (id, name, email, birthday) values (7, 'Berget', null, null);
    insert into employee (id, name, email, birthday) values (8, 'Bessie', 'bbearsmore7@nsw.gov.au', '2020-08-10');
    insert into employee (id, name, email, birthday) values (9, 'Ferris', 'feskrick8@zimbio.com', '2020-07-25');
    insert into employee (id, name, email, birthday) values (10, 'Merell', null, null);
    insert into employee (id, name, email, birthday) values (11, 'Heriberto', 'hredwooda@china.com.cn', '2020-07-11');
    insert into employee (id, name, email, birthday) values (12, 'Burr', 'bferrinob@alibaba.com', '2020-11-15');
    insert into employee (id, name, email, birthday) values (13, 'Monika', 'mpischoffc@so-net.ne.jp', '2020-07-15');
    insert into employee (id, name, email, birthday) values (14, 'Felicle', 'fraisherd@webs.com', '2020-08-03');
    insert into employee (id, name, email, birthday) values (15, 'Jen', 'jklosse@merriam-webster.com', '2020-09-30');
    insert into employee (id, name, email, birthday) values (16, 'Sauveur', 'sperrellef@gov.uk', '2021-06-11');
    insert into employee (id, name, email, birthday) values (17, 'Shurlocke', 'sledwitchg@domainmarket.com', '2021-06-03');
    insert into employee (id, name, email, birthday) values (18, 'Jerome', 'jdodmanh@miitbeian.gov.cn', '2020-08-15');
    insert into employee (id, name, email, birthday) values (19, 'Dollie', 'ddurnini@usgs.gov', '2020-11-11');
    insert into employee (id, name, email, birthday) values (20, 'Cris', 'cnelthroppj@dagondesign.com', '2020-08-21');
    insert into employee (id, name, email, birthday) values (21, 'Frasier', 'fwinkettk@arizona.edu', '2020-07-29');
    insert into employee (id, name, email, birthday) values (22, 'Eolande', 'edimsdalel@ebay.co.uk', '2020-11-26');
    insert into employee (id, name, email, birthday) values (23, 'Traver', 'tleperem@buzzfeed.com', '2021-04-30');
    insert into employee (id, name, email, birthday) values (24, 'Griffin', 'gtezuren@bbb.org', '2021-06-06');
    insert into employee (id, name, email, birthday) values (25, 'Gavrielle', 'gmckewo@uiuc.edu', '2021-07-01');
    insert into employee (id, name, email, birthday) values (26, 'Talya', 'tbockmanp@about.com', '2021-05-22');
    insert into employee (id, name, email, birthday) values (27, 'Hurley', 'hperseyq@soup.io', '2020-08-27');
    insert into employee (id, name, email, birthday) values (28, 'Deina', 'dplumber@shop-pro.jp', '2021-07-09');
    insert into employee (id, name, email, birthday) values (29, 'Nessy', 'ngeartys@lulu.com', '2020-12-26');
    insert into employee (id, name, email, birthday) values (30, 'Sigfrid', 'sluttgertt@bbc.co.uk', '2021-03-18');
    insert into employee (id, name, email, birthday) values (31, 'Glynn', 'glangrishu@blogtalkradio.com', '2021-01-27');
    insert into employee (id, name, email, birthday) values (32, 'Livia', 'lbythewayv@engadget.com', '2020-09-13');
    insert into employee (id, name, email, birthday) values (33, 'Israel', 'ireisenw@wunderground.com', '2021-07-09');
    insert into employee (id, name, email, birthday) values (34, 'Hakim', 'horodanex@google.ru', '2021-05-25');
    insert into employee (id, name, email, birthday) values (35, 'Levy', null, null);
    insert into employee (id, name, email, birthday) values (36, 'Gertie', 'gmournianz@sbwire.com', '2021-06-04');
    insert into employee (id, name, email, birthday) values (37, 'Amata', 'abrugsma10@mysql.com', '2020-08-30');
    insert into employee (id, name, email, birthday) values (38, 'Carlita', 'ckahen11@smugmug.com', '2021-06-18');
    insert into employee (id, name, email, birthday) values (39, 'Rik', null, null);
    insert into employee (id, name, email, birthday) values (40, 'Jillene', 'jstoffels13@networkadvertising.org', '2020-10-08');
    insert into employee (id, name, email, birthday) values (41, 'Elladine', 'ebance14@twitpic.com', '2021-03-04');
    insert into employee (id, name, email, birthday) values (42, 'Pietro', 'pstollenhof15@va.gov', '2021-07-06');
    insert into employee (id, name, email, birthday) values (43, 'Marie-jeanne', 'mhellens16@comcast.net', '2021-03-17');
    insert into employee (id, name, email, birthday) values (44, 'Emmye', 'egame17@topsy.com', '2021-06-05');
    insert into employee (id, name, email, birthday) values (45, 'Ive', 'icossins18@blog.com', '2020-11-27');
    insert into employee (id, name, email, birthday) values (46, 'Sandye', 'sbencher19@statcounter.com', '2020-08-24');
    insert into employee (id, name, email, birthday) values (47, 'Ladonna', 'lferrini1a@auda.org.au', '2020-10-28');
    insert into employee (id, name, email, birthday) values (48, 'Xenos', 'xfinney1b@rakuten.co.jp', '2021-05-27');
    insert into employee (id, name, email, birthday) values (49, 'Corena', 'cwhiles1c@sogou.com', '2021-03-26');
    insert into employee (id, name, email, birthday) values (50, 'Bent', 'blyptrade1d@amazon.co.jp', '2021-05-01');
    
    
### 3-Sütunların her birine göre diğer sütunları güncelleyecek 5 adet UPDATE işlemi yapalım.

    UPDATE employee
     SET name = 'Darcey'
	    WHERE id = 2;
    
    UPDATE employee
     SET birthday = '1999-05-11'
     WHERE id=8;
    
    UPDATE employee
     SET birthday = NULL
     WHERE id<4 ;

    UPDATE employee
     SET name = 'Ella'
     WHERE id = 41;
     
     UPDATE employee
      SET birtday = '1990-02-02
      WHERE name = 'Levy';





### 4-	Sütunların her birine göre ilgili satırı silecek 5 adet DELETE işlemi yapalım.
   
    DELETE FROM employee
     WHERE birthday ='2021-05-07' 
     RETURNING *;
   
    DELETE FROM employee
     WHERE name ='Bent' 
     RETURNING *;
   
    DELETE FROM employee
     WHERE email ='xfinney1b@rakuten.co.jp' 
     RETURNING *;
    
    DELETE FROM employee
     WHERE name = 'Jen'
     RETURNING *;
    
    DELETE FROM employee
     WHERE birthday ='2020-07-15' 
     RETURNING *;

## ÖDEV 9

### 1-city tablosu ile country tablosunda bulunan şehir (city) ve ülke (country) isimlerini birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.

    SELECT country, city FROM city
    JOIN country ON country.country_id = city.country_id;

#### 2-customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.

    SELECT payment_id, first_name, last_name 
    FROM customer
    JOIN payment ON customer.customer_id = payment.customer_id;

### 3- customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimi INNER JOIN sorgusunu yazınız.

    SELECT rental_id, first_name, last_name
    FROM customer
    JOIN rental ON customer.customer_id = rental.customer_id;





    
    
