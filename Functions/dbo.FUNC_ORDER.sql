SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[FUNC_ORDER](@v_fromdate datetime,@v_todate datetime)
RETURNS @TABLE TABLE 
(ID int,
TITLE nvarchar(200),
UNIT nvarchar(50), 
HR int, 
ACCOUNTING int, 
ANIMAL int, 
AQUA int, 
HSE int, 
LOGISTIC int, 
MARKETING int, 
MAINTANANCE int, 
PURCHASING int, 
QC int, 
R_D int, 
SALES_SUPPORT int
)
AS 
BEGIN 
INSERT INTO @TABLE(ID,TITLE,UNIT, HR, ACCOUNTING, ANIMAL, AQUA, HSE, LOGISTIC, MARKETING, MAINTANANCE, PURCHASING, QC, R_D, SALES_SUPPORT) 
(
SELECT ROW_NUMBER()OVER(ORDER BY T.TITLE DESC) AS ID
		,T.TITLE, T.UNIT,SUM(T.HR) HR,SUM(T.ACCOUNTING) ACCOUNTING,SUM(T.ANIMAL) ANIMAL,SUM(T.AQUA) AQUA,SUM(T.HSE) HSE, SUM(T.LOGISTIC) LOGISTIC,
		SUM(T.MARKETING) MARKETING, SUM(T.MAINTANANCE) MAINTANANCE, SUM(T.PURCHASING) PURCHASING, SUM(T.QC) QC, SUM(T.[R&D]+T.[R&D_LAP]) [R&D],SUM(T.[SALES SUPPORT])[SALES_SUPPORT]	
FROM(
	SELECT  A.TITLE, A.UNIT, 
	CASE WHEN C.EMPLOYEEID = 'HR' OR C.EMPLOYEEID = 'hr' THEN SUM(CT.QUANTITY) ELSE 0 END HR,
	CASE WHEN C.EMPLOYEEID = 'ACCOUNTING' OR C.EMPLOYEEID = 'accounting' THEN SUM(CT.QUANTITY) ELSE 0 END ACCOUNTING,
	CASE WHEN C.EMPLOYEEID = 'ANIMAL' OR C.EMPLOYEEID = 'animal' OR C.EMPLOYEEID = 'PRO'  OR C.EMPLOYEEID = 'pro' THEN SUM(CT.QUANTITY) ELSE 0 END ANIMAL,
	CASE WHEN C.EMPLOYEEID = 'AQUA' OR C.EMPLOYEEID = 'aqua' THEN SUM(CT.QUANTITY) ELSE 0 END AQUA,
	CASE WHEN C.EMPLOYEEID = 'HSE' OR C.EMPLOYEEID = 'hse' THEN SUM(CT.QUANTITY) ELSE 0 END HSE,
	CASE WHEN C.EMPLOYEEID = 'LOGISTIC' OR C.EMPLOYEEID = 'logistic' THEN SUM(CT.QUANTITY) ELSE 0 END LOGISTIC,
	CASE WHEN C.EMPLOYEEID = 'MARKETING' OR C.EMPLOYEEID = 'marketing' THEN SUM(CT.QUANTITY) ELSE 0 END MARKETING,
	CASE WHEN C.EMPLOYEEID = 'MAIN' OR C.EMPLOYEEID = 'main' THEN SUM(CT.QUANTITY) ELSE 0 END MAINTANANCE,
	CASE WHEN C.EMPLOYEEID = 'PURCHASING' OR C.EMPLOYEEID = 'purchasing' THEN SUM(CT.QUANTITY) ELSE 0 END PURCHASING	,
	CASE WHEN C.EMPLOYEEID = 'QC' OR C.EMPLOYEEID = 'qc' THEN SUM(CT.QUANTITY) ELSE 0 END QC	,
	CASE WHEN C.EMPLOYEEID = 'RAD' OR C.EMPLOYEEID = 'rad' THEN SUM(CT.QUANTITY) ELSE 0 END AS [R&D],
	CASE WHEN C.EMPLOYEEID = 'RADLAP' OR C.EMPLOYEEID = 'radlap' THEN SUM(CT.QUANTITY) ELSE 0 END AS [R&D_LAP],
	CASE WHEN C.EMPLOYEEID = 'SALES' OR C.EMPLOYEEID = 'sales' THEN SUM(CT.QUANTITY) ELSE 0 END AS [SALES SUPPORT]	
  FROM ORDERDETAIL CT
 INNER JOIN ORDER_ C
    ON C.ORDERID = CT.ORDERID
 INNER JOIN ALBUM A
    ON A.ALBUMID = CT.ALBUMID
 WHERE C.EMPLOYEEID <> 'admin'
 AND ORDERDATE BETWEEN dateadd(d, datediff(d,0, @v_fromdate), 0) AND dateadd(d, datediff(d,0, @v_todate), 0)
 AND C.DEL <> 1
 AND CT.QUANTITY <> 0 
 GROUP BY A.TITLE, A.UNIT, C.EMPLOYEEID
) T
GROUP BY T.TITLE, T.UNIT
 )
RETURN 
END
GO
