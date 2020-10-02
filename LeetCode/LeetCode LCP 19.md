#### 题意：

给定一个只包含'r'和'y'的字符串，问最少更改几个字符可将字符串变为"rrrrr....yyyy....rrrrr"的形式，每一部分至少包含一个字符

#### 思路：

**动态规划** : dp\[i][j]表示对于前i个字符，将他们修改成j模式需要的最少修改次数，j=0="rxx",j=1="ryx",j=2=”ryr"。因此可以得到转移方程   

​	1、dp\[i][2]=min(dp\[i-1][1]+(s[i]=='y'), dp\[i-1][2]+(s[i]=='y'))

​	2、dp\[i][1]=min(dp\[i-1][1]+(s[i]=='r'), dp\[i-1][0]+(s[i]=='r'));

​	3、dp\[i][0]=min(dp\[i-1][0]+(s[i]=='y'), dp\[i-1][0]+(s[i]=='y'));

**公式发现** : 首先用costr[i]表示前i个字符全部变为'r'所需要的最小次数，costy[i]表示变'y'。sumcost表示变为目标模式需要的操作次数，n表示总共字符数，设[i,j]为变'y'区间，则可列示得：

​										sumcost = costr[i-1] + costy[j] - costy[i-1] + costr[n] - costr[j] 

​														= costr[n] + (costr[i-1]-costy[i-1]) - (costr[j]-costy[j])

求sumcost最小，及求(costr[x]-costy[x])-(costr[y]-costy[y])的最小值，及求costpre[x]-costpre[y]（做了转换）的最小值，__问题就转化为求一数组中不包含头和尾的子串的最小和__，显然，在枚举y的时候维护一个最大前缀即可（当然，更菜的做法还有单调队列队列，这是在只分离了costr[i-1]-costy[i-1]和costy[j]+costr[n]-costr[j]的时候用的QAQ)

