# vasyakrg_infra
##### vasyakrg Infra repository

* #### HW1
   * Добавлена интеграция с Travis и Slack
   * Исправлен тест на питоне (поправил Equal 1+1 = 2)
   * Добавлен шаблон для PR

* #### HW2
   * Прошел регистрацию в GCP
   * Добавил ssh_key в метаданные
   * Создал два инстанса:
     * bastion (ext_ip: 34.90.190.195, int_ip: 10.164.0.2)
     * someinternalhost	(int_ip: 10.164.0.3)
   * для проброса ключей в виртуалки с только внутренним адресом подключаю агента ssh и привязываю ему приватный ключ:
   ```
   ssh-add -i ~/.ssh/id_rsa  
   ```
   * для прямого доступа в одну команду использую jump прыжок:
   ```
   ssh -A -J root@34.90.190.195 root@10.164.0.3
   ```
   * для добавления алиса на рабочей машине и доступа на прямую в хост someinternalhost использую:
   ```
   alias someinternalhost="ssh -A -J root@34.90.190.195 root@10.164.0.3"
   ```
   и соответственно получаю выполнение команды в один запрос:
   ```
   someinternalhost
   ```


   ## Автор

   * **Vassiliy Yegorov** - *Initial work* - [vasyakrg](https://github.com/otus-devops-2019-05/vasyakrg_infra)
