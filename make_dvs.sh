#!/bin/bash
FilePath=~/git/make-dvs # NECESSARY TO CHANGE BASED ON YOUR HARDDISK!!! / TREBA ZMENIT PODLE SVEHO DISKU!!!

# Parameters for 300dir protocol
#SHELLS=6 # number of shells in q-space (possible to select 2 or 3) / pocet slupek v q-prostoru (mozne zvolit 2 nebo 3)
#b0NUM=4 # number of b0 values minus 1 / pocet b0 hodnot minus 1
#bNUM=300 # number of gradient waveforms with b higher than 0 / pocet gradientnich smeru s nenulovou b hodnotou
#b1=500 # b1-value / b1 hodnota
#b2=1000 # b2-value / b2 hodnota
#b3=1500 # b3-value / b3 hodnota
#b4=2000 # b4-value / b4 hodnota
#b5=2500 # b5-value / b5 hodnota
#b6=3000 # b6-value / b6 hodnota
##b7=2750 # b7-value / b7 hodnota
##b8=3000 # b8-value / b8 hodnota
#TYPE=sc-bmax3000 # number of directions per shell given by: https://docs.google.com/spreadsheets/d/13CaOOP0zGU_vhCipeYcnqmA6rW0poMGTQ-q8z7zrCAs/edit#gid=0
##TYPE=SPNpS # same point number per shell
#DATE=20240324 # YYYYMMDD
#printlabel=0
#increasevariable1=1


# Convert 90dir 3shell txt file
SHELLS=3 # number of shells in q-space (possible to select 2 or 3) / pocet slupek v q-prostoru (mozne zvolit 2 nebo 3)
b0NUM=4 # number of b0 values minus 1 / pocet b0 hodnot minus 1
bNUM=90 # number of gradient waveforms with b higher than 0 / pocet gradientnich smeru s nenulovou b hodnotou
b1=1000 # b1-value / b1 hodnota
b2=2000 # b2-value / b2 hodnota
b3=3000 # b3-value / b3 hodnota
#b4=2000 # b4-value / b4 hodnota
#b5=2500 # b5-value / b5 hodnota
#b6=3000 # b6-value / b6 hodnota
##b7=2750 # b7-value / b7 hodnota
##b8=3000 # b8-value / b8 hodnota
TYPE=sc-bmax3000 # number of directions per shell given by: https://docs.google.com/spreadsheets/d/13CaOOP0zGU_vhCipeYcnqmA6rW0poMGTQ-q8z7zrCAs/edit#gid=0
#TYPE=SPNpS # same point number per shell
DATE=20240408 # YYYYMMDD
printlabel=0
increasevariable1=0


