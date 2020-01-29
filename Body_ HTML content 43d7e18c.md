The entire content of the page should be wrapped in <main id="thapp">

```
<main id="thapp">
```

Inside, there should be a <form id="TheasForm">

This form has special meaning to Theas.  It is how Theas keeps track of the session token and the XSRF token, as well as TheasParams.

```
    <form method="post" class="form-horizontal" id="theasForm">
        {{ "__th"|theasXSRF }}
        {{ "__th"|theasSessionToken(vuejs=True) }}
    </form>
```

Now you can include any arbitrary content you desire.  If using bootstrap-vue, this would be a good place to add a <b-container> tag (or a <div class="container"> if using normal boostrap 4)

```
  <b-container style="padding: 0">
```

If using Vue, you probably want to include your main page <template> here: