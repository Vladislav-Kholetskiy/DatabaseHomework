# DatabaseHomework

## Описание проекта

Данный репозитория представляет собой набор SQL-скриптов для решения задач по работе с базами данных, выполненных с использованием PostgreSQL. Каждая задача представляет собой отдельную часть работы, включающую создание таблиц, заполнение их данными и выполнение SQL-запросов для решения поставленных задач. Проект состоит из четырех основных частей, каждая из которых реализует конкретное задание.


## Структура репозитория
Структура организована следующим образом: для каждой задачи создана отдельная папка, в которой находятся соответствующие SQL-скрипты:

```
.
|   README.md
|   .gitattributes
|
+---task1
|       task1.1.sql
|       task1.2.sql
|       task1_create_table.sql
|       task1_insert_data.sql
|
+---task2
|       task2.1.sql
|       task2.2.sql
|       task2.3.sql
|       task2.4.sql
|       task2.5.sql
|       task2_create_table.sql
|       task2_insert_data.sql
|
+---task3
|       task3.1.sql
|       task3.2.sql
|       task3.3.sql
|       task3_create_table.sql
|       task3_insert_data.sql
|
+---task4
|       task4.1.sql
|       task4.2.sql
|       task4.3.sql
|       task4_create_table.sql
|       task4_insert_data.sql

```
- В каждой папке задачи сначала размещен скрипт `taskX_create_table.sql`, который создает таблицы и скрипт `task4_insert_data.sql`, который наполняет таблицы. Эти скрипты не создают базу данных — ее необходимо создать вручную.
- После выполнения этих скриптов можно выполнить последующие файлы, которые содержат SQL-запросы для решения конкретных задач.

## Инструкция по запуску проекта

1. **Создайте базу данных в PostgreSQL.** Пример команды для создания базы данных:
   ```sql
   CREATE DATABASE mydatabase;
   ```

2. **Подключитесь к базе данных.** Например:
   ```bash
   psql -U postgres -d mydatabase
   ```

3. **Создайте таблицы и заполните их данными.** Запустите скрипт `TaskX_0.sql` из папки, соответствующей задаче. Этот скрипт создаст все необходимые таблицы и заполнит их данными.

4. **Выполните решение задачи.** После того как таблицы будут созданы и наполнены, можно запускать последующие скрипты для выполнения конкретных SQL-запросов, например:
   ```sql
   \i task1/task1.1.sql
   ```


## Описание задач

Все задачи соответствуют исходному ТЗ

## Примечания

1. Для выполнения SQL-скриптов необходимо иметь доступ к PostgreSQL и создать базу данных вручную.
2. Скрипты создают только таблицы и наполняют их данными, но не создают саму базу данных.
 
