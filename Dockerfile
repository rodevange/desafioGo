FROM golang:1.19.0-alpine as build

COPY *.go ./
 
RUN CGO_ENABLED=0 go build -o /meu-app app.go

FROM scratch

COPY --from=build /meu-app /meu-app 

CMD [ "/meu-app" ]