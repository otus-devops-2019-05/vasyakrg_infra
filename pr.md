# Выполнено ДЗ № 11

 - [X] Основное ДЗ
 - [X] Задание со *
 - [X] Задание со **

## В процессе сделано:
  - vagrant и молекула в работе, файлы перебазоированы, плейбуки переписаны
  - vagrant на Mac OS запускается от vagrant - подмазал под это

## Задание со звездочкой:
  - так же, черех extra_vars передал конфигурацию nginx, что бы прокидывать через порт 80 на порт 9292 трафик
  - вынес роль db в отдельный проект (так же прописал зависимость от тегов, что бы переключать на нужную версию)
  - подключил тревис, который собирает и проверяет роль, и рисует зеленую картиночку
  - так же в слак приходит уведомление о тесте
    - вывод тревиса [тут](https://api.travis-ci.com/v3/job/217865181/log.txt)
    - два дня убил, что бы победить paramiko - нашел [решение](https://freelancing.studio/paramiko-and-rsa-key/) в итоге

## Тестирование проекта:
  1. molecule --debug test

## PR checklist
 - [X] Выставил label ansible
 - [X] Выставил label ansible-4
