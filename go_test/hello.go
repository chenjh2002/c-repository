package main

import "fmt"

import "rsc.io/quote"

import "greetings"

func main(){
	fmt.Println(quote.Go())
	var message string 
	message=fmt.Sprintf("Hi,Welcome!")
	fmt.Println(message)
}