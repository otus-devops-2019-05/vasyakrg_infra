# vasyakrg_infra
## HW6
  * Скрипт создает необходимое количество инстансов и запускает load-balancer, а так же прописывает ssh ключи
    - переменные загружаются с terraform.tfvars
    - переменные по умолчанию с variables.tf
    - ssh ключи создаются (и берутся) через terraform, если добавлять доополнительные ключи через web-интерфейс - то при следующем обновлении конфигурации добавленные ключи будут удалены!
    - sshKeys на уровне инстансов не используется
    - кол-во инстрансов создается (и добавляется в lb) на основе count описанной в variables.tf (по умолчанию = 1) и переопределяется в terraform.tfvars
    - по завершениию выводятся адреса созданных инстансов и адрес load-balancer

## Old home work
[old](README_old.md)

## Автор

   * **Vassiliy Yegorov** - *Initial work* - [vasyakrg](https://github.com/otus-devops-2019-05/vasyakrg_infra)
