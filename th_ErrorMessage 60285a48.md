th:ErrorMessage is a Theas-reserved TheasParam (hence the th: prefix).

When an error occurs, whether in SQL or in the Theas server, the value of th:ErrorMessage will be updated.

The JavaScript code can check for the presence of an error message in th:ErrorMessage, and can display a modal (or take some other action).

A good pattern for handling errors that may occur during processing of a request for a page is to do something like this in the JavaScript code:

```javascript
<script>
    $(document).ready(function () {
        // jQuery is ready
        th.ready(function () {
            // Theas is ready
          
            // declare and set a variable "that" to use in lieu of "this"
            let that = this;

            if (!th.haveError(true)) {

                // Everything is ready and error-free.
                // You can do whatever you want to do here.
                // Both jQuery and Theas are ready for use.
              
                let placeholder;
            }
        });
    });
```

What this does:

1. Uses the jQuery `ready()` method to make sure that the DOM is ready before the code executes
2. Uses the Theas `ready()` method to make sure that Theas is ready (i.e. the JavaScript in Theas.js is ready)
3. Uses the `if (!th.haveError(true))`to:
   1.  make sure that the code inside that block will NOT be executed if there is an error
   2. display a modal containing the error message if there is an error