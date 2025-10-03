
#!/bin/bash
# A script to demonstrate conditional statements in bash

Number=$1
if [ $Number -gt 10 ]; then
    echo "The number is greater than 10."
elif [ $Number -eq 10 ]; then
    echo "The number is equal to 10."
else
    echo "The number is less than 10."
fi