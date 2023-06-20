package main

import(
	"fmt"
	"log"
	"example.com/greetings"
)
func main(){
	//Set properties of the predefined Logger,including
	//the log entry prefix and a flag to disable printing
	//the time,source file, and line number
	log.SetPrefix("greetings:")
	log.SetFlags(0)

	//Get a greeting message and print it
	// message,err:=greetings.Hello("Glady")

	//A slice of names
	names:=[]string{"Gladys","Mike","Darrin"}

	//Request greeting messages for the names.
	messages,err:=greetings.Hellos(names)

	// if an error was returned,print it to the console and
	// exit the program
	if err!=nil{
		log.Fatal(err)
	}

	//if not error was returned,print the returned message
	//to the console

	fmt.Println(messages)
}