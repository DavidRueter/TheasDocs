
Similarly, you can retrieve the DOM object of this TheasParam like this:

```javascript
let myObj = theas.get('theas:TestParam1');
```

After executing this statement, the variable myObj will point to the jQuery object that you could manually retrieve like this:

```javascript
// using jQuery directly
let myObj2 = $('*[name="theas:TestParam1"');
```

In this way, you can use the normal methods of myObj.  For example, you could also get the value of the theasParam like this:

```javascript
let myObj = th.get('theas:TestParam1');
let myVal = myObj.val();
alert(myVal);
```

The 