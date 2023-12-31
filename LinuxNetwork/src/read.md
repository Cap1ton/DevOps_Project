# Сети в Linux

<br>

## Part 1. Инструмент **ipcalc**

<br>

**== Задание ==**
<br>
-1) Поднять виртуальную машину (Далее -- ws1)

-2) Сети и маски
<br> Определить и записать в отчёт:
<br> -2.1) Адрес сети *192.167.38.54/13*
<br>    - 2.2) Перевод маски *255.255.255.0* в префиксную и двоичную запись, */15* в обычную и двоичную, *11111111.11111111.11111111.11110000* в обычную и префиксную
<br>    - 2.3) Минимальный и максимальный хост в сети *12.167.38.4* при масках: */8*, *11111111.11111111.00000000.00000000*, *255.255.254.0* и */4*

- 3) localhost
<br>    Определить и записать в отчёт, можно ли обратиться к приложению, работающему на localhost, со следующими IP: *194.34.23.100*, *127.0.0.2*, *127.1.0.1*, *128.0.0.1*

- 4) Диапазоны и сегменты сетей
<br>    Определить и записать в отчёт:
<br>    4.1) какие из перечисленных IP можно использовать в качестве публичного, а какие только в качестве частных: *10.0.0.45*, *134.43.0.2*, *192.168.4.2*, *172.20.250.4*, *172.0.2.1*, *192.172.0.1*, *172.68.0.2*, *172.16.255.255*, *10.10.10.10*, *192.169.168.1*
<br>    4.2) какие из перечисленных IP адресов шлюза возможны у сети *10.10.0.0/18*: *10.0.0.1*, *10.10.0.2*, *10.10.10.10*, *10.10.100.1*, *10.10.1.255*

<br>

**== Выполнение ==**
<br>

- 1: Машина создана с нужным неймом

<br>*Созданная машина*<br>

![Созданная машина](Task%201/task%201.1.png)
<br>

- 2: Сети и маски 
<br>* установка ipcalc

![Установка ipcalc](Task%201/task%201.0.png)
    - 2.1) Адрес сети *192.167.38.54/13* 
<br>*Результат работы команды ipcalc по этим данным*<br>

![Результат работы команды ipcalc по этим данным](Task%201/task%201.3.png)
<br>

- 2.2:
<br> Перевод маски 255.255.255.0

<br>*Отображение в консоли*<br>

![Отображение в консоли](Task%201/task%201.4.png)
<br> По результатам вывода можно сказать, что:
<br>    -Прификсная запись - 24
<br>    -Двоичная запись - 11111111.11111111.11111111.00000000
<br>
<br>    Перевод прификсной записи /15

<br>*Отображение в консоли*<br>

![Отображение в консоли](Task%201/task%201.5.png)
<br>    По результату вывода можно сказать что:
<br>        - Обычная запись 255.254.0.0
<br>        - Двоичная запись 11111111.11111110.00000000.00000000
<br>
<br>    Перевод бинарной записи 11111111.11111111.11111111.11110000:
<br>    Так как мы не можем на прямую обратиться к бинарному представлению через *ipcalc*, почитаем в ручную
<br>        - Прификс будет равен /28 (Количество активных едениц подряд)
<br>        - Маска будет равна 255.255.255.240 (Что соответствует прификсу /28)
<br> 

- 2.3: Минимальный и максимальный хост в сети *12.167.38.4* при масках:
<br>        
        - */8*:

<br>*Min, max host /8*<br>

![Min, max host /8](Task%201/task%201.6.png)

    - *11111111.11111111.00000000.00000000*:

<br>*Min, max, host 11111111.11111111.00000000.00000000*<br> 

![Min, max, host 11111111.11111111.00000000.00000000](Task%201/task%201.7.png)

    -*255.255.254.0*

<br>*Min, max host 255.255.254.0*<br>

![Min, max host 255.255.254.0](Task%201/task%201.8.png)
    -*/4*:

<br>*Min,max host /4*<br>

