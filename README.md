# CourseWork
> ⚠️
> ## Для разворачивания БД и тестовых данных необходимо скачать и инициализировать файл dump.sql
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
