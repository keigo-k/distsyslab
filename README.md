# Distributed System Lab

# Preparations
## Pull submodules

```
$ git submodule update --init
```

## Install Ansible
### Ubuntu

The version of ansible is assumed to be 2.7.10-1 as of 2019/04/21.

```
$ sudo apt-get update
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
```

### CentOS

```
$ sudo yum install ansible
```

## Distsyslab on Docker in Localhost

If you want to run Distsyslab on Docker in localhost, execute the below command.

```
$ cd local
$ sudo ansible-playbook local_docker.yml
```

If you don't need a gpu node in kubernetes, you should execute the above command with -e "enable_nvidia_gpu=false".

```
$ cd local
$ sudo ansible-playbook -e "enable_nvidia_gpu=false" local_docker.yml
```

Then, you can log in client server that builds Distsyslab with ansible.

```
$ docker exec -u distsysadmin -w /home/distsysadmin/distsyslab -it client001 bash
```

# Usage

```
$ ansible-playbook --become distsyslab.yml
```
