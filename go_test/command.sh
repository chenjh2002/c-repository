go mod init example.com/greetings
go mod edit -replace example.com/greetings=../greetings
go mod tidy
go run .


go build

export PATH=$PATH:/home/chenjh2002/go/bin/
go env -w GOBIN=/home/chenjh2002/go/bin/
go install
