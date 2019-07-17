# Выполнено ДЗ № 9

 - [X] Основное ДЗ
 - [X] Задание со *

## В процессе сделано:

## Как запустить проект:
  1. скомпилировать образы
    > ./packer/deploy_db_ruby.sh

  2. поднять два инстанса под базу и приложение
    - перейти в папку terraform/stage или terraform/prod
    - переименовать файлы **terraform.tfvars.example** в **terraform.tfvars** и **variables.tf.example** в **variables.tf** и заполнить необходимыми значениями
    - перейти в папку terraform/stage или terraform/prod и запустить выполнение конфигурации
      > terraform init && terraform apply

  3. запустить ansible
    > cd ansible && ansible-playbook site.yml

## Как проверить работоспособность:
 - открыть в браузере http://external_ip_app:9292


## PR checklist
 - [X] Выставил label ansible
 - [X] Выставил label ansible-1
