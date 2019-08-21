# summary

```
graph LR
config[config:5007 .]
share[share:3006 .]
search[search:3007 .]
solr[solr:8983 .]
redis[redis:6379 .]
explorer[data-explorer:3009 . .]
viewer[data-viewer:3005 . .]
user((user .))
sdmx1(sdmx 1 indexable . .)
sdmx2(sdmx 2 .)
subgraph localhost_
search -->|bind at run .| config
search -->|bind at run .| solr
search -->|bind at run .| redis
share -->|bind at run .| config
share -->|bind at run .| redis
explorer -->|bind at run .| config
explorer -.->|defined in settings . .| search
explorer -.->|defined in settings . .| share
viewer -->|bind at run .| config
viewer -.->|defined in settings . .| share
end
user ==>explorer
user ==>viewer
explorer -.->|defined in datasources . .| sdmx1
explorer -.->|defined in datasources . .| sdmx2
search -.->|defined in datasources . .| sdmx1
```