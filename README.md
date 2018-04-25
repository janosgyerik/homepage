# Jekyll-Bootstrap

The quickest way to start and publish your Jekyll powered blog. 100% compatible with GitHub pages

## This blog

To run locally, simply run:

    ./run.sh

You may need to add `jekyll` to your `PATH`, for example:

    PATH=~/.gem/ruby/2.5.0/bin:$PATH ./run.sh

To install Jekyll:

    gem install jekyll jekyll-gist --user

On OSX, using MacPorts, you need ruby >= 2.1, here's one way to get it working:

    sudo port install ruby25
    sudo port select ruby ruby25

## Usage

For all usage and documentation please see: <http://jekyllbootstrap.com>

## Version

0.3.0 - stable and versioned using [semantic versioning](http://semver.org/).

**NOTE:** 0.3.0 introduces a new theme which is not backwards compatible in the sense it won't _look_ like the old version.
However, the actual API has not changed at all.
You might want to run 0.3.0 in a branch to make sure you are ok with the theme design changes.

## License

[MIT](http://opensource.org/licenses/MIT)
