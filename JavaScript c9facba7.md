Besides being able to work with that HTML input in the normal ways, you could also retrieve the value of this TheasParam in JavaScript like this:

```javascript
let myVal = th.getval('theas:TestParam1');
alert(myVal);  // displays:  abc
```

In the first line of this example, the object `th` is automatically instantiated when the Theas.JS script is loaded.  The `getval` method says "Get the value of this TheasParam", and the parameter of 'theas:TestParam1' is the name of the TheasParam from which to retrieve the value.

You could update the value of the the TheasParam like this:

```javascript
let myVal = th.getval('theas:TestParam1', 'def');
alert(myVal);  // displays:  def
```

As a convenience, you can omit the "theas:" from the string.  The `getval()` method will silently prepend the "theas:" if it is not present.  

```javascript
let myVal = th.getval('TestParam1');
alert(myVal);  // displays:  abc
```

Internally, the only HTML form fields that will be treated as TheasParams are those whose name begins with "theas:"

If the form is submitted, either via standard HTML means or via a call to `th.submitForm()`, all the TheasParams will be submitted to the Theas server, and will be stored in the server-side session.

Also, if an async request is made using `th.sendAsync()` the TheasParams will be submitted to the Theas server, and will be stored in the server-side session.