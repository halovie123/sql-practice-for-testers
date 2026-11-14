# SQL Practice for Testers — Sakila (MySQL)

30 bài SQL có đáp án gộp trong một file `answers.sql` dành cho Manual Tester / Fresher QA: luyện truy vấn dữ liệu, JOIN, thống kê, subquery và kiểm tra tính nhất quán trong database.

## Mục tiêu học tập

- Truy vấn và lọc dữ liệu với `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`.
- Kết nối bảng bằng `INNER JOIN`, `LEFT JOIN` và hiểu khóa ngoại.
- Thống kê với `COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING`.
- Luyện `Subquery`, `NOT EXISTS` và truy vấn tương quan.
- Kiểm tra tính toàn vẹn và logic nghiệp vụ: bản ghi mồ côi, giao dịch liên kết sai khách hàng.

## Chuẩn bị

- **MySQL Server 8.x** và **MySQL Workbench** (hoặc SQL client tương thích MySQL).
- Database mẫu **Sakila**, tải chính thức tại: https://dev.mysql.com/doc/index-other.html
- Hướng dẫn cài Sakila: https://dev.mysql.com/doc/sakila/en/sakila-installation.html

### Cài Sakila trong MySQL Workbench (Windows)

1. Tải gói Sakila ZIP rồi giải nén. Gói có `sakila-schema.sql` và `sakila-data.sql`.
2. Mở MySQL Workbench, kết nối tới MySQL Server.
3. Dùng **File > Open SQL Script**, mở `sakila-schema.sql` và chạy toàn bộ script.
4. Mở `sakila-data.sql`, tiếp tục chạy toàn bộ script. **Thứ tự là schema trước, data sau**.
5. Kiểm tra bằng:

```sql
USE sakila;
SHOW TABLES;
SELECT COUNT(*) AS film_count FROM film;
```

Sakila chuẩn có **1.000 phim** trong bảng `film`.

Nếu đã cài Sakila ở những buổi học trước, **không import lại** để tránh thay đổi dữ liệu bạn đang sử dụng.

## Cấu trúc repository

```text
sql-practice-for-testers/
├── README.md                # Hướng dẫn và mục tiêu
├── questions.md             # Đề bài 01–30, nhóm theo kỹ năng
├── answers.sql             # Toàn bộ 30 đáp án, chia theo số bài bằng comment
└── .gitignore
```

## Cách luyện

1. Mở [`questions.md`](questions.md), chọn một câu và tự viết SQL trước.
2. Chạy câu truy vấn trong MySQL Workbench với `USE sakila;`.
3. Đối chiếu với câu trả lời trong [`answers.sql`](answers.sql), tìm phần chú thích `-- Bài XX`.
4. Ghi Pass/Fail cho câu kiểm thử dữ liệu **chỉ khi đã xác định rõ tiêu chí mong đợi**.
5. Có thể thử viết lại truy vấn bằng cách khác (JOIN ↔ subquery) và đối chiếu số dòng.

## Phân bố bài tập

| Cấp độ | Bài | Nội dung |
|---|---|---|
| Nền tảng | 01–08 | SELECT, WHERE, LIKE, BETWEEN, ORDER BY |
| Liên kết bảng | 09–16 | JOIN, LEFT JOIN, tìm bản ghi không có quan hệ |
| Thống kê | 17–23 | GROUP BY, SUM, COUNT, HAVING |
| Nâng cao và Testing | 24–30 | Subquery, NOT EXISTS, toàn vẹn dữ liệu |

## Nguyên tắc kiểm thử dữ liệu

- Những truy vấn phát hiện sai phạm kỳ vọng **0 dòng** khi dữ liệu hợp lệ.
- Một truy vấn trả 0 dòng không chứng minh cơ sở dữ liệu đã thực thi `UNIQUE` hay `FOREIGN KEY`; cần kiểm tra cấu trúc bảng.
- Không biến dữ liệu mẫu tùy ý thành bug. Mọi quy tắc nghiệp vụ phải được xác nhận.
- Chỉ dùng truy vấn `SELECT` trong bộ đáp án; thao tác `UPDATE`/`INSERT` cần transaction riêng để hoàn tác.

## Tài liệu tham khảo

- Sakila: https://dev.mysql.com/doc/sakila/en/
- SQLBolt: https://sqlbolt.com/
- MySQL Reference Manual: https://dev.mysql.com/doc/refman/8.4/en/

*Bộ câu hỏi và lời giải tự biên soạn cho mục đích học tập. Không kèm dữ liệu Sakila; vui lòng tải database từ MySQL.*
