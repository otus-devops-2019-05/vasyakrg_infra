# vasyakrg_infra
[![Build Status](https://travis-ci.com/otus-devops-2019-05/vasyakrg_infra.svg?branch=ansible-2)](https://travis-ci.com/otus-devops-2019-05/vasyakrg_infra)

## HW9
  * packer теперь работает с образами через ansible (устанавливая все что необходимо)
  * terraform через свой output выдает данные для последующего использования в динамическом инвентори
  * ansible настраивает через плейбук обе виртуалки, передавая необходимые настройки в app и в db, а так же производит деплой приложения
  * как результат имеем полностью настроенное и рабочее приложение


## HW8
  * в прогоне простого плейбука и при выполнения
    > ansible app -m command -a 'rm -rf ~/reddit'

    - изменяется флаг "changed", т.к плейбуку приходится снова создавать директору и клонировать туда репу

  * Задания со *
    - добавил в разделе terraform в stage и в prod реализацию формирования json файла inventory после поднятия инстансов (использую темплей)
      - файл заливается в папку с ансиблом
    - добавил скрипты на питоне которые читают json скрипт и скармливают его в ansible

## HW7
  * Скрипт поднимает два инстанса:
    - один для mondoDB (берется из образа, в образе измененная конфигурация - порт 27017 открыт на всех интерфейсах)
    - второй, для приложения (в процессе сборки исходя из состояния переменной install_app - определяется, будет ли развернуто приложение из скрипта /files/deploy.sh)
      - если приложение разворачивается, происходит линковка между инстансами и приложение начинает пользоваться базой данных
      - правила фаерволла запрещают стучаться на порт 27017 кому либо, кроме адреса инстанса приложения
  * запускать сприпт можно из двух окружений: stage и prod
    - разница в том, что на prod окружении ssh-доступ к инстансам возможен только с адресов, указанных в переменной access_range
  * tfstate - хранится в бакете, как и сам бакет создае сам себя

## HW6
  * Скрипт создает необходимое количество инстансов и запускает load-balancer, а так же прописывает ssh ключи
    - переменные загружаются с terraform.tfvars
    - переменные по умолчанию с variables.tf
    - ssh ключи создаются (и берутся) через terraform, если добавлять доополнительные ключи через web-интерфейс - то при следующем обновлении конфигурации добавленные ключи будут удалены!
    - sshKeys на уровне инстансов не используется
    - кол-во инстрансов создается (и добавляется в lb) на основе count описанной в variables.tf (по умолчанию = 1) и переопределяется в terraform.tfvars
    - по завершениию выводятся адреса созданных инстансов и адрес load-balancer

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

## HW4
* в отдельной ветке перенес файлы setupvpn.sh и cloud-bastion.ovpn в папку VPN через git mv
* создал папку **scripts** с файлами для создания нового инстанса и создания правила для файервола, а так же первоначальными скриптами для установки окружения и деплоя приложения с github
* на истансе сначала создаются файлы с баш-скриптами (для удобства отладки), а потом запускаются устанавливая зависимости и разворачивая приложение
    * после запуска приложения так же создается файл **puma_state.txt** в дирректории /home/userapp/reddit - для информативности
* все задачи выполняются автоматизировано, запуском единственного баш-скрипта **deploy_instance.sh**
    * скрипт запускает gloud команды (само собой, gloud должен быть настроен на учетную запись и прикреплен к вашему проекту)
    * скрипты по подготовке к деплою и сам деплой создаю на инстансе, что бы потом от туда ими проще было манипулировать
* так же в корне положил скрипты деплоя - что бы тесты проходили и тревис запускал у себя обертку

### подключение к test_app
    testapp_IP = 34.90.190.195
    testapp_port = 9292

## HW3
  * Прошел регистрацию в GCP
  * Добавил ssh_key в метаданные
  * Создал два инстанса:
     - bastion (ext_ip: 34.90.190.195, int_ip: 10.164.0.2)
     - someinternalhost	(int_ip: 10.164.0.3)
   * для проброса ключей в виртуалки с только внутренним адресом подключаю агента ssh и привязываю ему приватный ключ:
        > ssh-add -i ~/.ssh/id_rsa  
   * для прямого доступа в одну команду использую jump прыжок:
      > ssh -A -J root@34.90.190.195 root@10.164.0.3
#### Задание со звездочкой
    Для добавления алиса на рабочей машине и доступа на прямую в хост someinternalhost использую:
      > alias someinternalhost="ssh -A -J root@34.90.190.195 root@10.164.0.3"

    и соответственно получаю выполнение команды в один запрос:
      >  someinternalhost

    Если требуется, что бы алисы работали и после перезапуска терминала, то надо раскомментить настройки в вашем "~/.bashrc"
      ```  if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
        fi
      ```  
    А алисы добавлять по принципу:
      >  echo "someinternalhost='sh -A -J root@34.90.190.195 root@10.164.0.3'" >> ~/.bash_aliases && source ~/.bash_aliases

#### VPN сервер
    ##### параметры подключения:
     bastion_IP = 34.90.190.195
     someinternalhost_IP = 10.164.0.3
#### SSL - задание со *
    Прописал на поднятом VPN сервере SSL сертификат, использую собственное доменное имя.
    Теперь сервер доступен по адресу: https://bastion.realmanual.ru

![Image1](https://realmanual.ru/devops-img/1.jpeg)
![Image2](https://realmanual.ru/devops-img/2.jpeg)

## HW2
 * Добавлена интеграция с Travis и Slack
 * Исправлен тест на питоне (поправил Equal 1+1 = 2)
 * Добавлен шаблон для PR

## HW1
  * Initial commit :)


## Автор

   * **Vassiliy Yegorov** - *Initial work* - [vasyakrg](https://github.com/otus-devops-2019-05/vasyakrg_infra)
