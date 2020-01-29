Theas is built on the concept of "web resources".

A "web resource" is a database record that consists of the following main elements:

1. Resource code (i.e. the document name in the URL)
   1. May contain slashes, such as 'somedir/somepage.html'
2. Content that is to be served up.  May be one of the following:
   1. Text data (HTML, CSS, Javascript, etc.) that is to be served up as-is, with no manipulation (i.e. static content)
   2. Binary data (JPG, MP3, etc.) that is to be served up as-is, with no manipulation (i.e. static content)
   3. Text data (HTML, CSS, Javascript, etc.) that is a template that is to be merged with data at runtime
   4. Text data that is is to be included in another resource (i.e. a server-side include, AKA a "Static Block")
3. Stored procedure to be executed when a HTTP request for the full page is received
   1. Applicable only if the content is a template
   2. If applicable, also a list that maps resultsets to data source names consumed by the templating engine is provided
4. Stored procedure to be executed when an HTTP async request is received for this resource (page). 