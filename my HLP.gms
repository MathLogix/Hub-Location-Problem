*************final file train plane   /////capacity hub added

sets
n all nodes /tehran, isfahan, tabriz, mashhad, shiraz, rasht, qazvin, urmia, yazd, kerman, gorgan, sanandaj, boshehr, sari, kermanshah, karaj, semnan, ahvaz, hamedan, zanjan/
h(n) candidate hub node /tehran, isfahan, tabriz, mashhad, shiraz/
nh(n) non hub node /rasht, qazvin, urmia, yazd, kerman, gorgan, sanandaj, boshehr, sari, kermanshah, karaj, semnan, ahvaz, hamedan, zanjan/
o(n) origins /rasht, qazvin, urmia, yazd/
d(n) destinations /kerman, gorgan, sanandaj, boshehr, sari, kermanshah, karaj, semnan, ahvaz, hamedan, zanjan/
k products /product1, product2, product3/
m transportation mode: 1: airplane 2: pickup 3: truck /airplane, train/
;
alias (n,np);
alias (h,hp);
alias (nh,nhp);

scalars
TW time window /2880/
*alfa /0.3/
*beta /0.1/
rtp har kilometer dar chand deqiqe. hub be qeyr hub /2/
rcp hazine peymodan har kilometer. hub be qeyr hub /1/
GREEN /15/
PRATE pollution rate truck /0.015/
WMax /20000/
;

parameters
alfa(m) /airplane 0.4, train 0.4/
beta(m) /airplane 2, train 2/
PR(m) pollution rate /airplane 0.01, train 0.015/
rt(m) har kilometer dar chand deqiqe /airplane 0.06, train 1.5/
rc(m) hazine peymodan har kilometer /airplane 3, train 0.5/
w(k) vazn kalaye k be kilogram /product1 2, product2 5, product3 10/
WM(m) hadaksar zarfiat be kilogram /airplane 100000, train 150000/
CAP(h) capacity of hub h /tehran 70000,isfahan 70000,tabriz 70000,mashhad 70000,shiraz 70000/
;

table flow(o,d,k)
                       product1       product2       product3
rasht.kerman           1464           1214           684
rasht.gorgan           1806           1269           1137
rasht.sanandaj         1264           1198           1434
rasht.kermanshah       856            821            1714
rasht.semnan           1291           1205           1452
rasht.ahvaz            1042           1214           1279
rasht.hamedan          895            1044           1396
qazvin.kerman          1175           1034           507
qazvin.sanandaj        857            1711           1683
qazvin.sari            794            857            942
qazvin.kermanshah      770            1947           1689
qazvin.semnan          1600           1240           538
qazvin.ahvaz           610            1408           1990
qazvin.zanjan          1113           1458           1557
urmia.gorgan           1453           592            747
urmia.sanandaj         843            1940           1401
urmia.boshehr          1621           976            826
urmia.sari             1054           1947           1482
urmia.karaj            807            762            1027
urmia.zanjan           1784           1942           1287
yazd.kerman            1933           1215           1133
yazd.sanandaj          1124           654            836
yazd.boshehr           1986           1877           1535
yazd.kermanshah        793            1650           994
yazd.semnan            1226           1933           995
yazd.ahvaz             1472           1491           803
yazd.hamedan           1888           1642           689
yazd.zanjan            965            1063           1423
;

table l(h,hp,m)
                   airplane       train
tehran.isfahan     80000          50000
tehran.tabriz      100000         60000
tehran.mashhad     70000          75000
tehran.shiraz      68000          90000
isfahan.tabriz     55000          75000
isfahan.mashhad    43000          65000
isfahan.shiraz     63000          30000
tabriz.mashhad     25000          100000
tabriz.shiraz      28000          100000
mashhad.shiraz     66000          80000
;

table F(h,m) fixed cost for hub
         airplane       train
tehran   100000         50000
isfahan  130000         100000
tabriz   90000          50000
mashhad  55000          50000
shiraz   80000          40000
;

table dist(n,np)
           tehran        isfahan        tabriz        mashhad        shiraz        rasht        qazvin        urmia        yazd        kerman        gorgan        sanandaj        boshehr        sari        kermanshah        karaj        semnan        ahvaz        hamedan        zanjan
