SET NOCOUNT ON

-- 1 - Variable declarations
DECLARE @CMD1 varchar(8000)
DECLARE @MAXOID int
DECLARE @OwnerName varchar(128)
DECLARE @ObjectName varchar(128)
DECLARE @user varchar(128)

SELECT @user = 'test'

-- 2 - Create temporary table
CREATE TABLE #StoredProcedures
(OID int IDENTITY (1,1),
StoredProcOwner varchar(128) NOT NULL,
StoredProcName varchar(128) NOT NULL)

-- 3 - Populate temporary table
INSERT INTO #StoredProcedures (StoredProcOwner, StoredProcName)
SELECT ROUTINE_SCHEMA, ROUTINE_NAME
FROM INFORMATION_SCHEMA.ROUTINES 
WHERE ROUTINE_NAME NOT LIKE 'dt_%'
AND ROUTINE_TYPE = 'PROCEDURE'

-- 4 - Capture the @MAXOID value
SELECT @MAXOID = MAX(OID) FROM #StoredProcedures

-- 5 - WHILE loop
WHILE @MAXOID > 0
BEGIN 

-- 6 - Initialize the variables
SELECT @OwnerName = StoredProcOwner,
@ObjectName = StoredProcName
FROM #StoredProcedures
WHERE OID = @MAXOID

-- 7 - Build the string
SELECT @CMD1 = 'GRANT EXEC ON ' + '[' + @OwnerName + ']' + '.' + '[' + @ObjectName + ']' + ' TO ' + @user

-- 8 - Execute the string
-- SELECT @CMD1
EXEC(@CMD1)

-- 9 - Decrement @MAXOID
SET @MAXOID = @MAXOID - 1
END

-- 10 - Drop the temporary table
DROP TABLE #StoredProcedures

SET NOCOUNT OFF
GO
 
DECLARE @tables TABLE(ROWID int IDENTITY(1,1), SQLSTR varchar(500))
DECLARE @login varchar(40)

SELECT @login = 'test'

INSERT INTO @tables
SELECT 'GRANT DELETE ON ' + NAME + ' TO '+ @login
FROM sysobjects
WHERE TYPE = 'U'
AND NAME NOT LIKE 'SYNC%'

DECLARE @rowid int, @sqlstr varchar(500)
SET @rowid = 0
SET @sqlstr = ''
DECLARE grant_tbl_cursor CURSOR FOR
SELECT ROWID, SQLSTR
FROM @tables
ORDER BY ROWID
OPEN grant_tbl_cursor
FETCH NEXT FROM grant_tbl_cursor
INTO @rowid,@sqlstr
WHILE @@FETCH_STATUS = 0
BEGIN
EXECUTE (@sqlstr)
FETCH NEXT FROM grant_tbl_cursor
INTO @rowid,@sqlstr
END
CLOSE grant_tbl_cursor
DEALLOCATE grant_tbl_cursor

