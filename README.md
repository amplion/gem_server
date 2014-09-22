# Gem Server

So you need a self-hosted ruby gem server?

Here's a template (with capistrano support built-in) that can get you started.

Powered by [geminabox](https://github.com/geminabox/geminabox)

## Requirements

* Ruby >= 1.9
* Bundler

## Installation

Go ahead and check out the source locally:

```bash
$ git clone git@github.com:amplion/gem_server.git
$ cd ./gem_server
$ bundle install
```

## Setup

A `.env` file has been provided (and subsequently added to `.gitignore` so your
local changes will not clobber the cloned version) to get you started.

This assumes that uploaded gems will be added to the relative path `./data`. I
recommend you change this on your production host machine. For example, we
mounted an EBS `/data` volume on our EC2 instance for persistence.

The provided capistrano script will symlink `.env` from the shared folder using
the command:

```
set :linked_files, %w{.env}
```

Modify as needed.

## Usage

To get going locally all you should need to do is run:

```bash
$ rackup
```

## Authors

* Chris Kraybill [@ckraybill](https://github.com/ckraybill)

## Contributing

1. Clone it
2. Get it running
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Write your code and **specs**
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request
