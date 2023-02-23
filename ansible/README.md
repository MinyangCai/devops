# Cybersight setup

## Adding cybersights to ansible

Refer to: [ClickUp](https://app.clickup.com/14232171/v/dc/djakb-10368/djakb-24825)

##  Prepare the devops repo

```shell
#Check the public key and add to github
cd ~/.ssh
cat id_rsa.pub

#After adding the key, clone the repo, the repo should be cloned to /home/ubuntu
cd /home/ubuntu
git clone git@github.com:industrialnext/devops.git
cd devops

#Change to the avaliable branch
git checkout mshullick/install_telegraf_script
```

## Execute ansible playbook

Can add more playbooks for installation

```shell
#The "<HOSTS>" should be replace to actual hosts, and sudo password of each cybersights should be input
ansible-playbook Install_python3_pip3.yml Install_docker_dockercompose.yml Install_telegraf_tegrastats.yml -e "hosts=<HOSTS>" --ask-become-pass
```

## Pull python packages and docker files

```shell
#Pull docker images 
ansible-playbook Pull_docker_images.yml -e "packagename=<PACKAGE_NAME> version=<VERSION>" --ask-become-pass

#Pull python packages
ansible-playbook Pull_python_packages.yml -e "packagename=<PACKAGE_NAME> version=<VERSION>" --ask-become-pass
```

