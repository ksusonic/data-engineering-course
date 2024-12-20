# MLDS DataEngineering course

## HW 1

*Часть 1*

Создайте структуру базы данных по выбранной вами тематике из списка ниже.

Предметные области (выберите одну):
1. Продажа автомобилей.
2. Приют для животных.
3. Железнодорожные перевозки.
4. Служба доставки.
5. Организация марафона.

Требования к базе данных:
•  Должно быть не менее 4 сущностей (включая технические объекты).
•  Должна быть хотя бы одна связь один-ко-многим.
•  Должна быть хотя бы одна связь многие-ко-многим.
•  Все отношения приведены к третьей нормальной форме (3НФ).

Требования к оформлению:
•  ER-диаграмму необходимо составить на app.dbdesigner.net. На проверку нужно прислать ссылку на диаграмму.
•  Также необходимо подготовить SQL-скрипт с DDL для создания таблиц (обратите внимание на ограничения) и заполнения примерами данных.

*Часть 2*

1. Создайте таблицу ****_SALARY_HIST, где **** — ваш уникальный идентификатор.
В таблице должна быть SCD2 версия таблицы de.histgroup с полями:
• PERSON
• CLASS
• SALARY
• EFFECTIVE_FROM
• EFFECTIVE_TO

2.  Используя таблицы ****_SALARY_HIST и de.salary_payments, напишите SQL-скрипт, выводящий таблицу платежей сотрудникам.
Таблица должна содержать поля:
• PAYMENT_DT — дата выплаты
• PERSON
• PAYMENT
• MONTH_PAID — суммарно выплачено в месяце на дату последней выплаты
• MONTH_REST — осталось выплатить за месяц

Результат выполнения сохраните в таблицу ****_SALARY_LOG.

Важно: Проверяется в первую очередь понимание того, как соединять фактовую таблицу с SCD2 таблицей (нельзя все расчеты делать над de.salary_payments, так как работнику могут недоплатить или переплатить).

В ответе приложите SQL-скрипт; таблица ****_SALARY_LOG должна быть заполнена.
