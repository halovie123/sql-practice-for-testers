# 30 bài thực hành SQL trên Sakila

> Mục tiêu: luyện SELECT, JOIN, GROUP BY, HAVING, subquery và kiểm thử toàn vẹn dữ liệu trong vai trò QA/Tester.

## Cách luyện

1. Chọn một bài, viết truy vấn trong MySQL Workbench mà không mở đáp án.
2. Chạy SQL trên database `sakila`. Ghi chú số dòng và kết quả quan sát.
3. Mở [`answers.sql`](answers.sql), tìm `-- Bài XX` tương ứng để so sánh cú pháp và logic.
4. Với bài kiểm tra dữ liệu sai phạm, **0 dòng** có thể là kết quả PASS.
5. Truy vấn chỉ đọc (`SELECT`) – không tự ý thay đổi dữ liệu mẫu.

| STT | Nhóm | Đề bài | Bảng gợi ý | Kỹ thuật | Đáp án |
|---:|---|---|---|---|---|
| 01 | SELECT cơ bản | Liệt kê 10 phim dài nhất. Trả về title, length. Nếu bằng thời lượng, sắp theo film_id tăng dần. | `film` | ORDER BY, LIMIT | [Bài 01](answers.sql) |
| 02 | SELECT cơ bản | Liệt kê tên và giá thuê của phim có rental_rate = 0.99, sắp theo title. | `film` | WHERE, ORDER BY | [Bài 02](answers.sql) |
| 03 | SELECT cơ bản | Liệt kê các mức phân loại độ tuổi rating khác nhau. | `film` | DISTINCT | [Bài 03](answers.sql) |
| 04 | SELECT cơ bản | Đếm số phim theo từng rating, sắp xếp rating tăng dần. | `film` | GROUP BY, COUNT | [Bài 04](answers.sql) |
| 05 | SELECT cơ bản | Liệt kê các phim có tiêu đề bắt đầu bằng chữ A, không phân biệt chữ hoa/thường. | `film` | LIKE | [Bài 05](answers.sql) |
| 06 | SELECT cơ bản | Tìm các phim có thời lượng từ 90 đến 120 phút (bao gồm hai đầu), sắp xếp thời lượng tăng dần. | `film` | BETWEEN | [Bài 06](answers.sql) |
| 07 | SELECT cơ bản | Liệt kê 10 phim có replacement_cost cao nhất, gồm title và replacement_cost. | `film` | ORDER BY, LIMIT | [Bài 07](answers.sql) |
| 08 | SELECT cơ bản | Tìm phim có rating là PG hoặc PG-13 và rental_duration từ 5 ngày trở lên. | `film` | IN, AND | [Bài 08](answers.sql) |
| 09 | JOIN | Liệt kê tối đa 20 cặp diễn viên–phim (tên diễn viên và tiêu đề phim), sắp xếp theo actor_id, film_id. | `actor, film_actor, film` | INNER JOIN | [Bài 09](answers.sql) |
| 10 | JOIN | Liệt kê tất cả phim và thể loại tương ứng. | `film, film_category, category` | JOIN nhiều bảng | [Bài 10](answers.sql) |
| 11 | JOIN | Liệt kê khách hàng cùng thành phố và quốc gia của địa chỉ, sắp theo customer_id. | `customer, address, city, country` | JOIN nhiều bảng | [Bài 11](answers.sql) |
| 12 | JOIN | Hiển thị 20 lượt thuê gần nhất kèm tên khách hàng. | `rental, customer` | JOIN, ORDER BY | [Bài 12](answers.sql) |
| 13 | JOIN | Liệt kê 20 bản DVD trong kho kèm tiêu đề phim và cửa hàng (store_id). | `inventory, film` | JOIN | [Bài 13](answers.sql) |
| 14 | JOIN | Hiển thị 20 giao dịch thanh toán kèm tên khách hàng; sắp theo payment_date gần nhất. | `payment, customer` | JOIN | [Bài 14](answers.sql) |
| 15 | JOIN | Tìm các phim chưa có bản DVD nào trong bảng inventory. | `film, inventory` | LEFT JOIN, IS NULL | [Bài 15](answers.sql) |
| 16 | JOIN | Tìm khách hàng chưa từng có giao dịch thuê phim; truy vấn có thể trả về 0 dòng trên Sakila gốc. | `customer, rental` | LEFT JOIN, IS NULL | [Bài 16](answers.sql) |
| 17 | GROUP BY | Tìm top 5 diễn viên tham gia nhiều phim nhất, gồm mã, họ tên, số phim. | `actor, film_actor` | COUNT, GROUP BY, LIMIT | [Bài 17](answers.sql) |
| 18 | GROUP BY | Đếm số phim của từng thể loại; kể cả thể loại chưa có phim. | `category, film_category` | LEFT JOIN, COUNT | [Bài 18](answers.sql) |
| 19 | GROUP BY | Tìm top 10 khách hàng có tổng số tiền thanh toán cao nhất. | `customer, payment` | SUM, GROUP BY | [Bài 19](answers.sql) |
| 20 | GROUP BY | Thống kê số lượt thuê phim theo tháng (YYYY-MM), sắp theo tháng tăng dần. | `rental` | DATE_FORMAT, GROUP BY | [Bài 20](answers.sql) |
| 21 | GROUP BY | Tìm tiêu đề phim xuất hiện nhiều hơn một lần. | `film` | GROUP BY, HAVING | [Bài 21](answers.sql) |
| 22 | GROUP BY | Đếm số bản DVD (inventory) tại từng cửa hàng. | `store, inventory` | LEFT JOIN, COUNT | [Bài 22](answers.sql) |
| 23 | GROUP BY | Tìm khách hàng có từ 30 lượt thuê phim trở lên, sắp theo lượt thuê giảm dần. | `customer, rental` | HAVING COUNT | [Bài 23](answers.sql) |
| 24 | Subquery / Testing | Tìm phim dài hơn thời lượng trung bình của tất cả các phim. | `film` | Subquery AVG | [Bài 24](answers.sql) |
| 25 | Subquery / Testing | Tìm mức giá thuê cao thứ hai khác biệt (distinct) trong bảng film. | `film` | Subquery MAX | [Bài 25](answers.sql) |
| 26 | Subquery / Testing | Tìm các phim có thời lượng lớn hơn thời lượng trung bình của chính nhóm rating đó. | `film` | Correlated subquery | [Bài 26](answers.sql) |
| 27 | Subquery / Testing | Tìm diễn viên chưa từng được gắn với phim nào, dùng NOT EXISTS. | `actor, film_actor` | NOT EXISTS | [Bài 27](answers.sql) |
| 28 | Subquery / Testing | Database test: Tìm payment có rental_id khác NULL nhưng không có rental tương ứng. Kỳ vọng 0 dòng. | `payment, rental` | LEFT JOIN, orphan check | [Bài 28](answers.sql) |
| 29 | Subquery / Testing | Database test: Tìm giao dịch chưa trả (return_date IS NULL) nhưng thiếu inventory tương ứng. Kỳ vọng 0 dòng. | `rental, inventory` | LEFT JOIN, integrity | [Bài 29](answers.sql) |
| 30 | Subquery / Testing | Database test: Tìm payment gắn với rental nhưng customer_id của payment khác customer_id của rental. Kỳ vọng 0 dòng nếu quy tắc người trả tiền chính là người thuê. | `payment, rental` | JOIN, business consistency | [Bài 30](answers.sql) |

## Ghi chú

- Các câu 15, 16, 21, 27, 28, 29, 30 có thể không trả về dòng nào trên bản Sakila chuẩn; điều đó không tự động có nghĩa SQL bị lỗi.
- Câu 25 tìm **giá thuê cao thứ hai phân biệt**, không phải dòng đứng thứ hai khi sắp xếp.
- Câu 30 dựa trên **giả định nghiệp vụ** người thanh toán phải là người thuê; cần xác nhận yêu cầu trước khi báo lỗi thật.
- Không dùng `LIMIT` mà không có `ORDER BY` nếu cần kết quả ổn định.
