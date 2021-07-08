---
title: "Enabling and optimising external index of web crawlers"
subtitle: 
comments: false
weight: 83

---

This page is a guide on how to configure the policy for search engine crawlers on the 3 .Stat Suite applications Data Explorer, Data Viewer and Data Lifecycle Manager.

### robots tags
For each application, both HTML header `<meta name="robots" />` and HTTP header `x-robots-tag` contents can be configured through an **environment variable `ROBOTS_POLICY`**. For both Data Explorer and Data Viewer, the default value is set to `all`, while default `none` is set for Data Lifecycle Manager.

### robots.txt file
For each application, a default `robots.txt` is served with the default content:

```txt
User-agent: *
Disallow: /
```

In order to configure your own robots.txt, you can, following your deployment strategy:
- For a source code installation, edit the file `src/server/robots.txt` before build
- For a docker installation, mount a volume:

```
docker run --mount type=bind,source=path/custom_robots.txt,target=/server/robots.txt -d data-explorer
```

- redirect the route url `domain/robots.txt` to your own file