![Min,max host /4](Task%201/task%201.9.png)
<br>

- 3 localhost:
<br>    Определить, можно ли обратиться к приложению, работающему на localhost, со следующими IP: *194.34.23.100*, *127.0.0.2*, *127.1.0.1*, *128.0.0.1*:
<br>    Определим min - max localhost:

<br>*Min, max localhost*<br>

![Min, max localhost](Task%201/task%201.10.png)

<br>    Зная min - max, можно сказать что IP: 127.0.0.2, 127.1.0.1; подходят для поставленой выше задачи
<br>

- 4: Диапазоны и сегменты сетей:
<br>    - 4.1 Какие из перечисленных IP можно использовать в качестве публичного, а какие только в качестве частных: 
<br>    *10.0.0.45* , *192.168.4.2* , *172.20.250.4* , *172.16.255.255* , *10.10.10.10* - частные;
<br>    *134.43.0.2* , *172.0.2.1* , *192.172.0.1* , *172.68.0.2* , *192.169.168.1* - публичные;
<br>    - 4.2 какие из перечисленных IP адресов шлюза возможны у сети *10.10.0.0/18*:
<br>    Узнаем min - max для этой сети

<br>*min, max 10.10.0.0/18*<br>

![min, max 10.10.0.0/18](Task%201/task%201.11.png)

<br>    На основе этого можно сказать что не подходят только: 10.10.100.1 и 10.0.0.1
<br>

## Part 2. Статическая маршрутизация между двумя машинами

**== Задание ==**

<br>
<br> - С помощью команды `ip a` посмотреть существующие сетевые интерфейсы
<br> - В отчёт поместить скрин с вызовом и выводом использованной команды.
<br> - Описать сетевой интерфейс, соответствующий внутренней сети, на обеих машинах и задать следующие адреса и маски: ws1 - *192.168.100.10*, маска */16*, ws2 - *172.24.116.8*, маска */12*
<br> - В отчёт поместить скрины с содержанием изменённого файла *etc/netplan/00-installer-config.yaml* для каждой машины.
<br> - Выполнить команду `netplan apply` для перезапуска сервиса сети
<br> - В отчёт поместить скрин с вызовом и выводом использованной команды.

<br> 2.1. Добавление статического маршрута вручную
<br> - Добавить статический маршрут от одной машины до другой и обратно при помощи команды вида `ip r add`
<br> - Пропинговать соединение между машинами
<br> - В отчёт поместить скрин с вызовом и выводом использованных команд.

<br> 2.2. Добавление статического маршрута с сохранением
<br> - Перезапустить машины
<br> - Добавить статический маршрут от одной машины до другой с помощью файла *etc/netplan/00-installer-config.yaml*
<br> - В отчёт поместить скрин с содержанием изменённого файла *etc/netplan/00-installer-config.yaml*.
<br> - Пропинговать соединение между машинами
<br> - В отчёт поместить скрин с вызовом и выводом использованной команды.
<br>

**== Выполнение ==**
<br> 

- 1: результат работы команды *ip a*, на обоих машинах

<br>*Машина ws1*<br>

![Машина ws1](task%202/task%202.0.png)

<br>*Машина ws2*<br>

![Машина ws2](task%202/task%202.1.png)

<br>

- 2: Описать сетевой интерфейс, соответствующий внутренней сети, на обеих машинах и задать следующие адреса и маски: ws1 - 192.168.100.10, маска /16, ws2 - 172.24.116.8, маска /12

<br> - Редактируем соответствующие файлы в netplan на каждой машине и смотрим результат, и пременяем sudo netplan apply

<br>*Проверка результатов ws1*<br>

![Проверка результатов ws1](task%202/task%202.2.png)

<br>*Проверка результатов ws2*<br>

![Проверка результатов ws2](task%202/task%202.3.png)

<br>

- 3: Добавление статического маршрута вручную

<br> - Используем команду *sudo ip r add [нужный id] dev enp0s3* на каждой машние и пингуем их

