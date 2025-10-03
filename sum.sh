#!/bin/bash
# This script demonstrates command line arguments
Num1=$1
Num2=$2
# in bash we can do arithmetic operation using $(( ))
Sum=$((Num1 + Num2))
echo "The sum of $Num1 and $Num2 is: $Sum"