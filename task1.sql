create table if not exists dndx_salary_hist as
with ranked_changes as (
    select
        person,
        class,
        salary,
        dt as effective_from,
        lead(dt) over (
            partition by person order by dt
        ) as next_dt
    from de.histgroup
),
scd2_table as (
    select
        person,
        class,
        salary,
        effective_from,
        (next_dt - interval '1 day')::timestamp::date as effective_to
    from ranked_changes
)
select
    person,
    class,
    salary,
    effective_from,
    coalesce(effective_to, '2020-12-31') as effective_to
from scd2_table
order by person, effective_from;

--

create table if not exists dndx_salary_log as
select
	payment_dt,
	person,
	payment,
	month_paid,
	salary - month_paid as month_rest
from (
select
	sp.dt as payment_dt,
	sp.person,
	sp.payment,
	(
		select sum(payment)
		from de.salary_payments
		where person = sp.person and
			dt >= date_trunc('month', sp.dt) and
			dt <= sp.dt
	) as month_paid,
	dsh.salary
from de.salary_payments sp left join
	public.dndx_salary_hist dsh on (
		sp.person = dsh.person and
		sp.dt between dsh.effective_from and dsh.effective_to
	)
) _
order by payment_dt