<br>*Результат установки статического соединения*<br>

![Результат установки статического соединения](task%202/task%202.4.png)

- 4 Добавление статического маршрута с сохранением

<br> - Перезапускаем машины с помощью команды *shutdown -r now*

<br>*Результат*<br>

![Результат](task%202/task%202.5.png)

<br> - Редактируем netplan и смотрим результат 

<br>*Изменёный netplan*<br>

![Изменёный netplan](task%202/task%202.6.png)

<br> - Пингуем обе машины

<br>*Результат пинга*<br>

![Результат пинга](task%202/task%202.7.png)

<br>

## Part 3. Утилита **iperf3**

**== Задание ==**

<br>

- 1: 8 Mbps = 1 MB/s, 100 MB/s = 819200 Kbps, 1 Gbps = 1024 Mbps

- 2 Утилита **iperf3**:

<br>

<br> - Как сервер будет использоваться машина ws1 - 192.168.100.10, а как клиент машину ws2 - 172.24.116.8

<br> - Используем команду *iperf3 -s* на машине которая будет сервером
<br> - После используем команду *iperf3 -c 192.168.100.10* на клиентской машине

<br>*Результат выполнения команд на обоих машинах*<br>

![Результат выполнения команд на обоих машинах](Task%203/task%203.0.png)

<br>

## Part 4. Сетевой экран

**== Задание ==**

*В данном задании используются виртуальные машины ws1 и ws2 из Части 2*

- 4.1. Утилита **iptables**
- Создать файл */etc/firewall.sh*, имитирующий фаерволл, на ws1 и ws2:
<br>
shell
#!/bin/sh

# Удаление всех правил в таблице "filter" (по-умолчанию).
iptables –F
iptables -X

<br>

- Нужно добавить в файл подряд следующие правила:
- 1) на ws1 применить стратегию когда в начале пишется запрещающее правило, а в конце пишется разрешающее правило (это касается пунктов 4 и 5)
- 2) на ws2 применить стратегию когда в начале пишется разрешающее правило, а в конце пишется запрещающее правило (это касается пунктов 4 и 5)
- 3) открыть на машинах доступ для порта 22 (ssh) и порта 80 (http)
- 4) запретить *echo reply* (машина не должна "пинговаться”, т.е. должна быть блокировка на OUTPUT)
- 5) разрешить *echo reply* (машина должна "пинговаться")
- В отчёт поместить скрины с содержанием файла */etc/firewall* для каждой машины.
- Запустить файлы на обеих машинах командами `chmod +x /etc/firewall.sh` и `/etc/firewall.sh`
- В отчёт поместить скрины с запуском обоих файлов.
- В отчёте описать разницу между стратегиями, применёнными в первом и втором файлах.

- 4.2. Утилита **nmap**
- Командой **ping** найти машину, которая не "пингуется", после чего утилитой **nmap** показать, что хост машины запущен
*Проверка: в выводе nmap должно быть сказано: `Host is up`*
- В отчёт поместить скрины с вызовом и выводом использованных команд **ping** и **nmap**.

- Сохранить дампы образов виртуальных машин

<br>

**== Выполнение ==**

<br>

1: Утилита **iptables**

<br>

- Создаём файлы *firewall.sh* на обоих машинах командой *sudo nano /etc/firewall.sh*

- Заполняем всем необходимы по заданию

<br>*Отредктированные фйлы на двух машинах*<br>

![Отредактированные файлы на двух машинах](Task%204/task%204.0.png)

- Смотрим результаты внесённых изменений

<br>*Лист iptables и работа ping*<br>

![Лист iptables и работа ping](Task%204/task%204.1.png)

- Машина ws1 не пингуется, не возвращая ответов, в отличии от ws2
- Из этого можно сделать вывод что команда которая стоит выше по листу *iptables* не перестает работать если ниже была противоречащая команда

<br>

2: Утилита **nmap**

<br>

- Пингуем машины ещё раз 

