# vasyakrg_infra
## HW5
  * конфиг для сборки начального темплея с установленными Ruby и mongoDB
    - для корректной сборки необходимо переименовать файл **/packer/variables.json.example** в **/packer/variables.json**, заполнить переменные
    - и запустить **deploy_clear_template.sh**
  * конфиг для сборки immutable образа с запеканием в него приложеник, которое разворачивается как monolith (исходник из https://github.com/express42/reddit.git).
    - для корректной сборки необходимо переименовать файл **/packer/variables_full.json.example** в **/packer/variables_full.json**,заполнить переменные
    - и запустить **deploy_full_template.sh**
  * скрипт для сборки инстанса на основе ранее развернутого full-темплея
    - для корректной сборки инстанса нужно, что бы в файле create-redditvm.sh было заполнено поле:
      - ID_PROJECT
    - так же по желанию можно заполнить и другие переменные
    - после запуска инстанса и установки приложения, статус работы можно проверить:
      - перейдя непосредственно на сервер через ssh root@ip_instance или
      - перейдя по линку http://ip_instance:9292

## Old home work
[old](README_old.md)

## Автор

   * **Vassiliy Yegorov** - *Initial work* - [vasyakrg](https://github.com/otus-devops-2019-05/vasyakrg_infra)
