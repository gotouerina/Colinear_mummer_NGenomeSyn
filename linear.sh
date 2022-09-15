#利用Ng脚本
##usage sh linear.sh -r gene1 -q gene2 -e outprefix -b mummer's bin
while getopts ":r:q:b:e:" opt
do
	case $opt in 
		r)
			geo1=$OPTARG
			;;
		q)
			geo2=$OPTARG
			;;
		b)
			bi=$OPTARG
			;;
		e)
			ou=$OPTARG
			;;
		?)
			echo usage: sh linear.sh -r gene1 -q gene2 -e OutPrefix -b mummer\'s bin
	esac
done
perl /data/01/user214/colinear/NGenomeSyn1/bin/GetTwoGenomeSyn.pl -InGenomeA $geo1 -InGenomeB $geo2 -OutPrefix $ou -BinDir $bi
