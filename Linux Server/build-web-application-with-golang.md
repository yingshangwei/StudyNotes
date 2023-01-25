### 6 session和数据存储

------

##### 6.4 预防session劫持

问题由来：包含session信息的cookies泄漏导致

猜测解决手段：cookies



cookieonely和token方式：加个隐藏token是多隐藏？不太理解这边隐藏的意思

间隔生成新的SID：这个不像上一种0或者1的解决方式，这个方式更像是在拉滑动条，降低session被有效劫持的概率，也就是只要劫持尝试次数够多，就能劫持成功。

组合拳：如果第一种方式能够增加攻击者每次试图劫持时获取token和session信息的时间，那只要调整第二次间隔生成新的SID的时间，就可以基本上消除掉被劫持的可能性。





### 7 文本处理

------

##### 7.1 XML处理

Go里面处理XML需要先定义好struct描述结构？

学习一下struct tag，这里都是围绕struct tag进行xml得解析。

