DirectX12按照 msdn所说不支持C#语言。

- 目前了解到原项目使用SlimDX作为在C#工程中的DirectX API的C#版本wrapper
  - 优势：有官方文档，且学习资源较多
  - 劣势：查看了wiki发现已经有些时间没有更新了，不支持最新版本的DirectX12；
- 另外一个C# DirectX wrapper是SharpDX
  - 优势：这个库优势就是支持较新的DirectX12（DirectX12 ultimate 不支持）
  - 劣势：相对于SlimDX的劣势就是缺少文档



目前比较值得参考的github demo : 

- ashttps://github.com/RobyDX/SharpDX_D3D12HelloWorld