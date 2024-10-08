#!/bin/bash

APPS_DIR="apps"
SETTINGS_FILE="core/settings.py"

declare -a APPS=() 

while true; do
    read -p "Введите имя приложения (или 'exit' для завершения): " APP
    if [[ "$APP" == "exit" ]]; then
        break
    fi
    APPS+=("$APP")
done

for APP in "${APPS[@]}"; do
    python3 manage.py startapp "$APP"
    mv "$APP" "$APPS_DIR/"

    APP_DIR="$APPS_DIR/$APP"

    touch "$APP_DIR/urls.py"
    touch "$APP_DIR/serializers.py"

    cat > "$APP_DIR/urls.py" <<EOL
from django.urls import path
from . import views

urlpatterns = [
    # Пример: path('route/', views.ViewName.as_view(), name='view-name'),
]
EOL

    cat > "$APP_DIR/serializers.py" <<EOL
from rest_framework import serializers

# Пример: class YourSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = YourModel
#         fields = '__all__'
EOL

    echo "Созданы файлы: $APP_DIR/urls.py и $APP_DIR/serializers.py"
done

for APP in "${APPS[@]}"; do
    APPS_FILE="$APPS_DIR/$APP/apps.py"

    if [ -f "$APPS_FILE" ]; then
        sed -i "s/name = '.*'/name = 'apps.$APP'/g" "$APPS_FILE"
        echo "Изменён файл: $APPS_FILE"
    else
        echo "Файл не найден: $APPS_FILE"
    fi
done

for APP in "${APPS[@]}"; do
    if ! grep -q "'apps.$APP'," "$SETTINGS_FILE"; then
        sed -i "/^] + DEFAULT_INSTALLED_APPS/i\    'apps.$APP'," "$SETTINGS_FILE"
        echo "Добавлено в INSTALLED_APPS: 'apps.$APP'"
    else
        echo "'apps.$APP' уже добавлено в INSTALLED_APPS"
    fi
done