ProtocolFile=${FilePath}/${bNUM}dir_${SHELLS}shells_${TYPE}_$DATE.txt
b0NUMTOTAL=$(($b0NUM + 1))
if [ $SHELLS -eq 2 ]; then	
	B1=$(echo "scale=8;$b1/$b2" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B2=$(echo "scale=8;$b2/$b2" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	DVSFILE=$FilePath/${bNUM}dir_${SHELLS}shells_${TYPE}_b0_${b0NUMTOTAL}_b1_${b1}_b2_${b2}_${DATE}.dvs.txt
	B1=$(echo "scale=8;sqrt($B1)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	#echo $DVSFILE
	#echo $B1
	#echo $B2
elif [ $SHELLS -eq 3 ]; then
	B1=$(echo "scale=8;$b1/$b3" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B2=$(echo "scale=8;$b2/$b3" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B3=$(echo "scale=8;$b3/$b3" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	DVSFILE=$FilePath/${bNUM}dir_${SHELLS}shells_${TYPE}_${DATE}.dvs.txt
	B1=$(echo "scale=8;sqrt($B1)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B2=$(echo "scale=8;sqrt($B2)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	#echo $DVSFILE
	#echo $B1
	#echo $B2
	#echo $B3
elif [ $SHELLS -eq 6 ]; then
    #B1=$(echo "scale=8;$b1/$b4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./') # If split on two separate protocols with B4 max, then divide with b4 the first four b-values
	#B2=$(echo "scale=8;$b2/$b4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	#B3=$(echo "scale=8;$b3/$b4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	#B4=$(echo "scale=8;$b4/$b4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B1=$(echo "scale=8;$b1/$b6" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B2=$(echo "scale=8;$b2/$b6" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B3=$(echo "scale=8;$b3/$b6" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B4=$(echo "scale=8;$b4/$b6" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B5=$(echo "scale=8;$b5/$b6" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B6=$(echo "scale=8;$b6/$b6" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	DVSFILE=$FilePath/${bNUM}dir_${SHELLS}shells_${TYPE}_${DATE}.dvs.txt
	B1=$(echo "scale=8;sqrt($B1)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B2=$(echo "scale=8;sqrt($B2)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B3=$(echo "scale=8;sqrt($B3)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B4=$(echo "scale=8;sqrt($B4)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B5=$(echo "scale=8;sqrt($B5)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B6=$(echo "scale=8;sqrt($B6)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
elif [ $SHELLS -eq 8 ]; then
    B1=$(echo "scale=8;$b1/$b4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B2=$(echo "scale=8;$b2/$b4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B3=$(echo "scale=8;$b3/$b4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B4=$(echo "scale=8;$b4/$b4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B5=$(echo "scale=8;$b5/$b8" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B6=$(echo "scale=8;$b6/$b8" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B7=$(echo "scale=8;$b7/$b8" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B8=$(echo "scale=8;$b8/$b8" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	DVSFILE=$FilePath/${bNUM}dir_${SHELLS}shells_${TYPE}_${DATE}.dvs.txt
	B1=$(echo "scale=8;sqrt($B1)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B2=$(echo "scale=8;sqrt($B2)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B3=$(echo "scale=8;sqrt($B3)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B4=$(echo "scale=8;sqrt($B4)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B5=$(echo "scale=8;sqrt($B5)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B6=$(echo "scale=8;sqrt($B6)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B7=$(echo "scale=8;sqrt($B7)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	B8=$(echo "scale=8;sqrt($B8)" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	#echo $DVSFILE
	#echo $B1
	#echo $B2
	#echo $B3
	#echo $B4
	#echo $B5
	#echo $B6
	#echo $B7
	#echo $B8
fi

DIRECTION=0
#DIRECTION_TOTAL=$(($bNUM + $b0NUM + 1))
DIRECTION_TOTAL=$(($bNUM + $b0NUM))
b0STEP=$(($bNUM / $b0NUM))
b0IND=0
echo "[directions=`echo $DIRECTION_TOTAL`]" > $DVSFILE
echo "CoordinateSystem = xyz" >> $DVSFILE
echo "Normalisation = none" >> $DVSFILE

{
read -r
while read -r LINE; do
	VARIABLE1=$(echo $LINE | cut -f1 -d ' ')
	VARIABLE2=$(echo $LINE | cut -f2 -d ' ')
	VARIABLE3=$(echo $LINE | cut -f3 -d ' ')
	VARIABLE4=$(echo $LINE | cut -f4 -d ' ')
	if [ $increasevariable1 -eq 1 ]; then
	    VARIABLE1=$(($VARIABLE1+1))
    fi
	if [ $VARIABLE1 -eq 1 ]; then
		VEC1=$(echo "scale=8;$B1*$VARIABLE2" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC2=$(echo "scale=8;$B1*$VARIABLE3" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC3=$(echo "scale=8;$B1*$VARIABLE4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	elif [ $VARIABLE1 -eq 2 ]; then
		VEC1=$(echo "scale=8;$B2*$VARIABLE2" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./') 
		VEC2=$(echo "scale=8;$B2*$VARIABLE3" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC3=$(echo "scale=8;$B2*$VARIABLE4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	elif [ $VARIABLE1 -eq 3 ]; then
		VEC1=$(echo "scale=8;$B3*$VARIABLE2" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC2=$(echo "scale=8;$B3*$VARIABLE3" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC3=$(echo "scale=8;$B3*$VARIABLE4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	elif [ $VARIABLE1 -eq 4 ]; then
		VEC1=$(echo "scale=8;$B4*$VARIABLE2" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC2=$(echo "scale=8;$B4*$VARIABLE3" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC3=$(echo "scale=8;$B4*$VARIABLE4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	elif [ $VARIABLE1 -eq 5 ]; then
		VEC1=$(echo "scale=8;$B5*$VARIABLE2" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC2=$(echo "scale=8;$B5*$VARIABLE3" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC3=$(echo "scale=8;$B5*$VARIABLE4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	elif [ $VARIABLE1 -eq 6 ]; then
		VEC1=$(echo "scale=8;$B6*$VARIABLE2" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC2=$(echo "scale=8;$B6*$VARIABLE3" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC3=$(echo "scale=8;$B6*$VARIABLE4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	elif [ $VARIABLE1 -eq 7 ]; then
		VEC1=$(echo "scale=8;$B7*$VARIABLE2" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC2=$(echo "scale=8;$B7*$VARIABLE3" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC3=$(echo "scale=8;$B7*$VARIABLE4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	elif [ $VARIABLE1 -eq 8 ]; then
		VEC1=$(echo "scale=8;$B8*$VARIABLE2" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC2=$(echo "scale=8;$B8*$VARIABLE3" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
		VEC3=$(echo "scale=8;$B8*$VARIABLE4" | bc -l | sed -e 's/^\./0./' -e 's/^-\./-0./')
	fi
	#echo $VEC1
	#echo $VEC2
	#echo $VEC3
	if [ $DIRECTION -eq $(($b0IND * $b0STEP)) ]; then
	    if [ $b0IND -lt $b0NUM ];then
		    echo "Vector[$DIRECTION] = (0.00000000, 0.00000000, 0.00000000 )" >> $DVSFILE
		    DIRECTION=$(($DIRECTION + 1))
	    fi
		b0IND=$(($b0IND + 1))
	fi
	if [ $printlabel -eq 1 ] && [ $VARIABLE1 -eq 5 ];then
	    echo "b>2000 below" >> $DVSFILE
	    printlabel=0
    fi
	echo "Vector[$DIRECTION] = ($VEC1, $VEC2, $VEC3 )" >> $DVSFILE
	DIRECTION=$(($DIRECTION + 1))
done
} < $ProtocolFile
