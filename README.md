# Laravel homestead-docker

### Install docker && docker compose
please refer to these tutorials:
* install docker (https://docs.docker.com/installation/ubuntulinux/)

* install docker compose (https://docs.docker.com/compose/install/)


### Clone && Edit docker-compose.yml
```shell
git clone git@github.com:dung13890/docker-homestead.git
```
### Start your containers

```shell
sudo docker-compose up -d --build
```

### SSH into the container (password: secret):
```shell
ssh -p homestead@localhost
```

### Add a virtual host
Assuming you mapped your apps folder to ```/apps``` (you can change mappings in the docker-compose.yml file,
it's prefered to use absolute paths), you can do:
```shell
sudo /./serve.sh myapp.dev /apps/myapp/public
```
In the host, update ``` /etc/hosts ``` to include your app domain:
```shell
127.0.0.1               myapp.dev
```
