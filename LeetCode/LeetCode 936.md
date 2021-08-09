### 题目大意

给你一个印章（字符串），给一个目标字符串，让你使用印章盖出目标串，重叠部分后盖的覆盖先盖的。 字符串大小都在1000以内。

### 思路 (KMP+Hash)

先设印章串为stamp，目标串为target，stamp.length <= target.length。

很容易想到，不论如何，最左边的地方一定可以先盖，且前缀必须匹配上。

那么我们先在最左边敲章，假设stamp[0~k]和target[0~k]匹配，此时会有两种情况：

1. k <   stamp.length 

   这种情况下，对于覆盖k+1为起始的区段的章，必须后于此章敲，更准确的说，应该是必须有章来覆盖掉此章的不匹配后缀，那么此时下个章的起始位置必然是1~k+1之间的某一个位置。

   若假设下个章可以敲在 p 处，那么必有stamp[0~(k-p)]和target[p~k]匹配，实际上，target[k+1]处也应该匹配上，我们的目的是为了覆盖掉以k+1起始的某段区间。

   这里能想到一个模型，就是多个前缀（这里的前缀是排除完全匹配的前缀）匹配相互衔接，这样就容易想到KMP算法，利用以匹配的前缀来O(1)时间找到下一个前缀匹配。

2. k == stamp.length

   由于印章后敲覆盖先敲的特性，对于k+1~x这一段，是可以先敲的，这样的话对于k+1~x这一段，我们只要判断其是否是stamp的子串即可，那什么样的子串最优呢？

   首选的肯定是最长匹配的后缀（是不是最长也无所谓，毕竟后面依旧是子串匹配），这样接下来的段依旧只要匹配子串即可（子串都无法匹配的话，那肯定是没法完成目标了）。

   若非后缀的子串匹配，同理也需要是最长的，因为之后段的匹配，我们将跳转到第一步。

   其实和第一步的找连续前缀衔接类似，第二步类似于在找连续后缀衔接，第二步的匹配在从左往右的敲章模拟中一定是最好用的，只有当找不到后缀匹配的时候才会用第一步去衔接。



### 代码

```c++
class Solution {
public:
    void getnext(vector<int>& next, string& b)
    {
        int j = 0, k = -1;
        next[0] = -1;
        int m = b.size();
        while (j < m)
        {
            if (k == -1 || b[j] == b[k])
            {
                j++;
                k++;
                next[j] = k;
            }
            else
                k = next[k];
        }
    }
    typedef long long LL;
    LL mod = 123456791;
    map<LL, int> f;
    LL qpow(LL a, LL n) {
        LL sum = 1;
        while (n) {
            if (n & 1) sum = sum * a % mod;
            a = a * a % mod;
            n >>= 1;
        }
        return sum;
    }
    int charjin = 29;
    void hash(string& stamp) {
        int n = stamp.size();
        vector<LL> pre(n + 1,0);
        LL jin = 1;
        for (int i = 0; i < n; i++) {
            pre[i + 1] = (pre[i] + jin * (stamp[i] - 'a'+1)) % mod;
            jin = jin * charjin % mod;
        }
        jin = 1;
        for (int l = 0; l < n; l++) {
            LL ni = qpow(jin, mod - 2);
            for (int len = 1; l + len <= n; len++) {
                int r = l + len;
                if (f[(pre[r] - pre[l]+mod)%mod * ni % mod] == n+1) continue;
                if (r == n) f[(pre[r] - pre[l]+mod)%mod * ni % mod] = n+1;
                else f[(pre[r] - pre[l]+mod)%mod * ni % mod] = r;
            }
            jin = jin * charjin % mod;
        }
    }
    vector<int> movesToStamp(string stamp, string target) {
        vector<int> next(stamp.size()+1);
        getnext(next, stamp);
        int n = target.size(), m = stamp.size();
        hash(stamp);
        list<int> ans;
        int i = 0;
        int k = 0;
        while (i < n) {
            bool ok = true;
            while (i < n && k != m) {
                ok = true;
                while (k < m && i < n && stamp[k] == target[i]) k++, i++, ok = false;
                if (ok && k) {
                    k = next[k];
                    continue;
                }
                if (ok) break;
                ans.push_back(i - k);
                if ((i >= n && k < m) || k<=0) {
                    ans.clear();
                    break;
                }
                if (k == m) break;
                k = next[k];
            }

            if (ok) i = n, ans.clear();
            while (i < n && k == m) {
                LL sum = 0;
                LL jin = 1;
                for (int j = i; j <= n; j++) {
                    if (j >= n) {
                        i = j;
                        ans.clear();
                        break;
                    }
                    sum = sum + jin * (target[j]-'a'+1) % mod;
                    sum %= mod;
                    if (f[sum] == m + 1) {
                        i = j + 1;
                        ans.push_front(i - k);
                        break;
                    }
                    else if (f[sum] == 0) {
                        k = f[(sum+mod- jin * (target[j]-'a'+1)%mod)%mod];
                        while (j - k < i) {
                            if (j - k >= 0) ans.push_front(j - k);
                            k = next[k];
                        }
                        i = j;
                        if(k!=0) ans.push_front(i - k);
                        break;
                    }
                    jin = jin * charjin % mod;
                }
                
            }
        }
        vector<int> temp;
        for (auto& e : ans) {
            temp.push_back(e);
        }
        return temp;
    }
};
```

