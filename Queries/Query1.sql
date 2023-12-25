select *
from employee join branch on employee.BID  = branch.BID
where bname = 'North Branch'

select *
from account 
where AccBalance > 5000;

select * 
from branch join account on branch.BID= account.BID
where AccType in ('Credit')

select *
from Branch
where BName like 'N%'

select * 
from employee
where EDepartment = 'Tech'
order by Ename asc

select top 3 *
from Account
order by AccNumber

select * 
from branch AS b join employee AS e on b.BID = e.BID
where EPosition in ('Manager','Developer')
order by Ename asc , EEmail desc

select max(LAmount) AS Amount
from loan 
where LType = 'Personal Loan'

select top 1 EDepartment 
from employee
group by EDepartment
order by count(*) desc

select *
from employee
where Ename not in ('Mazen Sokar','Sokar')
order by EDepartment desc,ename asc,EPhone asc
