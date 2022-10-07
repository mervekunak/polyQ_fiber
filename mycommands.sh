gmx eneconv -f ../ener.part* -o enerall.edr -e 50000

mkdir energy; mkdir box; mkdir chi; mkdir enerall;

echo Box|gmx energy -f ../ener.edr -o box/energy.xvg
echo Pot|gmx energy -f ../ener.edr -o energy/energy.xvg -b 9000
echo Pot|gmx energy -f ../ener.edr -o enerall/energy.xvg

gmx trjcat -f ../traj_comp.part* -o trajall.xtc -dt 1 -e 50000
echo 1|gmx trjconv -f ../traj_comp.xtc -pbc mol  -o trajviz.xtc -s ../topol.tpr -dt 10


cd chi;
gmx chi -f ../../traj_comp.xtc -maxchi 3 -s ../../topol.tpr -b 9000 -e 10000 -all

#delete xvg files except for strand gln residues
rm chi?GLN{17,18,19,33,53,54,55,69,89,90,91,105,125,126,127,141,161,162,163,177,197,198,199,213,233,234,235,249,269,270,271,285,305,306,307,321,341,342,343,357,377,378,379,393,413,414,415,429,449,450,451,465,485,486,487,501,521,522,523,537,557,558,559,573}.xvg

cat chi1GLN*|grep -e \# -e \@ -v  > allchi1GLN.xvg
cat chi2GLN*|grep -e \# -e \@ -v  > allchi2GLN.xvg
cat chi3GLN*|grep -e \# -e \@ -v  > allchi3GLN.xvg

gmx analyze -f allchi1GLN.xvg -dist hist-chi1GLN.xvg -bw 2.5
gmx analyze -f allchi3GLN.xvg -dist hist-chi3GLN.xvg -bw 2.5
gmx analyze -f allchi2GLN.xvg -dist hist-chi2GLN.xvg -bw 2.5

cd ../

printf "r GLN \n 10 & 8 \n ri 17  18  19  33  53  54  55  69  89  90  91 105 125 126 127 141 161 162 163 177 197 198 199 213 233 234 235 249 269 270 271 285 305 306 307 321 341 342 343 357 377 378 379 393 413 414 415 429 449 450 451 465 485 486 487 501 521 522 523 537 557 558 559 573 \n name 12 nonbondingGLN \n 10 & ! 12 \n name 13 hbondingGLN \n  7 & 13 \n 8 & 13 \n \n q \n" |gmx make_ndx -f ../topol.tpr

mkdir hbond;

echo 14 14|gmx hbond -f ../traj_comp.xtc  -b 14000  -s ../topol.tpr -n index.ndx -num hbond/hbnum-all.xvg
echo 14 15|gmx hbond -f ../traj_comp.xtc  -b 14000  -s ../topol.tpr -n index.ndx -num hbond/hbnumGLN-BB-all.xvg
echo 15 15|gmx hbond -f ../traj_comp.xtc  -b 14000  -s ../topol.tpr -n index.ndx -num hbond/hbnumGLN-all.xvg



#mkdir chi30ns;cd chi30ns;
#gmx chi -f ../trajall.xtc -maxchi 3 -s ../../topol.tpr -b 29000 -e 30000 -all

##delete xvg files except for strand gln residues
#rm chi?GLN{17,18,19,33,53,54,55,69,89,90,91,105,125,126,127,141,161,162,163,177,197,198,199,213,233,234,235,249,269,270,271,285,305,306,307,321,341,342,343,357,377,378,379,393,413,414,415,429,449,450,451,465,485,486,487,501,521,522,523,537,557,558,559,573}.xvg

#cat chi1GLN*|grep -e \# -e \@ -v  > allchi1GLN.xvg
#cat chi2GLN*|grep -e \# -e \@ -v  > allchi2GLN.xvg
#cat chi3GLN*|grep -e \# -e \@ -v  > allchi3GLN.xvg

#gmx analyze -f allchi1GLN.xvg -dist hist-chi1GLN.xvg -bw 2.5
#gmx analyze -f allchi3GLN.xvg -dist hist-chi3GLN.xvg -bw 2.5
#gmx analyze -f allchi2GLN.xvg -dist hist-chi2GLN.xvg -bw 2.5

#cd ../

