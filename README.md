# GitLab CI/CD

Este proyecto contiene un pipeline que **genera la imagen de docker con el Dockerfile y la sube al registry de gitlab**


1. agregar variables de entorno en gitlab(agregar secrets con las credenciales para autenticarse a gitlab registry)(settings> CI CD>Variables)
2. escribir pipeline que ejecute el build (crear archivo: .gitlab-ci.yml)

```yml
# image: mhart/alpine-node:11
image: docker:git
services:
  - docker:dind

#VARIABLES GITLAB CI CD
#https://docs.gitlab.com/ee/ci/variables/predefined_variables.html
#NOTA: para que funcione el login las variables creadas en settings>CI/CD>variables de entorno no deben estar protected

variables:
  REACT_APP_TEST: $REACT_APP_TEST

stages: # List of stages for jobs, and their order of execution
  - build image Production
  - build image Development

build-docker-img-prod:
  stage: build image Production
  script:
    - echo $REACT_APP_TEST
    - docker login registry.gitlab.com -u $USER -p $PASSWORD
    - docker build --pull -t $CI_REGISTRY_IMAGE:prod-$CI_COMMIT_SHORT_SHA .
    - docker push $CI_REGISTRY_IMAGE:prod-$CI_COMMIT_SHORT_SHA
    - docker images
  only:
    - master

build-docker-img-dev:
  stage: build image Development
  script:
    - docker login registry.gitlab.com -u $USER -p $PASSWORD
    - docker build --pull -t $CI_REGISTRY_IMAGE:dev-$CI_COMMIT_SHORT_SHA .
    - docker push $CI_REGISTRY_IMAGE:dev-$CI_COMMIT_SHORT_SHA
    - docker images
  only:
    - desarrollo

```

