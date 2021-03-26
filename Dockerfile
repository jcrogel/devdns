FROM amd64/golang

RUN mkdir -p /go/src/
WORKDIR /go/src/
COPY ./src ./

#RUN /go/src/build.sh
RUN go build -ldflags "-w"
#RUN go install -v ./...
#RUN ls /go/src

CMD ["/go/src/devdns"]