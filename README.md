## Docker Container to run osc

I like to run the whole maintenance tasks with osc in an isolated environment.

### build the environment

To build my image, I take the following steps:

````
cd docker_osc

cp ~/.oscrc oscrc

sudo docker build -t $USERNAME/opensuse:42.1 .
````
### to start to use it:

on my host I have a directory named ```~/suse/maintenance``` where I keep all
my maintenance work. So to start to work on I

````
cd ~/suse/maintenance/pkgX
sudo docker run  -i -t -v $PWD:/var/shared $USERNAME/opensuse:42.1 /bin/bash
````

on the Container then:

````
cd /var/shared
osc co SUSE:MyProject myPackage
....
````

### NOTES

If you are annoyed that I'm using sudo to call docker, please check the blog post:

http://www.projectatomic.io/blog/2015/08/why-we-dont-let-non-root-users-run-docker-in-centos-fedora-or-rhel/
