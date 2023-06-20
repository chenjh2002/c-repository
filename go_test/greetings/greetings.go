package greetings

import(
	"fmt"
	"errors"
	"math/rand"
	"time"
)

//Hello return agreetings for the named person
func Hello(name string) (string,error){
	//If no name was given,return anerror with a message
	if name==""{
		return "",errors.New("empty name")
	}
	//Return a greeting that embeds the name in a message
	message:=fmt.Sprintf(randomFormat(),name)
	return message,nil
}

//Hellos returns map that asscoiates each of the named people
//with agreeting message.
func Hellos(names []string)(map[string]string,error){
	//A map to associate names wirh messages.
	messages:=make(map[string]string)
	//Loop rheough rhe received slice of names,calling
	//the Hello function to get a messgae for each name.
	for _,name:=range names{
		message,err:=Hello(name)
		if err!=nil{
			return nil,err
		}
		//In the map,associate the retrieved message with
		//the name.
		messages[name]=message
	}
	return messages,nil
}


//init sets intial values for varible used in the function
func init(){
	rand.Seed(time.Now().UnixNano())
}


//randomFormat returns one of a set of greeting messages.The retuned
//message is selected at the random
func randomFormat() string{
	//A slice of message formats.
	formats:=[]string{
		"Hi,%v.welcome!\n",
		"Great to see you,%v\n",
		"Hail,%v!Well met!\n",
	}

	//Return a randomly selected message format by spcifying
	//a random index for the slice of formats.
	return formats[rand.Intn(len(formats))]
}