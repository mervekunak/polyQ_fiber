''' K2Q30K2 polyQ 3res turn inner GLN index numbers '''
from numpy import zeros

#fragment numbers for each protein type
prot=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

#inner GLN indexes for each protein type
turn=[17,18,19,33]
#turnB=turnA
#innerB=[19,21,23,25,37,29,36,38,40,42,44,46,48]
 
#fragments for each wall
#wall1=[0,2,4,6]; wall2=[1,3,5,7]

#wall1inner=[]; wall2inner=[]
#Aturn=[]; Bturn=[]

turnres=zeros((len(prot)*len(turn),),dtype=int)
ch_len=36 #chain length
wall1 = [0,1,4,5]
wall2 = [2,3,6,7]
others = [ ]
for i in range(0,16):
    #print(i)

    for j in range(0,len(turn)):

        turnres[i*len(turn)+j] = i*ch_len + turn[j] 
    print([(i+1)*ch_len + j for j in prot])   
    if i not in wall1:
       
        others = others + [(i+1)*ch_len + j for j in prot] 
        
print(turnres)
print(others)
