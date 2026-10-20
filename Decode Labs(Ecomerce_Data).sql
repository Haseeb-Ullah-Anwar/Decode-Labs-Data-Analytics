CREATE DATABASE DecodeLabs_DB;
GO
USE DecodeLabs_DB;

CREATE TABLE ECommerce_Sales (
    OrderID VARCHAR(50) PRIMARY KEY,
    Date DATE,
    CustomerID VARCHAR(50),
    Product VARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    ShippingAddress VARCHAR(255),
    PaymentMethod VARCHAR(50),
    OrderStatus VARCHAR(50),
    TrackingNumber VARCHAR(50),
    ItemsInCart INT,
    CouponCode VARCHAR(50),
    ReferralSource VARCHAR(50),
    TotalPrice DECIMAL(10,2)
);
Go

USE DecodeLabs_DB;
GO

SELECT OrderID, CustomerID, Product, PaymentMethod, TotalPrice
FROM ECommerce_Data
WHERE OrderStatus = 'Shipped' 
  AND PaymentMethod = 'Credit Card';
Go

SELECT Product, 
       COUNT(OrderID) AS Total_Orders,
       SUM(Quantity) AS Total_Units_Sold,
       ROUND(SUM(TotalPrice), 2) AS Gross_Revenue
FROM ECommerce_Data
GROUP BY Product;
Go

SELECT OrderID, CustomerID, Product, Quantity, TotalPrice
FROM ECommerce_Data
WHERE TotalPrice > 3330.41;
Go
    
SELECT CouponCode, 
       COUNT(OrderID) AS Campaign_Usage_Frequency,
       ROUND(SUM(TotalPrice), 2) AS Campaign_Gross_Yield
FROM ECommerce_Data
WHERE CouponCode IS NOT NULL AND CouponCode <> 'NO_COUPON'
GROUP BY CouponCode
HAVING SUM(TotalPrice) > 20000.00
ORDER BY Campaign_Gross_Yield DESC;
Go

SELECT ReferralSource, 
       COUNT(OrderID) AS Total_Acquisitions,
       ROUND(SUM(TotalPrice), 2) AS Channel_Revenue_Contribution
FROM ECommerce_Data
WHERE ReferralSource IS NOT NULL AND ReferralSource <> ''
GROUP BY ReferralSource
ORDER BY Channel_Revenue_Contribution DESC;
Go
