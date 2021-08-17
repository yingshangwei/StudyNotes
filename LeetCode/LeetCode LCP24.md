### 题目大意

​		给出一个长度为n(1<=n<=1e5)的数组，一次操作可以对任意数组中的数削减1或增加1，问ans[i]，ans[i]表示对于0~i这个子数组，需要操作最少ans[i]次可以使得0~i这个子数组满足ans[k]+1=ans[k+1]。

### 思路

​		其中ans[i]这个子问题可以转化为求一个b，使得点集{(k,num[k]), 0<=k<=i}到直线y=x+b的竖直距离和最小，显然，可以发现，想让这个竖直距离和最小，那么在y=x+b两边的点数差一定不大于在线上的点数，因为此时不论直线向上或是向下移动，距离和一定单调递增。

​		那么我们只要用两个优先队列分别维护直线两边的点，再用一个count计数在线上的点，枚举i，调整b的大小并且调整两个优先队列和count的值就能保证此时的选取的y=x+b最优。

​		要计算答案还需要维护一些其他值。由于两个优先队列的点分别在直线两边，因此只要分别维护(Yk-k)的和就能很容易计算出ans[i]。

### 代码

```c++
struct Node {
    int val;
    int cnt;
    Node(int v = 0, int c = 1) : val(v), cnt(c) {}
};
struct cmp0 {
    bool operator() (Node& a, Node& b) {
        return a.val < b.val;
    }
};
struct cmp1 {
    bool operator() (Node& a, Node& b) {
        return a.val > b.val;
    }
};

typedef long long LL;
class Solution {
public:
    int mod = 1e9 + 7;
    vector<int> numsGame(vector<int>& nums) {
        int n = nums.size();
        vector<int> ans(n);
        priority_queue<Node,vector<Node>,cmp0> down;
        priority_queue<Node, vector<Node>,cmp1> up;
        LL sumd = 0, sumu = 0;
        LL offset = 0;
        LL cnt = 0;
        LL cntd = 0, cntu = 0;

        ans[0] = 0;
        cnt = 1;
        offset = nums[0];

        for (int i = 1; i < n; i++) {
            if (i + offset == nums[i]) {
                cnt++;
            }
            else if (i + offset > nums[i]) {
                up.push(i - nums[i]);
                cntu++;
                sumu += i - nums[i];
            }
            else {
                down.push(i - nums[i]);
                cntd++;
                sumd += i - nums[i];
            }
            while (cntd + cnt < cntu) {
                down.push(Node(-offset, cnt));
                cntd += cnt;
                sumd += 1ll * -offset * cnt;
                offset = -up.top().val;
                cnt = 0;
                while (!up.empty()&&up.top().val + offset == 0) {
                    cnt += up.top().cnt;
                    cntu -= up.top().cnt;
                    sumu -= 1ll * up.top().val * up.top().cnt;
                    up.pop();
                }
            }
            while (cntu + cnt < cntd) {
                up.push(Node(-offset, cnt));
                cntu += cnt;
                sumu += 1ll * -offset * cnt;
                offset = -down.top().val;
                cnt = 0;
                while (!down.empty()&&down.top().val + offset == 0) {
                    cnt += down.top().cnt;
                    cntd -= down.top().cnt;
                    sumd -= 1ll * down.top().val * down.top().cnt;
                    down.pop();
                }
            }
            ans[i] = (-(sumd + offset * cntd) + (sumu + offset * cntu))%mod;
        }
        return ans;
    }
```

