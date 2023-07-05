## Part 1. Готовый докер

Взять официальный докер образ с nginx и выкачать его при помощи __docker pull__

Проверить наличие докер образа через __docker images__

<dr>*Результат выполнения команды __docker pull nginx__*<dr>

<dr>*Результат выполнения команды __docker images__*<dr>

![nginx](task1/task%201.1.png)

Запустить докер образ через docker __run -d [image_id|repository]__

Проверить, что образ запустился через __docker ps__

<dr>*Результат выполнения команды __docker run -d nginx__*<dr>

<dr>*Результат выполнения команды __docker ps__*<dr>

![docker images](task1/task%201.2.png)

Посмотреть информацию о контейнере через __docker inspect -s [container_id|container_name]__

<dr>*Результат выполнения команды __docker inspect -s b492e7a19eb2*<dr>

![docker inspect](task1/task%201.3.png)

- Размер контейнера: 141768575 байт (142 MB)

<dr>*Отображение в терминале*<dr>

![Size](task1/task%201.6.png)

- Список замапленных портов: 80 в null

<dr>*Отображение в терминале*<dr>

![Ports](task1/task%201.5.png)

- ip контейнера: 172.17.0.2

<dr>*Отображение в терминале*<dr>

![IP](task1/task%201.4.png)

Остановить докер образ через __docker stop [container_id|container_name]__

<dr>*Результат выполнения команды __docker stop silly_feistel__*<dr>

![Docker stop](task1/task%201.7.png)

Проверить, что образ остановился через __docker ps__

<dr>*Результат выполнения команды __docker ps__*<dr>

![Ps](task1/task%201.8.png)

Запустить докер с замапленными портами 80 и 443 на локальную машину через команду __run__

<dr>*Используем команду __docker run -d -p 80:80 -p 443:443 nginx__ для запуска докера с замаплеными портами*<dr>

![ports80 443](task1/task%201.9.png)

Проверить, что в браузере по адресу __localhost:80__ доступна стартовая страница nginx

![page nginx](task1/task%201.10.png)

Перезапустить докер контейнер через __docker restart [container_id|container_name]__

<dr>*Результат выполнения команды __docker restart*<dr>

<dr>*Проверяем как сработал рестарт командой __docker ps__*<dr>

![restart](task1/task%201.11.png)

## Part 2. Операции с контейнером

Прочитать конфигурационный файл nginx.conf внутри докер образа через команду __exec__

<dr>*Для чтения файла выполняем команду __docker exec -it serene_ishizaka cat /etc/nginx/nginx.conf__*<dr>

![cat](task2/task%202.1.png)

_Создаем папку __nginx_conf__ и в ней файл с помощью команды __touch nginx.conf___

<dr>*Смотрим результат*<dr>

![conf](task2/task%202.3.png)

Настроить в нем по пути __/status__ отдачу страницы статуса сервера nginx

<dr>*Смотрем содержимое созданого конфига*<dr>

![cat conf](task2/task%202.2.png)

Скопировать созданный файл __nginx.conf__ внутрь докер образа через команду docker cp

<dr>*Для этого используем команду __docker cp nginx/nginx.conf serene_ishizaka:/etc/nginx/nginx.conf__*<dr>

<dr>*После сразу проверяем произошли ли изменения с помощю комадны __docker exec -it serene_ishizaka cat /etc/nginx/nginx.conf__*<dr>

![docker cp](task2/task%202.4.png)

Перезапустить __nginx__ внутри докер образа через команду exec

<dr>*Для этого используем команду __docker exec -it serene_ishizaka nginx -s reload__*<dr>

![exec](task2/task%202.5.png)

Проверить, что по адресу __localhost:80/status__ отдается страничка со статусом сервера nginx

![status](task2/task%202.6.png)

Экспортировать контейнер в файл __container.tar__ через команду export

<dr>*Для этого используем команду __docker export serene_ishizaka > container.tar__*<dr>



Остановить контейнер

<dr>*Используется команда docker stop serene_ishizaka*<dr>

![stop](task2/task%202.7.png)

Удалить образ через docker rmi [image_id|repository], не удаляя перед этим контейнеры

<dr>*Используется команда __docker rmi -f nginx__*<dr>

![rmi](task2/task%202.8.png)

Импортировать контейнер обратно через команду import

<dr>*Для этого приеняем команду __docker import container.tar carnaget__*<dr>

![import](task2/task%202.9.png)

Запустить импортированный контейнер

<dr>*Применяем команду __docker run -d -p 80:80 -p 443:433 carnaget /docker-entrypoint.sh nginx -g "daemon off;"__*<dr>

![entrypoint](task2/task%202.10.png)

Проверить, что по адресу __localhost:80/status__ отдается страничка со статусом сервера nginx

![nginx status](task2/task%202.11.png)