s="/glade/scratch/djk2120"
cd $s

for i in {101..170}; do
    echo $i
    for d in *'SP_US'*'a'$i*; do

	exp=$(echo $d | cut -d_ -f2)
	newdir="/glade/scratch/djk2120/PPEn11/amflx_lhc/hist/"$exp"/"

	cd $d"/run"
	mv *.clm2.h1.* $newdir
	cd $s

    done
done
