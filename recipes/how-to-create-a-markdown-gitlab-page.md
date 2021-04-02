# How to create a GitLab website page using a theme based on markdown content

> This how-to procedure isn't meant to re-write what already exists in the excellent and well done GitLab documentation. The purpose is to guide to the right reference and explain how we reused the **GitLab website page** features and **Hugo template** for creating and deploying https://sis-cc.gitlab.io/dotstatsuite-documentation/.

### Follow all steps described in https://about.gitlab.com/stages-devops-lifecycle/pages/
The 5 following steps are also very well explained in this 3 minutes' video: https://www.youtube.com/watch?v=TWqh9MtT4Bg
#### Step 01: Fork one of the GitLab example projects
In our `dotstatsuite-documentation` context, we chose **https://gitlab.com/pages/hugo** because it is very popular, it supports markdown, and many themes are offering layout and design choices.

#### Step 02: Enable shared Runners
In your project's `Settings > CI/CD > "Enable shared runners"`  
Free shared Runners are available on GitLab.com for any project you create (private or public).

#### Step 03: Configure your project
In your project’s `Settings > General > Advanced > Change path`  
If your page site is hosted on GitLab.com, you can rename it *(optional)* to <namespace>.gitlab.io, where <namespace> is your GitLab namespace (the one you chose when you forked the project).

#### Step 04: Manually run a pipeline
Commit & push at least one change, e.g. edit your `README.md` file, save it and your pipeline will automatically run.

#### Step 05: Visit your website
Once your pipeline has ran and built successfully, go to your website url (depending on the name provided during step 03).

### Hugo Theme
As mentioned in Step 01, we chose a Hugo template. You can whether decide to use the default proposed theme (styles and layout), or you can choose another Theme from [here](https://themes.gohugo.io/). Themes are various and will depend on the types of content you want to publish (simple texts, blog, pictures, videos, etc.).  
In our `dotstatsuite-documentation` context, we chose the [Techdoc](https://themes.gohugo.io/hugo-theme-techdoc/) theme that offers a fixed header, a left dropdown menu, and simple custom configurations.  
When you go for one specific theme, retrieve the files/folder from the source code, copy and paste it to your forked template project, replacing thus the previous `themes` folder.

### `dotstatsuite-documentation` specific adds
In addition to the default behavior and theme offered by GitLab and the Hugo Theme template, we have invested extra resources and skills for enhancing and customizing the https://sis-cc.gitlab.io/dotstatsuite-documentation/:
* `UX/Design` for the layout, fonts, colours and logos
* `JavaScript` for the integration and configuration of a **free text search** feature based on [Algolia](https://www.algolia.com/apps/3LL2TKA2C3/dashboard)
