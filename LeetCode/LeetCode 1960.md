### 题目大意

给定一个字符串，在其中找到两个不相交的长度为奇数的子串，使得它们的长度乘积最大，字符串长度1e5以内

### 思路

首先容易想到，若是我们对于每一个i，可以知道s[0~i]和s[i+1~s.length-1]中最长的长度为奇数的回文串的长度，那么我们只要枚举i即可，也就是说，我们需要在从遍历过程中，递推的知道最长的回文串的长度。

如果知道马拉车算法的话，很显然我们只要在马拉车的过程中维护一个最长回文串长度，从左到右和从右到左分别来一遍就行；

如果不知道的话，就需要从递推这个角度出发，结合回文串的特性去发现一下递推回文串这一算法了。

马拉车的本质就是利用回文串两边对称的特性，若r[i]表示以i为回文串中心的最大半径，那么r[i+1]可以利用上r[i-1]的信息去消除大部分枚举。

### 代码

```c++
class Solution {
public:
    inline void malache(string& s, vector<int>& v) {
        int n = s.size();
        vector<int> r(3,1);
        int mid = 1;
        v[0] = v[1] = 1;
        int maxv = 1;
        for (int i = 2,l; i < n;) {
            if (2 * (n - mid) - 1 < maxv) break;
            l = 2 * mid - i;
            if (r[1] + mid < i || l < 0 || s[i] != s[l]) {
                mid++;
                r[2] = r[0];
                r[0] = r[1];
                r[1] = i==mid?0:min(r[2], i - mid);
            }
            else {
                r[1]++;
                maxv = max(maxv, r[1] * 2 - 1);
                v[i] = maxv;
                i++;
            }
        }
    }
    long long maxProduct(string s) {
        int n = s.size();
        vector<int> M(n), RM(n);
        malache(s, M);
        reverse(s.begin(), s.end());
        malache(s, RM);
        long long ans = 1;
        for (int i = 0; i < n-1; i++) {
            ans = max(ans,1ll * M[i] * RM[n-i-2]);
        }
        return ans;
    }
};
```

