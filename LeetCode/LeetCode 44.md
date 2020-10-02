#### 题意：

给定两个字符串，s为目标字符串，p为模式字符串，其中，'?'表示可以任意匹配一个字符，'*'表示可以匹配任意字符串（包括空串）。问p是否可以匹配为s。

#### 思路：

**递推方式**：设 match<sub>i</sub> 为模式p中前i个字符可以匹配到s中的位置，即p[0~i]=s[match<sub>i</sub>[j]], 0<j<match<sub>i</sub>.size()。则对于match<sub>i+1</sub>有
$$
\begin{eqnarray*}
p[i+1]=='*'&->&match_{i+1}=\{x|x\in[min\{match_{i}[j]|j\in[0,match_i.size())\},s.size())\}
\\
p[i+1]=='?'&->&match_{i+1}=\{match_{i}[j]+1|match_{i}[j]+1<s.size(),j\in[0,match_i.size())\}
\\
others &->&match_{i+1}=\{match_{i}[j]+1|match_{i}[j]+1<s.size(),s[match_i[j]+1]==p[i+1],j\in[0,match_i.size())\} 
\end{eqnarray*}
$$


即可由match<sub>i</sub>推出match<sub>i+1</sub>，每次状态转移O(match<sub>i</sub>.size())，总共枚举p.length次，因此复杂度为O(nm)，空间复杂度O(n)。

​    **优化** ：显然这里可以有一些剪枝，比如合并 * 号，合并 ? 和 * 号；预处理对于p[i]后面的字符串，最少需要多少个字符匹配；对于每一个字符，维护下一个同字符的位置；递推遇到 * 号时，不遍历更新match<sub>i+1</sub>，而是使用left和flag；同理，遇到 ? 号时，使用offset，即match<sub>i+1</sub>[j]=match<sub>i</sub>+offset。（暂时想到这么多）

**改模式法**：对于p，可将其模式化为  \*u1\*u2\*u3*  这样的形式，因此只要在s中贪心的寻找u1 u2 u3即可，? 号合并入u1 u2 u3 中。

**动态规划**：当然，既然递推可以，那么动态规划一般也是没有问题的，记dp\[i]\[j]为s[0~i]和p[0~j]的匹配情况即可。  （和递推其实意思一样