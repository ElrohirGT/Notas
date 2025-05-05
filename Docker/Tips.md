# Docker Tips

You can use layers to only rebuild what you need each time, for example for a
quick go app:

```docker
FROM golang:1.24 AS build

WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
# COPY go.mod go.sum ./
COPY go.mod ./
RUN go mod download

COPY . .
RUN go build -v -o /usr/local/bin/app .

FROM alpine:3.14

COPY --from=build /usr/local/bin/app .

CMD ["app"]
```
