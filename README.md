Powered by [Hugo](https://gohugo.io/) website using GitLab Pages.<br>
The theme used is https://themes.gohugo.io/hugo-theme-techdoc/ and adapted from http://themes.gohugo.io/beautifulhugo/.<br>

Learn more about GitLab Pages at https://pages.gitlab.io and the official
documentation https://docs.gitlab.com/ce/user/project/pages/.

---

### Command

build website (generate public folder)
```shell
hugo
```

run documentation website
```shell
hugo server
```
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

### Purpose
This project is used for publishing the official .Stat Suite documentation to the public Gitlab webpage https://sis-cc.gitlab.io/dotstatsuite-documentation/.


### Contributing to the documentation
- All the documentation content is written in **Markdown** syntax.
- If you want to **edit the documentation** web page, fork [this project](https://gitlab.com/sis-cc/dotstatsuite-documentation), make your changes there, and submit a merge request.
- Please follow the existing **menu structure**. If relevant, you can submit a new menu folder/section/sub-section.
- All images must be added under **/static/images**. Use the syntax `![this is an image](/dotstatsuite-documentation/images/image-name.png)` to add your image in inline-style in the .md file.
- Your merge request will be reviewed according to our **[Gitflow](https://sis-cc.gitlab.io/dotstatsuite-documentation/contribution/development-guidelines/) process**.

### Search using Algolia
Free text search on documentation is enabled and is using [algolia](https://www.algolia.com/doc/).  
In order to properly index the pages and their sub-sections within each page, each header of a `.md` content file must contain the table of contents as `keywords`.  

Example:  
If your table of content is
```
#### Table of Content
- [intro](#intro)
- [production cycle](#production-cycle)
- [common rules](#common-rules)
```

Then your header will look like
```
title: "Issue process and Definitions of Done (DoD)"
subtitle: 
comments: false
weight: 92
keywords: [
  'intro', '#intro',
  'production cycle', '#production-cycle',
  'common rules', '#common-rules',
]
```

So that algolia can index each sub-seciton of your page and return links to sub-sections when relevant for the user's search.
