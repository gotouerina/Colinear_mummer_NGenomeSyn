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
nucmer  --mum --mincluster 500 -t 30 $geo1  $geo2 -p OUT &&\
delta-filter -1 -i 90 -l 2000 OUT.delta >  OUT.filter1.delta  && \
show-coords -c -r OUT.delta > OUT.coords && \
mummerplot -f -R $geo1 -Q $geo2 -p OUTFig  -s large -t postscript  OUT.filter1.delta ; \
convert OUTFig.ps OUT.pdf && \
mv OUT.coords OUT.delta OUTFig.filter OUTFig.fplot OUTFig.gp OUTFig.ps OUTFig.rplot OUT.filter1.delta OUT.pdf $mulu &&\
cd $mulu && \
rename -v "OUT" "$mulu" *
echo 染色体点图绘制成功，请查看pdf文件
##produced by kogoorimasaki
