# Vagrant GitHub Pages

Create a Vagrant box to test the [GitHub Pages](https://github.com/github/pages-gem) locally. `ubuntu/xenial64` box is used here.

## Usage

This instruction assumes Vagrant and VirtualBox are installed locally on your computer and are up to date. Visit the following locations for download:

[Vagrant](https://www.vagrantup.com/downloads.html)

[VirtualBox](https://www.virtualbox.org/wiki/Downloads)

At the time of this writing, this has been tested with Vagrant 2.1 and VirtualBox 5.2.

### Quick Start

On your host machine, run the following commands in the shell:

```
git clone https://github.com/bashtheshell/vagrant-github-pages.git
cd vagrant-github-pages/
vagrant up
```

That's it! It may take a while to provision your box. This is a good opportunity brew some coffee while you wait.


For the curious minds, you can use the `time` command to track how long it takes to build the box.

```
# Bring up the box without provisioning (do not run the 'script.sh' file)
time vagrant up --no-provision

# Provision the running box (only run the 'script.sh' file)
time vagrant provision
```

### Post-provisioning

After the `vagrant up` command completes, you can remote in the box headless and `git clone` your GitHub Pages to get productive immediately. Here is a sample snippet using mmistakes's _minimal-mistakes_ GitHub Pages.

```
# Connect to the box
vagrant ssh

# Clone the GitHub Pages repo (an example is used here)
git clone https://github.com/mmistakes/minimal-mistakes.git

# Change to site's directory
cd minimal-mistakes/

# Specify the gems in Gemfile
echo -e "\ngem 'github-pages', group: :jekyll_plugins" >> Gemfile

# Resolve all gems dependencies
bundle update

# To run the site repository locally, including the draft files in '_drafts/' directory
bundle exec jekyll serve --host 0.0.0.0 --draft
```

Now you should be able to view the GitHub Pages from your host's web browser by visiting: `http://0.0.0.0:4000`

## Problem?

Please send an issue or make a pull request if you run into a problem.

## Known Bugs

 - You may run into problem with `apt upgrade` command used in the _script.sh_ file as it may prompt you interactively whether you want to keep the existing grub.conf file or not. Please [see here](https://askubuntu.com/questions/146921/how-do-i-apt-get-y-dist-upgrade-without-a-grub-config-prompt) for more detail.

- You may notice that the RVM scripts used in the _script.sh_ fails to retrieve the GPG keys, and as a result, the remaining script will fail. Please review the [disclaimer](https://rvm.io/rvm/security) from RVM's developers for more information. A workaround is to run `vagrant provision` to force only the script to run again.

## License

Distributed under the [MIT License](LICENSE).
