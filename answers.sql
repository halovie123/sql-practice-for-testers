-- SQL PRACTICE FOR TESTERS | 30 SAKILA SOLUTIONS
-- Open with MySQL Workbench. You can select and execute a single query.
-- All questions are SELECT only; no database writes.
-- Matching questions are in questions.md.

USE sakila;

-- Bài 01 | SELECT cơ bản
-- Liệt kê 10 phim dài nhất. Trả về title, length. Nếu bằng thời lượng, sắp theo film_id tăng dần.
-- Bảng: film
-- Gợi ý: ORDER BY, LIMIT
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT title, length
FROM film
ORDER BY length DESC, film_id ASC
LIMIT 10;

-- =========================================================================

-- Bài 02 | SELECT cơ bản
-- Liệt kê tên và giá thuê của phim có rental_rate = 0.99, sắp theo title.
-- Bảng: film
-- Gợi ý: WHERE, ORDER BY
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT title, rental_rate
FROM film
WHERE rental_rate = 0.99
ORDER BY title;

-- =========================================================================

-- Bài 03 | SELECT cơ bản
-- Liệt kê các mức phân loại độ tuổi rating khác nhau.
-- Bảng: film
-- Gợi ý: DISTINCT
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT DISTINCT rating
FROM film
ORDER BY rating;

-- =========================================================================

-- Bài 04 | SELECT cơ bản
-- Đếm số phim theo từng rating, sắp xếp rating tăng dần.
-- Bảng: film
-- Gợi ý: GROUP BY, COUNT
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT rating, COUNT(*) AS so_phim
FROM film
GROUP BY rating
ORDER BY rating;

-- =========================================================================

-- Bài 05 | SELECT cơ bản
-- Liệt kê các phim có tiêu đề bắt đầu bằng chữ A, không phân biệt chữ hoa/thường.
-- Bảng: film
-- Gợi ý: LIKE
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT film_id, title
FROM film
WHERE UPPER(title) LIKE 'A%'
ORDER BY title;

-- =========================================================================

-- Bài 06 | SELECT cơ bản
-- Tìm các phim có thời lượng từ 90 đến 120 phút (bao gồm hai đầu), sắp xếp thời lượng tăng dần.
-- Bảng: film
-- Gợi ý: BETWEEN
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT title, length
FROM film
WHERE length BETWEEN 90 AND 120
ORDER BY length ASC, title ASC;

-- =========================================================================

-- Bài 07 | SELECT cơ bản
-- Liệt kê 10 phim có replacement_cost cao nhất, gồm title và replacement_cost.
-- Bảng: film
-- Gợi ý: ORDER BY, LIMIT
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT title, replacement_cost
FROM film
ORDER BY replacement_cost DESC, film_id ASC
LIMIT 10;

-- =========================================================================

-- Bài 08 | SELECT cơ bản
-- Tìm phim có rating là PG hoặc PG-13 và rental_duration từ 5 ngày trở lên.
-- Bảng: film
-- Gợi ý: IN, AND
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT title, rating, rental_duration
FROM film
WHERE rating IN ('PG', 'PG-13')
  AND rental_duration >= 5
ORDER BY title;

-- =========================================================================

-- Bài 09 | JOIN
-- Liệt kê tối đa 20 cặp diễn viên–phim (tên diễn viên và tiêu đề phim), sắp xếp theo actor_id, film_id.
-- Bảng: actor, film_actor, film
-- Gợi ý: INNER JOIN
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT a.actor_id, a.first_name, a.last_name, f.title
FROM actor AS a
JOIN film_actor AS fa ON fa.actor_id = a.actor_id
JOIN film AS f ON f.film_id = fa.film_id
ORDER BY a.actor_id, f.film_id
LIMIT 20;

-- =========================================================================

-- Bài 10 | JOIN
-- Liệt kê tất cả phim và thể loại tương ứng.
-- Bảng: film, film_category, category
-- Gợi ý: JOIN nhiều bảng
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT f.film_id, f.title, c.name AS category_name
FROM film AS f
JOIN film_category AS fc ON fc.film_id = f.film_id
JOIN category AS c ON c.category_id = fc.category_id
ORDER BY f.title, c.name;

-- =========================================================================

-- Bài 11 | JOIN
-- Liệt kê khách hàng cùng thành phố và quốc gia của địa chỉ, sắp theo customer_id.
-- Bảng: customer, address, city, country
-- Gợi ý: JOIN nhiều bảng
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT cu.customer_id, cu.first_name, cu.last_name,
       ci.city, co.country
FROM customer AS cu
JOIN address AS ad ON ad.address_id = cu.address_id
JOIN city AS ci ON ci.city_id = ad.city_id
JOIN country AS co ON co.country_id = ci.country_id
ORDER BY cu.customer_id;

