# How to install local dependencies in package.json (e.g: data-explorer):

This installation is the closest way to install local dependency like published dependency.

  1. Clone the data-explorer (or main repo) repository
  1. Clone your local dependencies (visions, components, sdmxjs, etc... )
  1. Inside each dependency folder: `yarn && yarn build && rm -rf node_modules`*
  1. in data-explorer/package.json, add the local dependency to dependencies
    e.g 
    ```json 
    {
      "dependencies": {
        "dotstatsuite-visions": "file:../dotstatsuite-visions"
      }
    }
    ```
  1. `rm yarn.lock && yarn`
  1. start data-explorer


* "node_modules" will be install during the data-explorer "yarn" installation.

# How to dev data-explorer and local dependency (Quick and dirty)

  From here, I supposed you have started or finished the implentation of your feature and you want to test it on data-explorer 

  1. In your local dependency `yarn build`
  1. Copy "es" (sdmxjs, visions) or "lib" (components) folder
  1. in data-explorer/node_modules/@sis-cc/@YourLocalDep
  1. delete the folder "es" or lib" and paste the new one.
  1. start data-explorer