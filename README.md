# vasyakrg_infra
## HW1
   * Добавлена интеграция с Travis и Slack
   * Исправлен тест на питоне (поправил Equal 1+1 = 2)
   * Добавлен шаблон для PR

## HW2
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
        alias someinternalhost="ssh -A -J root@34.90.190.195 root@10.164.0.3"
    и соответственно получаю выполнение команды в один запрос:
        someinternalhost
    Если требуется, что бы алисы работали и после перезапуска терминала, то надо раскомментить настройки в вашем "~/.bashrc"
        if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
        fi
    А алисы добавлять по принципу:
        echo "someinternalhost='sh -A -J root@34.90.190.195 root@10.164.0.3'" >> ~/.bash_aliases && source ~/.bash_aliases

#### VPN сервер
    ##### параметры подключения:
     bastion_IP = 34.90.190.195
     someinternalhost_IP = 10.164.0.3
#### SSL - задание со *
    Прописал на поднятом VPN сервере SSL сертификат, использую собственное доменное имя.
    Теперь сервер доступен по адресу: https://bastion.realmanual.ru

![Image1](https://realmanual.ru/devops-img/1.jpeg)
![Image2](https://realmanual.ru/devops-img/2.jpeg)


   ## Автор

   * **Vassiliy Yegorov** - *Initial work* - [vasyakrg](https://github.com/otus-devops-2019-05/vasyakrg_infra)
