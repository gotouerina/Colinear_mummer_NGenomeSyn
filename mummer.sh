#利用mummer进行比对，绘制染色体点图
#usage: sh -r gene1 -q gene2 -o outdir
while getopts ":r:q:o:" opt
do
	case $opt in
		r)
			geo1=$OPTARG
			;;
		q)
			geo2=$OPTARG
			;;
		o)
			mulu=$OPTARG
			;;
		?)
			echo usage:sh mummer.sh -r gene1 -q gene2 -o outdir
	esac
done
if [ ! -d $mulu ]; then
	mkdir $mulu
fi

PATH="$PATH":/home/106public/software/mummer-4.0.0rc1/bin ; export PATH && \
nucmer  --mum --mincluster 500 -t 5 $geo1  $geo2 -p $mulu &&\
delta-filter -1 -i 90 -l 2000 $mulu.delta >  $mulu.filter1.delta  && \
show-coords -c -r $mulu.delta > $mulu.coords && \
mummerplot -f -R $geo1 -Q $geo2 -p $mulu  -s large -t postscript  $mulu.filter1.delta ; \
convert $mulu.ps $mulu.pdf ; \
mv $mulu.coords $mulu.delta $mulu.filter $mulu.fplot $mulu.gp $mulu.ps $mulu.rplot $mulu.filter1.delta $mulu.pdf $mulu &&\
echo 染色体点图绘制成功，请查看pdf文件
##produced by kogoorimasaki