<br>*Результаты пинга*<br>

![Результаты пинга](Task%204/task%204.2.png)

- На скриншоте видно что не пингуется машина с *ip 192.168.100.10*, это ws1

- Используем *nmap* c второй машины

<br>*Результат работы команды*<br>

![Результат работы команды](Task%204/task%204.3.png)

- Ответ *Host is up* был получен, значит машина работает

<br>

## Part 5. Статическая маршрутизация сети

`-` Пока что мы соединяли всего две машины, но теперь пришло время для статической маршрутизации целой сети.

**== Задание ==**

##### Поднять пять виртуальных машин (3 рабочие станции (ws11, ws21, ws22) и 2 роутера (r1, r2))

#### 5.1. Настройка адресов машин
##### Настроить конфигурации машин в *etc/netplan/00-installer-config.yaml* согласно сети на рисунке.
- В отчёт поместить скрины с содержанием файла *etc/netplan/00-installer-config.yaml* для каждой машины.
##### Перезапустить сервис сети. Если ошибок нет, то командой `ip -4 a` проверить, что адрес машины задан верно. Также пропинговать ws22 с ws21. Аналогично пропинговать r1 с ws11.
- В отчёт поместить скрины с вызовом и выводом использованных команд.

#### 5.2. Включение переадресации IP-адресов.
##### Для включения переадресации IP, выполните команду на роутерах:
`sysctl -w net.ipv4.ip_forward=1`
*При таком подходе переадресация не будет работать после перезагрузки системы.*
- В отчёт поместить скрин с вызовом и выводом использованной команды.
##### Откройте файл */etc/sysctl.conf* и добавьте в него следующую строку:
`net.ipv4.ip_forward = 1`
*При использовании этого подхода, IP-переадресация включена на постоянной основе.*
- В отчёт поместить скрин с содержанием изменённого файла */etc/sysctl.conf*.

#### 5.3. Установка маршрута по-умолчанию
Пример вывода команды `ip r` после добавления шлюза:
```
default via 10.10.0.1 dev eth0
10.10.0.0/18 dev eth0 proto kernel scope link src 10.10.0.2
```
##### Настроить маршрут по-умолчанию (шлюз) для рабочих станций. Для этого добавить `default` перед IP роутера в файле конфигураций
- В отчёт поместить скрин с содержанием файла *etc/netplan/00-installer-config.yaml*.
##### Вызвать `ip r` и показать, что добавился маршрут в таблицу маршрутизации
- В отчёт поместить скрин с вызовом и выводом использованной команды.
##### Пропинговать с ws11 роутер r2 и показать на r2, что пинг доходит. Для этого использовать команду:
`tcpdump -tn -i eth1`
- В отчёт поместить скрин с вызовом и выводом использованных команд.

#### 5.4. Добавление статических маршрутов
##### Добавить в роутеры r1 и r2 статические маршруты в файле конфигураций. Пример для r1 маршрута в сетку 10.20.0.0/26:
```shell
# Добавить в конец описания сетевого интерфейса eth1:
- to: 10.20.0.0
  via: 10.100.0.12
```
- В отчёт поместить скрины с содержанием изменённого файла *etc/netplan/00-installer-config.yaml* для каждого роутера.
##### Вызвать `ip r` и показать таблицы с маршрутами на обоих роутерах. Пример таблицы на r1:
```
10.100.0.0/16 dev eth1 proto kernel scope link src 10.100.0.11
10.20.0.0/26 via 10.100.0.12 dev eth1
10.10.0.0/18 dev eth0 proto kernel scope link src 10.10.0.1
```
- В отчёт поместить скрин с вызовом и выводом использованной команды.
##### Запустить команды на ws11:
`ip r list 10.10.0.0/[маска сети]` и `ip r list 0.0.0.0/0`
- В отчёт поместить скрин с вызовом и выводом использованных команд.
- В отчёте объяснить, почему для адреса 10.10.0.0/\[порт сети\] был выбран маршрут, отличный от 0.0.0.0/0, хотя он попадает под маршрут по-умолчанию.

