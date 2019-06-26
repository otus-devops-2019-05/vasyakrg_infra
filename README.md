# vasyakrg_infra
## HW4
  * создал конфиг для сборки начального темплея с установленными Ruby и mongoDB
    - для корректной сборки необходимо переименовать файл **/packer/variables_clear.json.example** в **/packer/variables_clear.json**, заполнить переменные
    - и запустить **deploy_clear_template.sh**
  * создал конфиг для сборки immutable образа с запеканием в него приложеник, которое разворачивается как monolith (исходник из https://github.com/express42/reddit.git).
    - для корректной сборки необходимо переименовать файл **/packer/variables_full.json.example** в **/packer/variables_full.json**,заполнить переменные
    - и запустить **deploy_full_template.sh**
  * создал скрипт для сборки инстанса на основе ранее развернутого full-темплея
    - для корректной сборки инстанса нужно, что бы в файле create-redditvm.sh было заполнено поле:
      - ID_PROJECT
    - так же по желанию можно заполнить и другие переменные
    - после запуска инстанса и установки приложения, статус работы можно проверить:
      - перейдя непосредственно на сервер через ssh root@35.188.101.89 или
      - перейдя по линку http://35.188.101.89:9292
  * в папке packer/files - лежат исходники скриптов для установки env компонентов

## Old home work
[old](README_old.md)

## Автор

   * **Vassiliy Yegorov** - *Initial work* - [vasyakrg](https://github.com/otus-devops-2019-05/vasyakrg_infra)
