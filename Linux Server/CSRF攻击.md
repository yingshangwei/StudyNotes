### CSRF(Cross-site request frogery) ——跨站请求伪造攻击

**描述**：一种利用用户在某一个网站未失效的cookie进行的攻击。比如用户A刚在银行网站向B用户转过帐，那么他会有一个`url=http://www.bank.com/account=userA&password=pwd&amount=1000&to=userB`的访问，用户A在一定时间内可以继续访问该url，那么攻击者可以将to改成攻击者的账户，让A去访问该url，就能实现攻击者的攻击目的。

**措施（感觉都不靠谱）**：

​    1、检查HTTP协议头中的Referer字段，即检测该url是从哪个url链接过来，显然。。。Referer字段可以被修改。。

​	2、在url中添加token标签，或者在HTTP头中放入自定义属性token。显然。。。这两种都是很容易被截获的。。







**ref**：

​		 https://www.cnblogs.com/sanqiansi/p/10026534.html

​		 https://www.cnblogs.com/yinrw/p/11310751.html

​		 https://my.oschina.net/u/2308739/blog/724635

