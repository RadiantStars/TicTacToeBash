#!/bin/bash

if [ "$1" != "X" ] && [ "$1" != "O" ]
then
        echo "Arg 1: must be X or O" >/dev/stderr
        exit 1
fi

if [ ! -f "$2" ]
then
        echo "Arg 2: Must be a readable file" >/dev/stderr
        exit 2
fi


line=($(tr "\n" " " < "$2"))

for ((i=0; i<"${#line[*]}"; i++))
do
        if (( "${line[$i]}" > 9 )) || (( "${line[$i]}" < 1))
        then
                echo "Arg 2: File must contain intergers 1-9" >/dev/stderr
                exit 3
        fi
done



player="$1"
game=(- - - - - - - - -)

pswitch() {
        if [ "$player" == "X" ]
        then
                player="O"

        elif [ "$player" ==  "O" ]
        then
                player="X"
        fi

}

wincheck() {

if [ "${game[0]}" == "X" ] && [ "${game[1]}" == "X" ] && [ "${game[2]}" == "X" ]
then
        echo "X"
        return
elif [ "${game[3]}" == "X" ] && [ "${game[4]}" == "X" ] && [ "${game[5]}" == "X" ]
then
        echo "X"
        return
elif [ "${game[6]}" == "X" ] && [ "${game[7]}" == "X" ] && [ "${game[8]}" == "X" ]
then
        echo "X"
        return
elif [ "${game[0]}" == "X" ] && [ "${game[3]}" == "X" ] && [ "${game[6]}" == "X" ]
then
        echo "X"
        return
elif [ "${game[1]}" == "X" ] && [ "${game[4]}" == "X" ] && [ "${game[7]}" == "X" ]
then
        echo "X"
        return
elif [ "${game[2]}" == "X" ] && [ "${game[5]}" == "X" ] && [ "${game[8]}" == "X" ]
then
        echo "X"
        return
elif [ "${game[0]}" == "X" ] && [ "${game[4]}" == "X" ] && [ "${game[8]}" == "X" ]
then
        echo "X"
        return
elif [ "${game[6]}" == "X" ] && [ "${game[4]}" == "X" ] && [ "${game[2]}" == "X" ]
then
        echo "X"
        return
fi

if [ "${game[0]}" == "O" ] && [ "${game[1]}" == "O" ] && [ "${game[2]}" == "O" ]
then
        echo "O"
        return
elif [ "${game[3]}" == "O" ] && [ "${game[4]}" == "O" ] && [ "${game[5]}" == "O" ]
then
        echo "O"
        return
elif [ "${game[6]}" == "O" ] && [ "${game[7]}" == "O" ] && [ "${game[8]}" == "O" ]
then
        echo "O"
        return
elif [ "${game[0]}" == "O" ] && [ "${game[3]}" == "O" ] && [ "${game[6]}" == "O" ]
then
        echo "O"
        return
elif [ "${game[1]}" == "O" ] && [ "${game[4]}" == "O" ] && [ "${game[7]}" == "O" ]
then
        echo "O"
        return
elif [ "${game[2]}" == "O" ] && [ "${game[5]}" == "O" ] && [ "${game[8]}" == "O" ]
then
        echo "O"
        return
elif [ "${game[0]}" == "O" ] && [ "${game[4]}" == "O" ] && [ "${game[8]}" == "O" ]
then
        echo "O"
        return
elif [ "${game[6]}" == "O" ] && [ "${game[4]}" == "O" ] && [ "${game[2]}" == "O" ]
then
        echo "O"
        return
fi

echo "draw"
}
index=$(( "${line[0]}" - 1 ))

game["$index"]="$player"

for ((i=1; i<"${#line[*]}"; i++))
do
        pswitch
        index=$(( "${line[$i]}" - 1 ))

        if [ "${game["$index"]}" != "-" ]
        then
                echo "Two Players cannot play in the same spot" >/dev/stderr
                exit 3
        fi

        game["$index"]="$player"
        win=$(wincheck)

        if [ "$win" == "X" ] || [ "$win" == "O" ]
        then
                break
        fi
done

echo " ${game[0]} | ${game[1]} | ${game[2]} "
echo " --------- "
echo " ${game[3]} | ${game[4]} | ${game[5]} "
echo " --------- "
echo " ${game[6]} | ${game[7]} | ${game[8]} "
echo ""

if [ "$win" == "X" ]
then
        echo "X is the winner!"
        exit 4
elif [ "$win" == "O" ]
then
        echo "O is the winner!"
        exit 5
elif [ "$win" == "draw" ]
then
        echo "The game ends in a tie."
        exit 6
fi