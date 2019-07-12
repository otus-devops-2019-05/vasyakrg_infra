# Выполнено ДЗ № 8

 - [X] Основное ДЗ
 - [X] Задание со *

## В процессе сделано:
* в прогоне простого плейбука и при выполнения
  > ansible app -m command -a 'rm -rf ~/reddit'

  - изменяется флаг "changed", т.к плейбуку приходится снова создавать директору и клонировать туда репу

* Задания со *
  - добавил в разделе terraform в stage и в prod реализацию формирования json файла inventory после поднятия инстансов (использую темплей)
    - файл заливается в папку с ансиблом
  - добавил скрипты на питоне которые читают json скрипт и скармливают его в ansible

## Как запустить проект:
 - перейти в папку terraform/stage или terraform/prod
 - переименовать файлы **terraform.tfvars.example** в **terraform.tfvars** и **variables.tf.example** в **variables.tf** и заполнить необходимыми значениями
 - перейти в папку terraform/stage или terraform/prod и запустить выполнение конфигурации
    > terraform init && terraform apply

## Как проверить работоспособность:
 - после завершения работы терраформа, перейти в папку /ansible и запустить выполнение плейбука исходя из того какое окружение (stage или prod) было сформировано
   > ansible all -i inv-stage.py -m ping

   или

   > ansible all -i inv-prod.py -m ping


## PR checklist
 - [X] Выставил label ansible
 - [X] Выставил label ansible-1
