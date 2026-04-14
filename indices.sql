create database taller_indices;
use taller_indices;


create table transactions (
	id int auto_increment primary key,
	user_id int,
	amount decimal(10,2),
	status varchar(20),
	create_at datetime
);

INSERT INTO transactions (user_id, amount, status, create_at) VALUES
(1, 150000.00, 'APPROVED', '2026-01-01 08:00:00'),
(2, 89000.50, 'PENDING', '2026-01-02 09:15:00'),
(3, 230000.00, 'APPROVED', '2026-01-03 10:30:00'),
(10, 45000.00, 'REJECTED', '2026-01-04 11:00:00'),
(10, 310000.75, 'APPROVED', '2026-01-05 12:00:00'),
(5, 75000.00, 'PENDING', '2026-01-06 13:00:00'),
(6, 120000.00, 'APPROVED', '2026-01-07 14:00:00'),
(7, 95000.00, 'REJECTED', '2026-01-08 15:00:00'),
(10, 180000.00, 'APPROVED', '2026-01-09 16:00:00'),
(9, 60000.00, 'PENDING', '2026-01-10 17:00:00'),
(10, 220000.00, 'APPROVED', '2026-01-11 08:30:00'),
(2, 135000.00, 'APPROVED', '2026-01-12 09:45:00'),
(3, 98000.00, 'REJECTED', '2026-01-13 10:00:00'),
(10, 410000.00, 'APPROVED', '2026-01-14 11:30:00'),
(5, 55000.00, 'PENDING', '2026-01-15 12:30:00'),
(6, 175000.00, 'APPROVED', '2026-01-16 13:30:00'),
(7, 88000.00, 'APPROVED', '2026-01-17 14:30:00'),
(10, 320000.00, 'REJECTED', '2026-01-18 15:30:00'),
(9, 145000.00, 'APPROVED', '2026-01-19 16:30:00'),
(10, 265000.00, 'APPROVED', '2026-01-20 17:30:00');

EXPLAIN SELECT * FROM transactions WHERE user_id = 10;
EXPLAIN SELECT * FROM transactions WHERE user_id = 10 AND status = 'APPROVED';
EXPLAIN SELECT * FROM transactions WHERE status = 'APPROVED' ORDER BY create_at DESC;

CREATE INDEX idx_user_id ON transactions(user_id);
CREATE INDEX idx_user_status ON transactions(user_id, status);
CREATE INDEX idx_status_create ON transactions(status, create_at);