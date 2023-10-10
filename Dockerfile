FROM golang:1.21.2-alpine3.18 AS builder
WORKDIR /go/src/fullcycle
COPY . .
RUN go build


FROM scratch
COPY --from=builder /go/src/fullcycle/fullcycle-go .
ENTRYPOINT [ "./fullcycle-go" ]
