
# Rails Project 64

### Hexlet tests and linter status:
[![Actions Status](https://github.com/Houssse/rails-project-64/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Houssse/rails-project-64/actions)
[![Lint](https://github.com/Houssse/rails-project-64/actions/workflows/lint.yml/badge.svg?branch=main)](https://github.com/Houssse/rails-project-64/actions/workflows/lint.yml)
[![Test](https://github.com/Houssse/rails-project-64/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/Houssse/rails-project-64/actions/workflows/test.yml)

---

### Описание
Это коллективный блог, в котором пользователи могут:  
- Создавать посты  
- Добавлять комментарии к постам  
- Ставить лайки постам  
Также проект включает систему регистрации и авторизации.

---

### Требования
- Ruby `3.2.2`
- Rails `7.2.2`
- PostgreSQL `14+` или SQLite3

---

### Установка

1. Клонируйте репозиторий:
   ```bash
   git clone git@github.com:Houssse/rails-project-64.git
   cd rails-project-64
   ```

2. Установите зависимости:
   ```bash
   bundle install
   yarn install
   ```

3. Настройте базу данных. Укажите свои данные в файле `config/database.yml` для PostgreSQL  
   или используйте SQLite3, добавив следующее в `config/database.yml`:
   ```yaml
   development:
     <<: *default
     adapter: sqlite3
   ```

4. Выполните команды для настройки базы данных:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

---

### Использование

Для запуска приложения перейдите в директорию проекта и выполните:
```bash
bin/dev
```

---

### Деплой

Проект развернут на [Render](https://render.com).  
Ссылка на приложение: [rails-project-64-5hpm.onrender.com](https://rails-project-64-5hpm.onrender.com)

---

### Тестирование

Для запуска тестов используйте команду:
```bash
make test
```

В проекте используются:  
- `Minitest`  
- `minitest-power_assert`
