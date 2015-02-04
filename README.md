ReposingForces
==============

For now, the version of prmd that you need must be compiled from source
from [the prmd repo](https://github.com/interagent/prmd).

1.  Get the prmd code.
2.  `rake build`
3.  `cd pkg`
4.  `gem install prmd` (this will be picked up from the file in the
    current directory)

Then you can use any of the documentation targets on this code...

-   `make`/`make all|docs` will build everything (presently only the
    docs).
-   `make opendocs` will open the docs in your default browser after
    building.

