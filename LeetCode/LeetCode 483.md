### 题意 

$$
对于n=q^0+q^1+q^2+...+q^m求最小的整数q使得存在整数m满足该等式，给出n，其中3<=n<=1e18，q>=2
$$

### 思路

$$
显然有n-1=q^1+q^2+...+q^m
$$

因此q必定是n-1的因子，此时，我们只要对n-1进行大数质数分解（使用Pollard_Rho算法），然后枚举所有因子加以判断即可。