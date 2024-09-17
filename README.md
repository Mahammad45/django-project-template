# Django Project Template

Этот проект является шаблоном для быстрого старта нового проекта на Django.

## Установка

Установите зависимости с помощью pip:

```bash
pip install django django-jazzmin djangorestframework drf-yasg Pillow
```

## Конфигурация

1. Создайте файл `config.ini` в корне проекта.
2. Заполните файл следующим содержимым:

```ini
[Django]
LANGUAGE_CODE = ru
TIME_ZONE = Asia/Almaty

[PGDATABASE]
PGHOST = ваш_хост
PGUSER = ваш_пользователь
PGPASSWORD = ваш_пароль
PGDATABASE = ваша_база_данных
PGPORT = порт_базы_данных
```

Замените `ваш_хост`, `ваш_пользователь`, `ваш_пароль`, `ваша_база_данных` и `порт_базы_данных` соответственно на настройки вашей PostgreSQL базы данных.

## Запуск

Чтобы запустить проект, выполните следующие команды:

```bash
python manage.py migrate
python manage.py runserver
```

Откройте ваш браузер и перейдите на http://localhost:8000/ для просмотра вашего проекта.

## Лицензия

Этот проект лицензирован под [MIT License](LICENSE).