#### 5.5. Построение списка маршрутизаторов
Пример вывода утилиты **traceroute** после добавления шлюза:
```
1 10.10.0.1 0 ms 1 ms 0 ms
2 10.100.0.12 1 ms 0 ms 1 ms
3 10.20.0.10 12 ms 1 ms 3 ms
```
##### Запустить на r1 команду дампа:
`tcpdump -tnv -i eth0`
##### При помощи утилиты **traceroute** построить список маршрутизаторов на пути от ws11 до ws21
- В отчёт поместить скрины с вызовом и выводом использованных команд (tcpdump и traceroute).
- В отчёте, опираясь на вывод, полученный из дампа на r1, объяснить принцип работы построения пути при помощи **traceroute**.

#### 5.6. Использование протокола **ICMP** при маршрутизации
##### Запустить на r1 перехват сетевого трафика, проходящего через eth0 с помощью команды:
`tcpdump -n -i eth0 icmp`
##### Пропинговать с ws11 несуществующий IP (например, *10.30.0.111*) с помощью команды:
`ping -c 1 10.30.0.111`
- В отчёт поместить скрин с вызовом и выводом использованных команд.

<br>

**== Выполнение ==**

#### 5.1. Настройка адресов машин

- Создав все машины, мы редактируем netplan через *nano*.
- Далее применяем команду *sudo netplan apply* что бы изменения вступили в силу.
- Выключаем машины и внастройках виртуал бокс добавляем по одному одаптеру к роутерам. Это неоюходимо для коректной работы доплонительных сетевых карт.
- Проверяем все сделаное.

<br>*Результат настройки r2*<br>

![Результат настройки r2](Task%205/Task%205.0.png)

<br>*Результат настройки r1 и ws11*<br>

![Результат настройки r1 и ws11](Task%205/Task%205.1.png)

<br>*Результат нстройки ws21 и ws22*<br>

![<br>*Результат нстройки ws21 и ws22*<br>](Task%205/Task%205.2.png)

#### 5.2. Включение переадресации IP-адресов.

- Применяем команду *sysctl -w net.ipv4.ip_forward=1* на роутерах

<br>*Результат на r2*<br>

![Результат на r2](Task%205/Task%205.3.png)

<br>*Результат на r1*<br>

![Результат на r1](Task%205/Task%205.4.png)

- Открывем фаил /etc/sysctl.conf и добавляем в него строку *net.ipv4.ip_forward = 1*

<br>*Отредактированый файл на r1*<br>

![Отредактированый файл на r1](Task%205/Task%205.5.png)

<br>*Отредактированый файл на r2*<br>

![Отредактированый файл на r2](Task%205/Task%205.6.png)

#### 5.3. Установка маршрута по-умолчанию

- Меняем настройки netplan на каждой машине ws и сразу смотрим результаты

<br>

<br>*Результаты на ws21*<br>

![Результаты на ws21](Task%205/Task%205.7.png)

<br>*Результаты на ws22*<br>

![Результаты на ws22](Task%205/Task%205.8.png)

<br>*Результаты на ws11*<br>

![Результаты на ws11](Task%205/Task%205.9.png)

- Пингуем r2 с w11, для проверки работоспособности настроек

<br>*Реузльтаты пинга*<br>

![Реузльтаты пинга](Task%205/Task%205.10.png)

#### 5.4. Добавление статических маршрутов

<br>

- проводим настройку роутеров и выводим  *ip r*

<br>*Настройки r2*<br>

![Настройки r2](Task%205/Task%205.11.png)

<br>*Настройки r1*<br>

![Настройки r1](Task%205/Task%205.12.png)

- Применяем команды *ip r list 10.10.0.0/18* и *ip r list 0.0.0.0/0* на ws11

<br>*Результат выполнения команд*<br>

![Результат выполнения команд](Task%205/Task%205.13.png)

