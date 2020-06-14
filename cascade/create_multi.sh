if [ "$1" = "neg" ]
then
	dirs=(`ls ./single-neg -1 | awk '{ printf $0" " }'`)
else
	dirs=(`ls ./single-pos -1 | awk '{ printf $0" " }'`)
fi

for (( i=0;i<${#dirs[*]};i++ ))
do
	if [ "$1" = "neg" ]
	then
		./create_neg.sh "${dirs[$i]}" $2;
	else
		./create_pos.sh "${dirs[$i]}" $2;
	fi
done

