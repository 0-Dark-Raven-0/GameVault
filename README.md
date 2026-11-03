# 🎮 GameVault — Video Game Database

**A MySQL database project | Учебный и портфолио-проект**

---

## 🇬🇧 English

### About the Project

GameVault is a relational database project built with MySQL. It is designed to manage a video game catalog, organize games by genres and platforms, and track users' personal game libraries.

This project was created as a hands-on SQL learning experience and as a portfolio project demonstrating practical relational database skills.

### Database Structure

The database consists of 7 tables:

| Table | Description |
|---|---|
| `Games` | Video game catalog |
| `Genres` | Available game genres |
| `Platforms` | Gaming platforms |
| `Users` | User information |
| `Game_Genres` | Many-to-many relationship between games and genres |
| `Game_Platforms` | Many-to-many relationship between games and platforms |
| `User_Library` | User libraries, personal ratings, and playtime |

### Main Features

- Manage a video game catalog.
- Assign multiple genres to games.
- Track the platforms on which games are available.
- Maintain user libraries.
- Store personal game ratings and playtime.
- Prevent duplicate game entries in a user's library.
- Maintain data integrity through constraints and foreign keys.

### SQL Concepts Demonstrated

- Database and table creation
- Primary keys and composite primary keys
- Foreign keys and referential integrity
- Many-to-many relationships
- `NOT NULL`, `UNIQUE`, `CHECK`, and `DEFAULT`
- `ON DELETE CASCADE`
- `INNER JOIN`, `LEFT JOIN`, and multi-table joins
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`
- `GROUP BY` and `HAVING`
- Subqueries and correlated subqueries
- `CASE WHEN`
- `UNION` and `UNION ALL`
- Views
- `INSERT`, `UPDATE`, and `DELETE`
- Transactions, `COMMIT`, `ROLLBACK`, and `SAVEPOINT`
- Indexes and composite indexes
- Query analysis with `EXPLAIN` and `EXPLAIN ANALYZE`

### Data Integrity

The database includes several rules:

- Game release year must be at least 1900.
- Personal ratings must be between 1 and 10.
- Playtime cannot be negative.
- Usernames must be unique.
- A user can have only one library entry for each game.
- Foreign keys maintain relationships between tables.

The database structure and data relationships have been manually audited, including checks for orphaned records.

### Technologies

- MySQL
- SQL

### Project Status

The core database structure, sample data, and SQL practice queries have been completed.

Further work includes preparing reusable SQL scripts, an ER diagram, and additional project documentation.

---

## 🇷🇺 Русский

### О проекте

GameVault — учебный проект реляционной базы данных, разработанный с использованием MySQL. Он предназначен для управления каталогом видеоигр, распределения игр по жанрам и платформам, а также отслеживания пользовательских игровых библиотек.

Проект создан в рамках практического изучения SQL и одновременно служит портфолио, демонстрирующим навыки работы с реляционными базами данных.

### Структура базы данных

База данных состоит из 7 таблиц:

| Таблица | Описание |
|---|---|
| `Games` | Каталог видеоигр |
| `Genres` | Игровые жанры |
| `Platforms` | Игровые платформы |
| `Users` | Информация о пользователях |
| `Game_Genres` | Связь многие-ко-многим между играми и жанрами |
| `Game_Platforms` | Связь многие-ко-многим между играми и платформами |
| `User_Library` | Библиотеки пользователей, личные оценки и время игры |

### Основные возможности

- Управление каталогом видеоигр.
- Назначение нескольких жанров одной игре.
- Учёт платформ, на которых доступны игры.
- Ведение пользовательских библиотек.
- Хранение личных оценок и времени игры.
- Защита от повторного добавления одной игры в библиотеку пользователя.
- Обеспечение целостности данных с помощью ограничений и внешних ключей.

### Использованные возможности SQL

- Создание баз данных и таблиц.
- Первичные и составные первичные ключи.
- Внешние ключи и ссылочная целостность.
- Связи многие-ко-многим.
- Ограничения `NOT NULL`, `UNIQUE`, `CHECK` и `DEFAULT`.
- Каскадное удаление `ON DELETE CASCADE`.
- `INNER JOIN`, `LEFT JOIN` и объединение нескольких таблиц.
- Агрегатные функции `COUNT()`, `SUM()`, `AVG()`.
- `GROUP BY` и `HAVING`.
- Подзапросы и коррелированные подзапросы.
- `CASE WHEN`.
- `UNION` и `UNION ALL`.
- Представления (`VIEW`).
- `INSERT`, `UPDATE` и `DELETE`.
- Транзакции, `COMMIT`, `ROLLBACK` и `SAVEPOINT`.
- Индексы и составные индексы.
- Анализ запросов с помощью `EXPLAIN` и `EXPLAIN ANALYZE`.

### Целостность данных

В базе данных предусмотрены следующие правила:

- Год выпуска игры не может быть меньше 1900.
- Личная оценка должна находиться в диапазоне от 1 до 10.
- Время игры не может быть отрицательным.
- Имена пользователей должны быть уникальными.
- Пользователь может иметь только одну запись для каждой игры в своей библиотеке.
- Внешние ключи обеспечивают целостность связей между таблицами.

Структура базы данных и связи между таблицами прошли ручную проверку, включая проверку на наличие записей без соответствующих родительских объектов.

### Используемые технологии

- MySQL
- SQL

### Статус проекта

Основная структура базы данных, тестовые данные и практические SQL-запросы подготовлены.

Следующие этапы — подготовка SQL-скриптов для повторного создания базы данных, ER-диаграммы и дополнительной документации проекта.