- В чем заключается различие, если есть два и более маршрутов на одну и ту же сеть, маршрутизация осуществляется по принципу наибольшего совпадения маски.
Что это значит для нашего случая? Так как вариант не с нулевой маской нашёл совпадения с нашим нетворком его отправило по заданому маршруту, а с нулевой маской совпадения не нашлись и его закинуло в дефолт.

<br>Я устал, босс… Устал писать этот отчёт, одинокий, как воробей под дождём… Я устал, что у меня никогда не было друга, с которым можно поговорить о чем то кроме линукса, что происходит в netplan, откуда и зачем… Я устал, что все 5 тачек жестоки и беспощадны! Я устал от боли, которую я чувствую при выполнении DO2_LinuxNetwork-0.Это слишком много! Здесь, в голове, как будто осколки стекла. Каждый день! Ты можешь понять?<br>

<br>

#### 5.5. Построение списка маршрутизаторов

<br>

- Используем команду *tcpdump -tnv -i enp0s3* на r1
и сразу после строим маршрут с помощью *traceroute*
- Посмотрим результаты вывода на обоих машинах

<br>*Вывод на дампе r1 и на ws11*<br>

![Вывод на дампе r1 и на ws11](Task%205/Task%205.14.png)

<br>*Продолжение вывода*<br>

![Продолжение вывода](Task%205/Task%205.15.png)

- Для понимания работы *traceroute* нужно разобрать несколько других вещей
- У любого посылаемого пакета имеется свое "вермя жизни"
- Время жизни определяет сколько узлов может пройти пакет
- Этот параметор записывается в виде TTL, при прохождении узла значения TTL уменьшается на еденицу
- Теперь к сути, команда traceroute linux использует UDP пакеты. Она отправляет пакет с TTL=1 и смотрит адрес ответившего узла, дальше TTL=2, TTL=3 и так пока не достигнет цели. Каждый раз отправляется по три пакета и для каждого из них измеряется время прохождения. Пакет отправляется на случайный порт, который, скорее всего, не занят. Когда утилита traceroute получает сообщение от целевого узла о том, что порт недоступен трассировка считается завершенной. Так же если пакеты не заходят в "тупик" и все необходимые порты достпны, о этой ситуации тоже приходит сообщение и трассировка заканчивается.

<br>

#### 5.6. Использование протокола **ICMP** при маршрутизации

<br>

- Делаем перехват трафик на r1 и пингуем с ws11

<br>*Результат выполнения команд*<br>

![Результат выполнения команд](Task%205/Task%205.16.png)

## Part 6. Динамическая настройка IP с помощью **DHCP**

<br>

**== Задание ==**

*В данном задании используются виртуальные машины из Части 5*

##### Для r2 настроить в файле */etc/dhcp/dhcpd.conf* конфигурацию службы **DHCP**:
##### 1) указать адрес маршрутизатора по-умолчанию, DNS-сервер и адрес внутренней сети. Пример файла для r2:
```shell
subnet 10.100.0.0 netmask 255.255.0.0 {}

subnet 10.20.0.0 netmask 255.255.255.192
{
    range 10.20.0.2 10.20.0.50;
    option routers 10.20.0.1;
    option domain-name-servers 10.20.0.1;
}
```
##### 2) в файле *resolv.conf* прописать `nameserver 8.8.8.8.`
- В отчёт поместить скрины с содержанием изменённых файлов.
##### Перезагрузить службу **DHCP** командой `systemctl restart isc-dhcp-server`. Машину ws21 перезагрузить при помощи `reboot` и через `ip a` показать, что она получила адрес. Также пропинговать ws22 с ws21.
- В отчёт поместить скрины с вызовом и выводом использованных команд.

