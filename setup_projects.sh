#!bin/bash

echo "enter program type(ex: .c or c)"
read TYPE
echo "\nEnter your project name: "
read name
NAME=$name
mkdir $NAME
case $TYPE in
	.c | c)
	echo "Add a copy of libft to project? (yes, no)"
	read LIB
	case $LIB in
		yes | y)
		git clone https://github.com/StevenSano/libft-personal.git $NAME/libft
		echo "Moved libft into $NAME Directory!\n"
		;;
		no | n)
		echo "NO libft needed!\n"
		;;
	esac
	mkdir $NAME/src
	mkdir $NAME/includes
	touch $NAME/includes/$NAME.h
	touch $NAME/Makefile
	echo > $NAME/Makefile "\nall: clean\n	gcc -o $NAME $NAME.c\n\nclean:\n	rm -rf $NAME\n"
	touch $NAME/$NAME.c
	echo > $NAME/$NAME.c "#include <$NAME.h>\n\nint main(void)\n{\n\treturn (0);\n}"
	echo "Project $NAME.c has been created!"
	echo "add .gitignore file? (yes, no)"
	read GITIG
	case $GITIG in
		yes | y)
		touch $NAME/.gitignore
		echo "Made .gitignore!"
		;;
		no | n)
		echo "NO .gitignore needed!"
		;;
	esac
	;;
esac
