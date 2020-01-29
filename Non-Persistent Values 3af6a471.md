Though you can clear the value of a TheasParam at anytime, your application may be better served by a non-persistent parameter.

You can work with non-persistent values in several ways.

First, you can use the exact same methods and filters described earlier for persistent TheasParam values, but specify persist=0

For example:

```handlebars
{{ 'abc'|theasHidden(name='TestParam1', persist=0) }}
```

or:

```javascript
let myVal = th.getval('TestParam1', 'def', false);
```

Or, you can simply use plain HTML form fields directly:

```html
<input name="Customer:CompanyName">
```

Regardless of which approach you use, the regular form field WILL be accessible in SQL in the `@FormFields` parameter.  But the value will NOT be persisted on the Theas server in the server-side session.