##### Указать MAC адрес у ws11, для этого в *etc/netplan/00-installer-config.yaml* надо добавить строки: `macaddress: 10:10:10:10:10:BA`, `dhcp4: true`
- В отчёт поместить скрин с содержанием изменённого файла *etc/netplan/00-installer-config.yaml*.
##### Для r1 настроить аналогично r2, но сделать выдачу адресов с жесткой привязкой к MAC-адресу (ws11). Провести аналогичные тесты
- В отчёте этот пункт описать аналогично настройке для r2.
##### Запросить с ws21 обновление ip адреса
- В отчёте поместить скрины ip до и после обновления.
- В отчёте описать, какими опциями **DHCP** сервера пользовались в данном пункте.

**== Выполнение ==**

<br>

- Редактируем фаилы conf, задавая настройки по умолчанию

<br>*Отредактированый dhcpd.conf*<br>

![Отредактированый dhcpd.conf](Task%206/Task%206.0.png)

<br>*Отредактированый resolv.conf*<br>

![Отредактированый resolv.conf](Task%206/Task%206.1.png)

- Смотрим получится ли применить настройки, а также сразу проверяем будет ли продолжать работать сеть между машинами

<br>*Применение настроек на r2*<br>

![Применение настроек на r2](Task%206/Task%206.2.png)

<br>*Работа и изменения на ws21*<br>

![Работа и изменения на ws21](Task%206/Task%206.3.png)

<br>*Работа и изменения на ws22*<br>

![Работа и изменения на ws22](Task%206/Task%206.4.png)

<br>*Изменёные файлы и проверка работоспособности с изменениями*<br>

![Изменёные файлы и проверка работоспособности с изменениями](Task%206/Task%206.5.png)

- Тепермь запросим новый ip с сервера на машину ws21

- Перед этим уберём старый ip командой *sudo dhclient -r*

- Применяем команду *sudo dhclient enp0s3*

<br>*Результаты выполнения команд*<br>

![Результаты выполнения команд](Task%206/Task%206.6.png)

<br>

## Part 7. **NAT**

<br>

**== Задание ==**

*В данном задании используются виртуальные машины из Части 5*
##### В файле */etc/apache2/ports.conf* на ws22 и r1 изменить строку `Listen 80` на `Listen 0.0.0.0:80`, то есть сделать сервер Apache2 общедоступным
- В отчёт поместить скрин с содержанием изменённого файла.
##### Запустить веб-сервер Apache командой `service apache2 start` на ws22 и r1
- В отчёт поместить скрины с вызовом и выводом использованной команды.
##### Добавить в фаервол, созданный по аналогии с фаерволом из Части 4, на r2 следующие правила:
##### 1) Удаление правил в таблице filter - `iptables -F`
##### 2) Удаление правил в таблице "NAT" - `iptables -F -t nat`
##### 3) Отбрасывать все маршрутизируемые пакеты - `iptables --policy FORWARD DROP`
##### Запускать файл также, как в Части 4
##### Проверить соединение между ws22 и r1 командой `ping`
*При запуске файла с этими правилами, ws22 не должна "пинговаться" с r1*
- В отчёт поместить скрины с вызовом и выводом использованной команды.
##### Добавить в файл ещё одно правило:
##### 4) Разрешить маршрутизацию всех пакетов протокола **ICMP**
##### Запускать файл также, как в Части 4
##### Проверить соединение между ws22 и r1 командой `ping`
*При запуске файла с этими правилами, ws22 должна "пинговаться" с r1*
- В отчёт поместить скрины с вызовом и выводом использованной команды.
##### Добавить в файл ещё два правила:
##### 5) Включить **SNAT**, а именно маскирование всех локальных ip из локальной сети, находящейся за r2 (по обозначениям из Части 5 - сеть 10.20.0.0)
*Совет: стоит подумать о маршрутизации внутренних пакетов, а также внешних пакетов с установленным соединением*
##### 6) Включить **DNAT** на 8080 порт машины r2 и добавить к веб-серверу Apache, запущенному на ws22, доступ извне сети
*Совет: стоит учесть, что при попытке подключения возникнет новое tcp-соединение, предназначенное ws22 и 80 порту*
- В отчёт поместить скрин с содержанием изменённого файла.
##### Запускать файл также, как в Части 4
*Перед тестированием рекомендуется отключить сетевой интерфейс **NAT** (его наличие можно проверить командой `ip a`) в VirtualBox, если он включен*
##### Проверить соединение по TCP для **SNAT**, для этого с ws22 подключиться к серверу Apache на r1 командой:
`telnet [адрес] [порт]`
##### Проверить соединение по TCP для **DNAT**, для этого с r1 подключиться к серверу Apache на ws22 командой `telnet` (обращаться по адресу r2 и порту 8080)
- В отчёт поместить скрины с вызовом и выводом использованных команд.