-- =========================================================================

-- Bài 12 | JOIN
-- Hiển thị 20 lượt thuê gần nhất kèm tên khách hàng.
-- Bảng: rental, customer
-- Gợi ý: JOIN, ORDER BY
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT r.rental_id, r.rental_date, c.customer_id,
       c.first_name, c.last_name
FROM rental AS r
JOIN customer AS c ON c.customer_id = r.customer_id
ORDER BY r.rental_date DESC, r.rental_id DESC
LIMIT 20;

-- =========================================================================

-- Bài 13 | JOIN
-- Liệt kê 20 bản DVD trong kho kèm tiêu đề phim và cửa hàng (store_id).
-- Bảng: inventory, film
-- Gợi ý: JOIN
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT i.inventory_id, i.store_id, f.film_id, f.title
FROM inventory AS i
JOIN film AS f ON f.film_id = i.film_id
ORDER BY i.inventory_id
LIMIT 20;

-- =========================================================================

-- Bài 14 | JOIN
-- Hiển thị 20 giao dịch thanh toán kèm tên khách hàng; sắp theo payment_date gần nhất.
-- Bảng: payment, customer
-- Gợi ý: JOIN
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT p.payment_id, p.payment_date, p.amount,
       c.first_name, c.last_name
FROM payment AS p
JOIN customer AS c ON c.customer_id = p.customer_id
ORDER BY p.payment_date DESC, p.payment_id DESC
LIMIT 20;

-- =========================================================================

-- Bài 15 | JOIN
-- Tìm các phim chưa có bản DVD nào trong bảng inventory.
-- Bảng: film, inventory
-- Gợi ý: LEFT JOIN, IS NULL
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT f.film_id, f.title
FROM film AS f
LEFT JOIN inventory AS i ON i.film_id = f.film_id
WHERE i.inventory_id IS NULL
ORDER BY f.film_id;

-- =========================================================================

-- Bài 16 | JOIN
-- Tìm khách hàng chưa từng có giao dịch thuê phim; truy vấn có thể trả về 0 dòng trên Sakila gốc.
-- Bảng: customer, rental
-- Gợi ý: LEFT JOIN, IS NULL
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT c.customer_id, c.first_name, c.last_name
FROM customer AS c
LEFT JOIN rental AS r ON r.customer_id = c.customer_id
WHERE r.rental_id IS NULL
ORDER BY c.customer_id;

-- =========================================================================

-- Bài 17 | GROUP BY
-- Tìm top 5 diễn viên tham gia nhiều phim nhất, gồm mã, họ tên, số phim.
-- Bảng: actor, film_actor
-- Gợi ý: COUNT, GROUP BY, LIMIT
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT a.actor_id, a.first_name, a.last_name,
       COUNT(fa.film_id) AS so_phim
FROM actor AS a
JOIN film_actor AS fa ON fa.actor_id = a.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY so_phim DESC, a.actor_id ASC
LIMIT 5;

-- =========================================================================

-- Bài 18 | GROUP BY
-- Đếm số phim của từng thể loại; kể cả thể loại chưa có phim.
-- Bảng: category, film_category
-- Gợi ý: LEFT JOIN, COUNT
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT c.category_id, c.name AS category_name,
       COUNT(fc.film_id) AS so_phim
FROM category AS c
LEFT JOIN film_category AS fc ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name
ORDER BY so_phim DESC, c.name;

-- =========================================================================

-- Bài 19 | GROUP BY
-- Tìm top 10 khách hàng có tổng số tiền thanh toán cao nhất.
-- Bảng: customer, payment
-- Gợi ý: SUM, GROUP BY
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT c.customer_id, c.first_name, c.last_name,
       COALESCE(SUM(p.amount), 0) AS total_paid
FROM customer AS c
LEFT JOIN payment AS p ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_paid DESC, c.customer_id ASC
LIMIT 10;

-- =========================================================================

-- Bài 20 | GROUP BY
-- Thống kê số lượt thuê phim theo tháng (YYYY-MM), sắp theo tháng tăng dần.
-- Bảng: rental
-- Gợi ý: DATE_FORMAT, GROUP BY
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT DATE_FORMAT(rental_date, '%Y-%m') AS thang,
       COUNT(*) AS so_luot_thue
FROM rental
GROUP BY DATE_FORMAT(rental_date, '%Y-%m')
ORDER BY thang;

-- =========================================================================

