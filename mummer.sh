#利用mummer进行比对，绘制染色体点图
#使用方法：sh mummer.sh
#!!不支持同一文件夹下多次执行！！
read -p "请输入要比对的物种A的fa文件：" gene1
read -p "请输入要比对的物种B的fa文件：" gene2
read -p "请自定义新建文件夹名:" mulu
mkdir $mulu || echo 文件名已存在，结果将输入同名文件中
PATH="$PATH":/data/01/user214/colinear/bin ; export PATH && \
	echo mummer加载成功，正在进行比对 && \
	nucmer  --mum --mincluster 500 -t 30 $gene1  $gene2 -p OUT &&\
	echo 比对成功，正在过滤中 &&\
	delta-filter -1 -i 90 -l 2000 OUT.delta >  OUT.filter1.delta  && \
	echo 过滤成功，正在画图 &&\
	mummerplot -f -R $gene1 -Q $gene2 -p OUTFig  -s large -t postscript  OUT.filter1.delta ; \
	convert OUTFig.ps out.pdf && \
	mv OUT.delta OUTFig.filter OUTFig.fplot OUTFig.gp OUTFig.ps OUTFig.rplot OUT.filter1.delta out.pdf $mulu &&\
	echo 染色体点图绘制成功，请查看out.pdf文件
