# foo=bar
# echo "$foo"
# # print foo
# echo '$foo'

# mcd(){
#     mkdir -p "$1"
#     cd "$1"
# }

false || echo "Oops fail"

true || echo "Will not be printed"

true && echo "Things went well"
# Things went well

false && echo "Will not be printed"
#

true ; echo "This will always run"
# This will always run

false ; echo "This will always run"
# This will always run
