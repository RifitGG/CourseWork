# CourseWork
> ## ⚠️ Для разворачивания БД и тестовых данных необходимо скачать и инициализировать файл dump.sql
---
## ER-Диаграмма
![img](https://github.com/RifitGG/CourseWork/blob/main/er.png)
 ## Типовые запросы:
```sql
-- 1) Список всех курсов с именем преподавателя
SELECT c.id, c.title, t.name
FROM courses c
JOIN teachers t ON c.teacher_id = t.id;
```
---
```sql
-- 2) Прогресс Alice по курсу 1
SELECT fn_user_progress(1,1) AS pct_done;
```
---
```sql
-- 3) Уроки курса 2
SELECT id, title, duration_min
FROM lessons
WHERE course_id = 2;
```
---
```sql
-- 4) Статистика по зачислениям
SELECT course_id, COUNT(*) AS students
FROM enrollments
GROUP BY course_id;
```
---
```sql
-- 5) Текущие активные сессии Alice
SELECT * FROM sessions
WHERE user_id = 1 AND completed_at IS NULL;
```
---
## Вызов view
```sql
SELECT * FROM eduplus.vw_course_overview;
```
> ### или
```sql
SELECT * FROM eduplus.vw_teacher_courses;
```
---
## Пример вызова хранимой процедуры
> ## ⚠️ Предварительно убедитесь, что у пользователя есть ненулевой баланс:
```sql
UPDATE users
SET balance = 1000.00
WHERE id = 1;
```
> ## Сам вызов
```sql
-- Вызов процедуры: p_user = 1, p_course = 2
CALL sp_enroll_and_pay(1, 2);
```
---
## Триггер
> ### Триггер trg_after_payment, который присутствует в базе EduPlus, срабатывает автоматически после вставки любой новой записи в таблицу payments. Что именно он делает:
> ### После того как пользователь оплатил курс (в payments появилась строка с его user_id и course_id), триггер добавляет запись в таблицу enrollments, фиксируя факт зачисления студента. Используется INSERT IGNORE, чтобы при повторной оплате того же курса не возникало дублирования — если запись уже есть, она просто пропускается.
> ### Одновременно триггер уменьшает поле users.balance на величину только что внесённого платежа (NEW.amount), корректно отражая остаток средств на счёте студента.
