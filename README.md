# obsidian-protos

Общий репозиторий с protobuf-схемами и сгенерированным Go-кодом для RTC-приложения.

В дальнейшем сюда же планируется добавлять переиспользуемые Go-пакеты для других микросервисов.

## Установка

```bash
go get github.com/Zed3611/obsidian-protos
```

Импорт сгенерированных пакетов:

```go
import authv1 "github.com/Zed3611/obsidian-protos/gen/go/auth/v1"
```

## Структура

```
proto/<service>/<version>/*.proto   — исходные .proto файлы
gen/go/<service>/<version>/         — сгенерированный Go-код (*.pb.go, *_grpc.pb.go)
```

На данный момент в репозитории:

- `auth/v1` — сервис аутентификации

## Генерация кода

После изменения любого `.proto`-файла необходимо перегенерировать Go-код и закоммитить его вместе с изменением схемы:

```bash
make gen-auth
```

Требования:

- `protoc`
- `protoc-gen-go`
- `protoc-gen-go-grpc`

Для нового сервиса добавьте таргет `gen-<service>` в `makefile` по аналогии с `gen-auth`.

## Конвенции

- Пакет в `.proto`: `package <service>.<version>;`
- `option go_package = "obsidian.<service>.<version>";`
- ID-поля используют тип `int64`
- Сгенерированный код коммитится в репозиторий — downstream-модули зависят от него напрямую
