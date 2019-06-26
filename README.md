# vasyakrg_infra
## HW4
  * создал конфиг для сборки начального темплея с установленными Ruby и mongoDB
    - для корректной сборки необходимо переименовать файл /packer/variables.json.example в /packer/variables.json и заполнить переменные
  * создал скрипт для сборки инстанса на основе ранее развернутого темплея
    - для корректной сборки инстанса нужно, что бы в файле create-redditvm.sh было корректно заполнено поле:
      - ID_PROJECT
    - так же по желанию можно заполнить и другие переменные
    - инстанс так же разворачивает у себя приложение monolith (скачивает из https://github.com/express42/reddit.git)
    - после запуска инстанса и установки приложения, статус работы можно проверить:
      - перейдя непосредственно на сервер через ssh и проверив содержимое файлика /home/userapp/reddit/puma_state.txt
      - перейдся по линку http://ip_instance:9292

## Old home work
[old](README_old.md)

## Автор

   * **Vassiliy Yegorov** - *Initial work* - [vasyakrg](https://github.com/otus-devops-2019-05/vasyakrg_infra)
