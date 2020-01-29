When HTTP requests are made to the Theas server, the Theas server will look up the specified document in SysWebResources.  If the resource references an APIStoredProc (or an APIAsyncStoredProc in the case of an async request) the Theas server will call that stored procedure as part of generating the response to the request.

If that stored procedure declares a parameter named @TheasParams that parameter will be set to a string containing the name-value pairs of all the TheasParams in the session.

In this way the stored procedure can access TheasParams in the SQL code like this:

```sql
DECLARE @SomeVar nvarchar(MAX)
SET @SomeVar = sqlver.udfDictionaryLookup('TestParam1', @tvTheasParams)
```

And, if the stored procedure wants to set the value of a Theas param, the stored proc can return the name-value pairs to set in the TheasParams column of the General resultset:

```sql
DECLARE @TheasParams nvarchar(MAX)
SET @TheasParams = 'TestParam1=ghi'
SELECT @TheasParams AS TheasParams
```

If the stored procedure needed to update the values of multiple TheasParams, it could do so like this:

```sql
DECLARE @TheasParams nvarchar(MAX)
SET @TheasParams = 'TestParam1=ghi&TestParam2=jkl'
SELECT @TheasParams AS TheasParams
```

Note:  the value of the @TheasParams parameter passed into the stored procedure and of the TheasParams column returned in the resultset is a normal URL-encoded string...just like the query string of an HTTP request.

When returning TheasParams from a SQL stored procedure, any parameters that are not present in the TheasParams column will remain unchanged.  In other word,s the SQL stored procedure need only return the TheasParams that have changed values.