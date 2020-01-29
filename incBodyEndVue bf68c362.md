### Purpose

Include scripts that should be included in every page.

Note that the script references use the theasResource filter, so that updates to the referenced files in SysWebResource will "bust the cache" in the browser.

```
<script src={{ '/cdn/babel-polyfill/polyfill.min.js'|theasResource }}></script>
<script src={{ '/cdn/vuejs/vue.min.js'|theasResource }}></script>
<script src={{ '/cdn/bootstrap-vue/bootstrap-vue-test.js'|theasResource }}></script>

<script src={{ '/cdn/axios/axios.min.js'|theasResource }}></script>
<script src={{ '/cdn/hammerjs/hammer.min.js'|theasResource }}></script>

<script src={{ '/cdn/moment/moment.js'|theasResource }}></script>
<script src={{ '/cdn/screenfull/screenfull.js'|theasResource }}></script>

<script src={{ '/cdn/TheasVue.js'|theasResource }}></script>

<script type="module" src={{ '/cdn/Theas.vue'|theasResource }}></script>
```