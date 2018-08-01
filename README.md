#Vagrant Github Pages

Create a Vagrant box to test the [GitHub Pages](https://github.com/github/pages-gem) locally. `ubuntu/xenial64` box is used here.

## Usage

This instruction assumes Vagrant and VirtualBox are installed locally on your computer and are up to date. Visit the following locations for download:

[Vagrant](https://www.vagrantup.com/downloads.html)

[VirtualBox](https://www.virtualbox.org/wiki/Downloads)

At the time of this writing, this has been tested with Vagrant 2.1 and VirtualBox 5.2.

### Quick Start

```
git clone https://github.com/bashtheshell/vagrant-github-pages.git
cd vagrant-github-pages/
vagrant up
```

That's it! It may take a while to provision your box. This is a good opportunity brew some coffee while you wait.


For the curious minds, you can use the `time` command to determine how long it takes to build the box.

```
# Bring up the box without provisioning (running the `script.sh` file)
time vagrant up --no-provision

# Provision the running box (run the `script.sh` only)
time vagrant provision
```

### Post-provision

After the `vagrant up` command completed, you can download 

```
git clone 'YOUR GITHUB PAGE REPO.git'

echo 'gem 'github-pages', group: :jekyll_plugins' >> Gemfile

# Unlock the existing Gemfile.lock to update it
bundle update

# To run the site repository locally, including the draft files in _drafts/ directory
bundle exec jekyll serve --host 0.0.0.0 --draft
```


## License

Distributed under the [MIT License](LICENSE).