tehran     0             437            612           905            911           324          147           753          624         982           385           486             1035           250         499               47           222           780          319            325
isfahan    437           0              889           1247           477           634          463           1030         311         669           816           684             599            682         566               435          565           513          513            602
tabriz     612           889            0             1517           1368          474          470           146          1143        1502          1000          445             1487           865         580               568          833           1150         597            295
mashhad    905           1247           1517          0              1352          1058         1048          1654         922         916           562           1366            1636           694         1379              950          683           1604         1199           1228
shiraz     911           477            1368          1352           0             1114         942           1509         441         569           1292          1127            287            1158        1026              933          1039          517          948            1079
rasht      324           634            474           1058           1114          0            175           612          914         1272          497           568             1230           362         580               280          545           954          400            200
qazvin     147           463            470           1048           942           175          0             610          735         1093          533           408             1060           399         420               103          368           793          239            181
urmia      753           1030           146           1654           1509          612          610           0            1282        1640          1138          406             1489           1004        541               709          947           1049         530            436
yazd       624           311            1143          922            441           914          735           1282         0           359           1003          938             718            869         888               645          751           807          768            854
kerman     982           669            1502          916            569           1272         1093          1640         359         0             1361          1296            852            1227        1246              1004         1109          1084         1123           1213
gorgan     385           816            1000          562            1292          497          533           1138         1003        1361          0             869             1411           131         882               432          336           1159         702            711
sanandaj   486           684            445           1366           1127          568          408           406          938         1296          869           0               1082           738         134               489          686           642          175            281
boshehr    1035          599            1487          1636           287           1230         1060          1489         718         852           1411          1082            0              1281        960               1031         1162          447          997            1198
sari       250           682            865           694            1158          362          399           1004         869         1227          131           738             1281           0           750               298          202           1025         568            576
kermanshah 499           566            580           1379           1026          580          420           541          888         1246          882           134             960            750         0                 502          699           518          188            416
karaj      47            435            568           950            933           280          103           709          645         1004          432           489             1031           298         502               0            264           787          319            281
semnan     222           565            833           683            1039          545          368           974          751         1109          336           686             1162           202         699               264          0             920          516            545
ahvaz      780           513            1150          1604           517           954          793           1049         807         1084          1159          642             447            1025        518               787          920           0            563            869
hamedan    319           513            597           1199           948           400          239           530          768         1123          702           175             997            568         188               319          516           563          0              309
zanjan     325           602            295           1228           1079          200          181           436          854         1213          711           281             1198           576         416               281          545           869          309            0
;

variable
TC
;

binary variables
X(o,d,h,hp,m)
y(h,m)
link(h,hp,m)
;

Equations obj, co1, co2, co3, co4, co5, coo1,coo2,coo3 ,coy1,coy2,coo3
;

obj         .. TC =e= sum((o,d,h,hp,m,k),flow(o,d,k)*X(o,d,h,hp,m)*(dist(o,h)*rcp+alfa(m)*dist(h,hp)*rc(m)+dist(hp,d)*rcp))+sum((h,m),F(h,m)*y(h,m)) + sum((h,hp,m),l(h,hp,m)*link(h,hp,m));
*co1          .. sum((h,m),y(h,m))=e=p;
*coy1 ..      sum((h,m),y(h,m)) =l= 4;
*coy2 ..      sum((h,m),y(h,m)) =g= 3;
co2(o,d)$(ord(o)<>ord(d))      .. sum((h,hp,m),X(o,d,h,hp,m))=e= 1;
co3(o,d,h,hp,m) $(ord(o)<>ord(d)) .. X(o,d,h,hp,m) =l= (y(h,m)+y(hp,m))/2;
*co3(o,d,h)$(ord(o)<>ord(d))    .. sum((hp,m), X(o,d,h,hp,m))=l=sum(m, y(h,m));
*coo4(o,d,hp)$(ord(o)<>ord(d))    .. sum((h,m), X(o,d,h,hp,m))=l= sum(m, y(hp,m));
co4(o,d,h,hp,m,n,np)$(ord(o)<>ord(d))   .. X(o,d,h,hp,m)*(dist(o,h)*rtp+beta(m)*dist(h,hp)*rt(m)+dist(hp,d)*rtp)=l= TW;
*co5(o,d,h,hp,k,m)$((ord(o)<>ord(d))and(ord(h)<>ord(hp))) ..  (flow(o,d,k)*X(o,d,h,hp,m)/CAP(m))*(dist(o,h) + dist(h,hp) + dist(hp,d))*PR(m) =l= GREEN;
*co5 balayi doroste vali paeni ham baresi she
*co5(o,d,h,hp,k,m)$((ord(o)<>ord(d))and(ord(h)<>ord(hp))) ..  (flow(o,d,k)/capacity *X(o,d,h,hp,m))*(dist(o,h) + dist(hp,d))*PRATE + (dist(h,hp)*flow(o,d,k)/CAP(m))*PR(m) =l= GREEN;
co5(o,d,h,hp,k,m)$((ord(o)<>ord(d))and(ord(h)<>ord(hp))) ..  ((flow(o,d,k)*w(k)/WMax) *X(o,d,h,hp,m))*(dist(o,h) + dist(hp,d))*PRATE + (dist(h,hp)*flow(o,d,k)*w(k)/WM(m))*PR(m) =l= GREEN;
**********************hlp untitled 34*******************
coo1(h,hp,m) ..  link(h,hp,m) =l= (y(h,m)+y(hp,m))/2;
coo2(o,d,h,hp,m) ..  X(o,d,h,hp,m) =l= link(h,hp,m);

***mahdodiat zarfiat hub
coo3(h,hp,m) .. sum((o,d,k),flow(o,d,k)*w(k)*X(o,d,h,hp,m)) =l= ((y(h,m)+y(hp,m))/2)*CAP(h);


option optca=0, optcr=0, MIP=cplex;
model HLP /obj, coo1, co2, co3, co4, co5, coo2,coo3/;
solve HLP using MIP min TC;
Display TC.l, y.l, X.l,   link.l;


