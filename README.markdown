# .Net Core
Quickly and easily install the .Net Core programming language with a customisable workspace and version.

## Usage
In order to use this module do the following:

    class { 'dotnet_core':
      version   => '2.1',
      workspace => '/usr/local/src/dotnet',
    }

This will install .Net Core and setup your workspace in `usr/local/dotnet`. Your chosen workspace should include a `bin`, `pkg` and `src` directory. 

If you wish to add your own code into the .Net Core workspace but not add the files directly the best method is to create a symlink as demonstrated below:

    file { '/home/user/project':
      ensure => link,
      target => '/usr/local/src/dotnet/src/project',
    }

#### arch
It's prepared only for Ubuntu 16.04

#### download_dir
`download_dir` is the location in which the .Net Core tarball is downloaded to. This is configurable in case the default (`/usr/local/src`) is unavailable.

## Contributions
This module is fairly young and has only been tested on Debian. All contributions are welcome by forking the project and creating a pull request with your changes.

## Testing
When contributing please add a test/example to confirm everything still works fine.

    git clone <URL> dotnet
    # you will also need to puppet module install -i . <dependencies>
    cd dotnet
    for i in examples/*; do; puppet apply --test --noop --modulepath=.. "$i"; done

The testing is only basic, just ensure the right steps are still executed.

## Roadmap
There are still additional features which would make this module better:

1. Tests (tut, tut me for not doing them)
3. A .Net Core project resource which would automatically symlink the directory?

## License

The MIT License (MIT)

Copyright (c) 2018 Pawel Niemczyk

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
