### Purpose: 

1. Start <html> document and <head> consistently
2. Handle various favicon for mobile devices
3. Include CSS for:
   1. bootstrap4
   2. bootstrap-vue
   3. font-awesome
4. Script for trapping and displaying errors (for debug...not so much for production)

```
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible"/>

    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="theme-color" content="#ffffff">


    <link type="text/css" rel="stylesheet" href={{ 'cdn/bootstrap4/css/bootstrap.min.css'|theasResource }}>
    <link type="text/css" rel="stylesheet" href={{ 'cdn/bootstrap-vue/bootstrap-vue.css'|theasResource }}>
    <link type="text/css" rel="stylesheet" href={{ 'cdn/font-awesome/css/all.css'|theasResource }}>


<!-- Include the following script at the start of the page to trap and display JavasScript errors -->
<script>
    window.onerror = function(msg, file, line, col, error) {
        document.write('<br /> <h3>JavaScript error in this page:</h3> ',
            '<h4>', msg, '</h4>',
            '<h5>File: ', file, '</h5>',
            '<h5>Line: ', line, ', Column:', col, '</h5>',
            '<h5>', error, '</h5>');

          // Later on, if StackTrace.js is loaded and the errCallback and errConsoleLog are defined,
          // the following will display detailed traceback information

          if (typeof StackTrace !== 'undefined' &&
              typeof errCallback !== 'undefined' &&
              typeof errConsoleLog !== 'undefined') {
            // callback is called with an Array[StackFrame]
            StackTrace.fromError(error).then(errCallback).catch(errConsoleLog);
          }
    };
</script>
```