-- Bài 21 | GROUP BY
-- Tìm tiêu đề phim xuất hiện nhiều hơn một lần.
-- Bảng: film
-- Gợi ý: GROUP BY, HAVING
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT title, COUNT(*) AS so_lan
FROM film
GROUP BY title
HAVING COUNT(*) > 1
ORDER BY so_lan DESC, title;

-- =========================================================================

-- Bài 22 | GROUP BY
-- Đếm số bản DVD (inventory) tại từng cửa hàng.
-- Bảng: store, inventory
-- Gợi ý: LEFT JOIN, COUNT
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT s.store_id, COUNT(i.inventory_id) AS so_ban_dvd
FROM store AS s
LEFT JOIN inventory AS i ON i.store_id = s.store_id
GROUP BY s.store_id
ORDER BY s.store_id;

-- =========================================================================

-- Bài 23 | GROUP BY
-- Tìm khách hàng có từ 30 lượt thuê phim trở lên, sắp theo lượt thuê giảm dần.
-- Bảng: customer, rental
-- Gợi ý: HAVING COUNT
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT c.customer_id, c.first_name, c.last_name,
       COUNT(r.rental_id) AS so_luot_thue
FROM customer AS c
JOIN rental AS r ON r.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) >= 30
ORDER BY so_luot_thue DESC, c.customer_id;

-- =========================================================================

-- Bài 24 | Subquery / Testing
-- Tìm phim dài hơn thời lượng trung bình của tất cả các phim.
-- Bảng: film
-- Gợi ý: Subquery AVG
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT film_id, title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film)
ORDER BY length DESC, film_id;

-- =========================================================================

-- Bài 25 | Subquery / Testing
-- Tìm mức giá thuê cao thứ hai khác biệt (distinct) trong bảng film.
-- Bảng: film
-- Gợi ý: Subquery MAX
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT MAX(rental_rate) AS second_highest_distinct_rate
FROM film
WHERE rental_rate < (SELECT MAX(rental_rate) FROM film);

-- =========================================================================

-- Bài 26 | Subquery / Testing
-- Tìm các phim có thời lượng lớn hơn thời lượng trung bình của chính nhóm rating đó.
-- Bảng: film
-- Gợi ý: Correlated subquery
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT f.film_id, f.title, f.rating, f.length
FROM film AS f
WHERE f.length > (
    SELECT AVG(f2.length)
    FROM film AS f2
    WHERE f2.rating = f.rating
)
ORDER BY f.rating, f.length DESC, f.film_id;

-- =========================================================================

-- Bài 27 | Subquery / Testing
-- Tìm diễn viên chưa từng được gắn với phim nào, dùng NOT EXISTS.
-- Bảng: actor, film_actor
-- Gợi ý: NOT EXISTS
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT a.actor_id, a.first_name, a.last_name
FROM actor AS a
WHERE NOT EXISTS (
    SELECT 1 FROM film_actor AS fa
    WHERE fa.actor_id = a.actor_id
)
ORDER BY a.actor_id;

-- =========================================================================

-- Bài 28 | Subquery / Testing
-- Database test: Tìm payment có rental_id khác NULL nhưng không có rental tương ứng. Kỳ vọng 0 dòng.
-- Bảng: payment, rental
-- Gợi ý: LEFT JOIN, orphan check
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT p.payment_id, p.rental_id
FROM payment AS p
LEFT JOIN rental AS r ON r.rental_id = p.rental_id
WHERE p.rental_id IS NOT NULL
  AND r.rental_id IS NULL
ORDER BY p.payment_id;

-- =========================================================================

-- Bài 29 | Subquery / Testing
-- Database test: Tìm giao dịch chưa trả (return_date IS NULL) nhưng thiếu inventory tương ứng. Kỳ vọng 0 dòng.
-- Bảng: rental, inventory
-- Gợi ý: LEFT JOIN, integrity
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT r.rental_id, r.inventory_id, r.customer_id
FROM rental AS r
LEFT JOIN inventory AS i ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NULL
  AND i.inventory_id IS NULL
ORDER BY r.rental_id;

-- =========================================================================

-- Bài 30 | Subquery / Testing
-- Database test: Tìm payment gắn với rental nhưng customer_id của payment khác customer_id của rental. Kỳ vọng 0 dòng nếu quy tắc người trả tiền chính là người thuê.
-- Bảng: payment, rental
-- Gợi ý: JOIN, business consistency
-- Lưu ý: các câu truy vấn đều chỉ đọc dữ liệu (SELECT).

SELECT p.payment_id, p.rental_id,
       p.customer_id AS paying_customer_id,
       r.customer_id AS renting_customer_id
FROM payment AS p
JOIN rental AS r ON r.rental_id = p.rental_id
WHERE p.customer_id <> r.customer_id
ORDER BY p.payment_id;
