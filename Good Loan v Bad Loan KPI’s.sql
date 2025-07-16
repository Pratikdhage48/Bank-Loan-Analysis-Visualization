SELECT * FROM bank_loan_data

-- Good Loan v Bad Loan KPI’s

	-- Good Loan Application Percentage

SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
	/
	COUNT(id) AS Good_Lone_Percentage
FROM bank_loan_data

	-- Good Loan Applications

SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' or loan_status = 'Current'

	-- Good Loan Funded Amount

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' or loan_status = 'Current'

	-- Good Loan Total Received Amount

SELECT SUM(total_payment) AS Good_Loan_Total_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' or loan_status = 'Current'

	-- Bad Loan Application Percentage

SELECT
	(COUNT(CASE WHEN loan_status = 'Charged off' THEN id END) * 100)
	/
	COUNT(id) As Bad_Loan_Application_Percentage
FROM bank_loan_data

	-- Bad Loan Applications
SELECT COUNT(id) AS [Bad Loan Applications] FROM bank_loan_data
WHERE loan_status = 'Charged off'

	-- Bad Loan Funded Amount

SELECT SUM(loan_amount) AS [Bad Loan Funded Amount] FROM bank_loan_data
WHERE loan_status = 'Charged off'

	-- Bad Loan Total Received Amount

SELECT SUM(total_payment) AS [Bad Loan Total Received Amount] FROM bank_loan_data
WHERE loan_status = 'Charged off'


	---- Loan Status

SELECT
		loan_status,
		count(id) AS Total_Loan_Applications,
		SUM(total_payment) AS Total_Amount_Received,
		SUM(loan_amount) AS Total_Funded_Amount,
		AVG(int_rate * 100) as Interest_Rate,
		AVG(dti * 100) AS DTI
	FROM
		bank_loan_data
	GROUP  BY
		loan_status

----

SELECT 
	loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Received,
	SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status












