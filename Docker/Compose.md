# Docker Compose

## Key commands

```bash
# To start all the services defined in your compose.yaml file:
docker compose up 
```

```bash
# To stop and remove the running services:
docker compose down 
```

```bash
# If you want to monitor the output of your running containers and debug issues
docker compose logs 
```

```bash
# To list all the services along with their current status:
docker compose ps 
```

Example `compose.yaml` file:

```yaml
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    configs:
      - httpd-config
    secrets:
      - server-certificate

  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier

volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"

configs:
  httpd-config:
    external: true

secrets:
  server-certificate:
    external: true

networks:
  # The presence of these objects is sufficient to define them
  front-tier: {}
  back-tier: {}
```
