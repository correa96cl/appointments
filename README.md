# appointments
Agendamiento de horas.


```sh
docker run --name api-appointment -e POSTGRESQL_USERNAME=appointment -e POSTGRESQL_PASSWORD=appointment -e POSTGRESQL_DATABASE=apiappointment -p 5432:5432 bitnami/postgresql
```


```sh
npx prisma migrate dev
```

```sh
npx prisma studio
```

```sh
docker compose up -d
```


```sh
docker compose down
```

```sh
docker compose stop
```
