select * from bank_loan_data
select count(id) as Total_loan_Applications from bank_loan_data
select count(id) as MTD_Total_Application from bank_loan_data where month(issue_date)=12 and year(issue_date)=2021
select count(id) as PMTD_Total_Application from bank_loan_data where month(issue_date)=11 and year(issue_date)=2021

--(MTD-PMTD)/PMTD

select SUM(loan_amount) AS Total_Funded_Amount from bank_loan_data
select SUM(loan_amount) AS MTD_Total_Funded_Amount from bank_loan_data where month(issue_date)=12 and year(issue_date)=2021
select SUM(loan_amount) AS PMTD_Total_Funded_Amount from bank_loan_data where month(issue_date)=11 and year(issue_date)=2021
select SUM(total_payment) AS Total_Amount_received from bank_loan_data
select SUM(total_payment) AS MTD_Total_Amount_received from bank_loan_data where month(issue_date)=12 and year(issue_date)=2021
select SUM(total_payment) AS PMTD_Total_Amount_received from bank_loan_data where month(issue_date)=12 and year(issue_date)=2021

select avg(int_rate) as Avg_Interest_Rate from bank_loan_data
select avg(int_rate) * 100 as Avg_Interest_Rate from bank_loan_data
select round(avg(int_rate),4) * 100 as MTD_Avg_Interest_Rate from bank_loan_data
select round(avg(int_rate),4) * 100 as MTD_Avg_Interest_Rate from bank_loan_data where month(issue_date)=12 and year(issue_date)=2021
select round(avg(int_rate),4) * 100 as PMTD_Avg_Interest_Rate from bank_loan_data where month(issue_date)=11 and year(issue_date)=2021

select avg(dti) * 100 as Avg_DTI from bank_loan_data
select round(avg(dti),4) * 100 as Avg_DTI from bank_loan_data
select round(avg(dti),4) * 100 as MTD_Avg_DTI from bank_loan_data where month(issue_date)=12 and year(issue_date)=2021
select round(avg(dti),4) * 100 as PMTD_Avg_DTI from bank_loan_data where month(issue_date)=11 and year(issue_date)=2021

select loan_status from bank_loan_data
select 
	(count(case when loan_status='Fully Paid' OR loan_status='Current' then id end)*100) / count(id) as Good_loan_percentage 
from bank_loan_data

select count(id) as Good_Loan_Applications from bank_loan_data where loan_status='Fully Paid' OR loan_status='Current'
select SUM(loan_amount) as Good_Loan_Funded_Amount from bank_loan_data where loan_status='Fully Paid' OR loan_status='Current'
select SUM(total_payment) as Good_Loan_Received_Amount from bank_loan_data where loan_status='Fully Paid' OR loan_status='Current'
select 
	(count(case when loan_status='Charged Off' then id end)*100.0) / count(id) as Bad_loan_Percentage 
from bank_loan_data

select count(id) AS Bad_Loan_Applications from bank_loan_data where  loan_status='Charged Off'
select SUM(loan_amount) as Bad_Loan_Funded_Amount from bank_loan_data where loan_status='Charged Off'
select SUM(total_payment) as Bad_Loan_Amount_Received from bank_loan_data where loan_status='Charged Off'


--Loan Status
select
	loan_status,
	count(id) AS LoanCount,
	SUM(total_payment) AS Total_Amount_received,
	SUM(loan_Amount) AS Total_Funded_Amount,
	AVG(int_rate * 100) AS Interest_Rate,
	AVG(dti * 100) AS DTI
from bank_loan_data group by loan_status

select
	loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Received,
	SUM(loan_amount) AS MTD_total_funded_Amount
from bank_loan_data where month(issue_date)=12 group by loan_status


select
	month(issue_date) as Month_Number,
	DATENAME(MONTH, issue_date) AS Month_Name,
	count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
from bank_loan_data 
group by month(issue_date), DATENAME(MONTH, issue_date) 
order by month(issue_date)


select
	address_state,
	count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
from bank_loan_data 
group by address_state 
order by address_state

select
	address_state,
	count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
from bank_loan_data 
group by address_state 
order by SUM(loan_amount) desc

select
	address_state,
	count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
from bank_loan_data 
group by address_state 
order by count(id) desc

select
	term,
	count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
from bank_loan_data 
group by term 
order by term

select
	emp_length,
	count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
from bank_loan_data 
group by emp_length 
order by emp_length

select
	emp_length,
	count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
from bank_loan_data 
group by emp_length 
order by count(id) desc


select
	purpose,
	count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
from bank_loan_data 
group by purpose
order by count(id) desc

select
	home_ownership,
	count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
from bank_loan_data 
group by home_ownership
order by count(id) desc

select
	home_ownership,
	count(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
from bank_loan_data 
where grade = 'A' and address_state ='CA'
group by home_ownership
order by count(id) desc