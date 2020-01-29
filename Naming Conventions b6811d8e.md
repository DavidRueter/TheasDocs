## theas:xxx

Internally, the actual HTML DOM element name of  a TheasParam will by definition always begin with "theas:"

If an HTML form field element (input, select, checkbox, textarea, hidden, etc.) has a name that begins with "theas:" then that element is a TheasParam, regardless of how it was created.

Any form field elements that have a name that begins with "theas:" will be processed by the Theas server as a TheasParam--and will be stored in the server-side session, and will be passed into SQL stored procedures in the `@TheasParams` parameter

Conversely, any HTML form field element that does NOT have a name that begins with "theas:" will NOT be considered as a TheasParam.  Instead, all such fields will be considered as normal form fields.  The Theas server will pass these fields into SQL stored procedures in the`@FormParams`parameter.  These regular form parameter values will NOT be persisted the server-side session.

## th:

For clarity and identifier collision avoidance, special TheasParams used interally by the Theas server will have a th: as the first part of the parameter name.  This th: functions kind of as a namespace.  This th: does not change any functionality or behavior.  It exists solely for the purpose of making the parameter name a "reserved name" for use by the Theas server.

Consequently, user code should NEVER use th: as the first part of a TheasParam name.  User code MAY however read from (but not update) TheasParams that use th: as the first part of the parameter name.

Internal TheasParams include:

+----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|theas:th:ErrorMessage |Indicates 1) that there is a current error condition, and 2) contains the specific error message.  See [th:ErrorMessage](th_ErrorMessage 60285a48.md) for mor information.             |
+----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|theas:th:PerformUpdate|Indicates that when the form is posted, an update should be performed.  In other words, an HTTP post without providing th:PerformUpdate=1 is assumed to be read-only (like an HTTP get)|
+----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|theas:th:ST           |The Session Token of the current session                                                                                                                                               |
+----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|theas:th:UserToken    |The User Token of the current user                                                                                                                                                     |
+----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|theas:th:CurrentPage  |The current page that is displayed                                                                                                                                                     |
+----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|theas:th:NextPage     |The next page that will be displayed.  (Kind of like a redirect.)                                                                                                                      |
+----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|theas:th:RememberUser |Indicates that the user token is stored in a browser cookie, so that the user can be automatically logged in                                                                           |
|                      |                                                                                                                                                                                       |
|theas:th:LoggedIn     |                                                                                                                                                                                       |
+----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

## Requirements

Since TheasParams are stored as HTML form elements, their names must conform to the requirements for valid HTML names.

## Suggestions

Though there are no other restrictions imposed on TheasParams names, in practice it is often convenient to group TheasParams with a common prefix that is associated with a particular dataset (i.e. a particular JSON object and/or SQLresultset).

For example, if a page had information for Customer, Order, and OrderDetails, these would likely come from 3 different resultsets in in the SQL stored procedure.  To simplify processing of updates, it might be convenient to use prefixes, such as:

* Customer:CompanyName
* Customer:CustomerNumber
* Order:OrderNumber
* Order:OrderDate
* OrderDetail:ItemNumber