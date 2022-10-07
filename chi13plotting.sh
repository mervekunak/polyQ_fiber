### Run this code in $system/analysis/chi/all directory!!!!

for p in {0..12..4}; do
    z=$(($p*36))
    for i in {5..15..1}; do
        k=$i
        kk=$((36-i))
        echo pla [-180:180][-180:180] chiGLN{$(($k+36*0+$z)),$(($kk+36*0+$z)),$(($k+16+36*1+$z)),$(($kk-16+36*1+$z)),$(($k+36*2+$z)),$(($kk+36*2+$z)),$(($k+16+36*3+$z)),$(($kk-16+36*3+$z))}.xvg u 2:6 w p &
    done
    read -p "Press enter to continue"
done
