create table dndx_salary_hist as 
select person, class, salary, dt as effective_from, (dt + interval '1 month')::timestamp::date as effective_to
from de.histgroup;


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
		sp.dt >= dsh.effective_from and 
		sp.dt < dsh.effective_to 
	)
) _
order by payment_dt
