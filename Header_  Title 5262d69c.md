Title is page-specific.  For this reason, the incThVue_HTMLStart include leaves <head> open.

When setting the title, it is often best to also set the title-related meta attributes (if the page pertains to a "web application").

> According to HTML5 LC, a `meta` tag with [`name=application-name`](http://www.w3.org/TR/html5/document-metadata.html#standard-metadata-names) shall have value (in the `content` attribute) that is “short free-form string giving the name of the Web application that the page represents”; if the page is not an application, such a tag must not be used. Browsers “may use the application name in UI in preference to the page's `title`, since the title might include status messages and the like relevant to the status of the page at a particular moment in time instead of just being the name of the application.”
>
> [https://stackoverflow.com/questions/24721130/what-is-the-purpose-of-application-name-and-keywords-in-meta-tag](https://stackoverflow.com/questions/24721130/what-is-the-purpose-of-application-name-and-keywords-in-meta-tag)

```
<meta name="apple-mobile-web-app-title" content="testvue">
<meta name="application-name" content="testvue">
<title>Test Vue</title>
```