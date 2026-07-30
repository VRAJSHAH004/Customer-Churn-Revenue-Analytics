USE CustomerChurnDB;
GO

SELECT TOP 10 *
FROM dbo.Customer_Churn;


-- Query 1: Total Customers

SELECT COUNT(*) AS Total_Customers
FROM dbo.Customer_Churn;

-- Query 2: Total Revenue

SELECT FORMAT(SUM(TotalCharges), 'C2') AS Total_Revenue
FROM dbo.Customer_Churn;

-- Business Insight: The company has generated a total revenue of $16,056,168.70 from all customers included in the dataset.


-- Query 3: Churn Summary

SELECT Churn, COUNT(*) AS Total_Customers
FROM dbo.Customer_Churn GROUP BY Churn;

-- Business Insight: The churn summary indicates that out of 7,032 customers, 1,869 (26.58%) have churned, while 5,163 (73.42%) have remained with the company.


-- Query 4: Customer Churn Rate

SELECT COUNT(*) AS Total_Customers, SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Csutomers,
CAST(CAST(ROUND (SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 2) AS DECIMAL(5,2)) AS VARCHAR(10)) + '%' AS Churn_Rate_Percentage 
FROM dbo.Customer_Churn;

-- Business Insight: The customer churn rate is 26.58%, indicating that approximately one out of every four customers has discontinued the company's services.


-- Query 5: Customers by Gender

SELECT Gender,
		COUNT(*) AS Total_Customers
		FROM dbo.Customer_Churn
		GROUP BY Gender
		ORDER BY Total_Customers DESC;

-- Business Insight: Customer distribution is relatively balanced between male and female customers.


-- Query 6: Revenue by Contract

SELECT
 Contract,
		FORMAT(SUM(TotalCharges), 'C2') AS Total_Revenue
		FROM dbo.Customer_Churn
		GROUP BY Contract
		ORDER BY SUM(TotalCharges) DESC;

-- Business Insight: Contract type contribute to the total revenue, with highest-performing contract type generating the greatest revenue.


-- Query 7: Revenue by Payment Method

SELECT 
     PaymentMethod,
	 FORMAT(SUM(TotalCharges), 'C2') AS Total_Revenue
	 FROM dbo.Customer_Churn
	 GROUP BY PaymentMethod
	 ORDER BY SUM(TotalCharges) DESC;

-- Business Insight: Payment methods show varying revenue contributions across the customer base, indicating preferences in payment options among customers.


-- Query 8: Average Monthly Charges 

SELECT 
     ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges
	 FROM dbo.Customer_Churn;

-- Business Insight: The average monthly charge represents the typical monthly spending per customer, providing insight into the company's pricing structure and customer behavior.

-- Query 9: Customers by Internet Service 

SELECT 
      InternetService,
	 COUNT(*) AS Total_Customers
	 FROM dbo.Customer_Churn
	 GROUP BY InternetService
	 ORDER BY Total_Customers DESC;

-- Business Insight: Internet service preferences vary across customers,with one service type having the largest customer base, indicating its popularity and potential impact on churn rates.

-- Query 10: Senior Citizen Analysis

SELECT 
	 SeniorCitizen,
	 COUNT(*) AS Total_Customers
	 FROM dbo.Customer_Churn
	 GROUP BY SeniorCitizen;

-- Business Insight: The dataset contains both senior and non-senior customers, enabling comparison of customer behavior between the two groups.