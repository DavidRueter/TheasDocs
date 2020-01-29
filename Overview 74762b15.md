"Scaffolding" refers to setting up a new project.  See:  [Scaffold (programming) - Wikipedia](https://en.wikipedia.org/wiki/Scaffold_(programming))

There are two different approaches when setting up a Theas project

* Precision Minimalist
  * Precise, hand-coded, CDN-served SysWebResources
* Programmatic
  * Programmatic creation of a hierarchy of folders and files
  * Further reading:
    * [Using the New vue-cli 3 to Scaffold Vue.js Apps](https://alligator.io/vuejs/using-new-vue-cli-3/)
    * [Vue CLI 3 Full-Stack App Structure](https://vuejsdevelopers.com/2019/03/11/vue-cli-3-full-stack/)

I prefer a minimalist approach.  I prefer not to have a heavy, rigid set of files, and prefer not to have a complex "build" process.

Fleshing this out, I can (and prefer to) live without npm, bower, webpack, Sass, vue-cli, etc.  I can simply write HTML...optionally using Theas server-side includes...to load the necessary CSS and JavaScript.

Also, I can use the stored procedure `theas.spDownloadSysWebResourceCDNArchives` to download popular libraries and store the individual files as SysWebResources.  This is kind of like a lightweight package manager.

On the other hand, most current tutorials assume a programmatic approach.  And there are some benefits from using the above-mentioned tools.

Theas can support whichever approach you choose to use.

In the minimalist approach you can create SysWebResource records by hand, and even edit code directly in the browser.

In the programmatic approach, you can use a tool like vue-cli to generate and populate a complex folder structure on your dev machine, and proceed with development and build as though Theas were not in the mix.  Later, you can sync your dist folder to SysWebResources.