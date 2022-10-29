# this is an example for a function that can be alised in tcsh via:

# alias pa 'bash -c "source .cshfunctions.sh; `pa_function_alias`"'
# alias pa 'bash -c "source .cshfunctions.sh; some_binary -a `pa_function_alias`"'

pa_function_alias(){
  echo "Hello from bash"
  echo "folder is $PWD"
}