<br>

**== Выполнение ==**

<br>

- Меняем содержимое файлов *ports.conf* на r1 и ws22

<br>*Измененые конфиги*<br>

![Измененые конфиги](Task%207/Task%207.0.png)

- Запускаем сервера

<br>*Результаты запуска*<br>

![Результаты запуска](Task%207/Task%207.1.png)

- Прописываем новые правила в *firewall.sh* на r2

<br>*Изменения в firewall.sh*<br>

![Изменения в firewall.sh](Task%207/Task%207.2.png)

- По заданию пробуем пропинговать машины r1 и ws22

<br>*Результаты пинга*<br>

![Результаты пинга](Task%207/Task%207.3.png)

- Добавляем разрешающие правило для icmp пакетов

<br>*Внесёные изменения*<br>

![Внесёные изменения](Task%207/Task%207.4.png)

- Пробуем провести пинг ещё раз

<br>*Результаты повторного пинга*<br>

![Результаты повторного пинга](Task%207/Task%207.5.png)

- Добавим последние правила по заданию 

<br>*Измененый конфиг*<br>

![Измененый конфиг](Task%207/Task%207.6.png)

- Проверяем настройки с помощью *telnet*

<br>*Результат работы утилиты на r1 и ws22*<br>

![Результат работы утилиты на r1 и ws22](Task%207/Task%207.7.png)

<br>

## Part 8. Дополнительно. Знакомство с **SSH Tunnels**

<br>

**== Задание ==**

##### Запустить на r2 фаервол с правилами из Части 7
##### Запустить веб-сервер **Apache** на ws22 только на localhost (то есть в файле */etc/apache2/ports.conf* изменить строку `Listen 80` на `Listen localhost:80`)
##### Воспользоваться *Local TCP forwarding* с ws21 до ws22, чтобы получить доступ к веб-серверу на ws22 с ws21
##### Воспользоваться *Remote TCP forwarding* c ws11 до ws22, чтобы получить доступ к веб-серверу на ws22 с ws11
##### Для проверки, сработало ли подключение в обоих предыдущих пунктах, перейдите во второй терминал (например, клавишами Alt + F2) и выполните команду:
`telnet 127.0.0.1 [локальный порт]`
- В отчёте описать команды, необходимые для выполнения этих четырёх пунктов, а также приложить скриншоты с их вызовом и выводом.

<br>

**== Выполнение ==**

<br>

- Меняем кофиг apache2 для ws22 

<br>*Внесёные изменения*<br>

![Внесёные изменения](Task%208/task%208.0.png)

- Проводим устоновку apache2 и ssh

- Запускаем все нужные сервера и смотрим их статус

<br>*Статус серверов*<br>

![Статус серверов](Task%208/Task%208.1.png)

- Ставим тунель на машине ws21 и проверяем успешность подключения

<br>*Создание ssh тунеля*<br>

![Создание ssh тунеля](Task%208/Task%208.2.png)

<br>*Проверка подключения*<br>

![Проверка подключения](Task%208/Task%208.3.png)

- Проводим ту же операцию с ws11, только под флагом -R

<br>*Создание ssh тунеля*<br>

![Создание ssh тунеля](Task%208/Task%208.4.png)

<br>*Проверка подключения*<br>

![Проверка подключения](Task%208/Task%208.5.png)

<br>