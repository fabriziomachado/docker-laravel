### Instalando Laravel com a imagem do Composer

```sh
$ docker run --rm -it --tty --workdir=/app /
      --volume=$PWD:/app composer /
      composer create-project --prefer-dist /
      laravel/laravel laravel
```

### Migrate to Carbon 2.
https://carbon.nesbot.com/docs/#api-carbon-2

```sh
$ docker run --rm -it --tty  /
   --workdir=/app -v $PWD:/app composer /
   /bin/bash -c './laravel/vendor/bin/upgrade-carbon'
```
### Criando uma tag
```sh
$ docker tag laravel_app fbrz/laravel_app
```
### Subindo a imagem para dockerhub
```sh
$ docker push  fbrz/laravel_app
```
### Endereço da imagem da aplicação
```sh
https://cloud.docker.com/u/fbrz/repository/docker/fbrz/laravel_app
```
