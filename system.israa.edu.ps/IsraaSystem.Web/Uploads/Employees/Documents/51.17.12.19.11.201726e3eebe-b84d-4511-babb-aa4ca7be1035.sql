USE [IsraaLibrary]
GO

/****** Object:  View [dbo].[BorrowClient]    Script Date: 6/21/2017 12:18:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE View [dbo].[BorrowClient] as

Select ID, 1 as BorrowCategoryID, EmployeeID as ClientID, [HumanResources].[dbo].[GetEmployeeNo](EmployeeID) as ClientNo, [HumanResources].[dbo].[GetEmployeeName](EmployeeID,3) as ClientName, BookID, [BorrowDate], [RenewDate], [LastReturnDate], [ReturnDate], [InsertDate], [InsertEmployeeID] From [dbo].[BorrowEmployee] Where IsDelete=0
union
Select ID, 2 as BorrowCategoryID, StudentID as ClientID, [IsraaAcademic].[dbo].[GetStudentNo](StudentID) as ClientNo, [IsraaAcademic].[dbo].[GetStudentName](StudentID,3) as ClientName, BookID, [BorrowDate], [RenewDate], [LastReturnDate], [ReturnDate], [InsertDate], [InsertEmployeeID] From [dbo].[BorrowStudent] Where IsDelete=0
union
Select ID, 3 as BorrowCategoryID,  VisitorID as ClientID, [dbo].[GetVisitorNo](VisitorID) as ClientNo, [dbo].[GetVisitorName](VisitorID) as ClientName, BookID, [BorrowDate], [RenewDate], [LastReturnDate], [ReturnDate], [InsertDate], [InsertEmployeeID] From [dbo].[BorrowVisitor] Where IsDelete=0
GO


