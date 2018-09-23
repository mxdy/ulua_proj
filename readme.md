<p align="center">
    <a href="https://www.lua.org/">
	    <img src="http://www.runoob.com/manual/lua53doc/logo.gif" width="110" height="100" target="_blank">
	</a>
	<a href="https://unity3d.com/cn/">
	    <img src="https://huailiang.github.io/img/unity.jpeg" width="200" height="100" target="_blank">
	</a>
    	<a href="https://huailiang.github.io/">
    	<img src="https://huailiang.github.io/img/avatar-Alex.jpg" width="120" height="100" target="_blank">
   	</a>
</p>

此项目旨在提供一套通用的方式生成lua的库，工程使用的unity版本是2018.2.7


## 项目目录结构：
```
1.  Assets/  Unity的资源目录
2.  build/  提供luajit lua53等lua原码库，当然你可以去官网下载 以及不同平台的编译脚本
3.  cpp_proj/  c++工程，用来直接在c++环境里调试lua代码特性 
4.  Shell/ 用来lua原码编译对应到的bytecode，为了加密和优化
5.  doc/   说明文档及教程
```


## git工程一共有个分支：
```
1. master 使用的是lua5.3  lua53好处是最新的版本提供了对64int( long long)等新特性的支持，坏处是效率没有jit高
2. jit    使用的是lua5.1 对应的是luajit, 对应lua版本是lua5.1 好处是jit的运行效率高 坏处是jit作者早就不维护了
```


作者在windows上编译win x64 lua dll, 在mac上编译Android(.so)，osx(.bundle), ios(.a)平台的库

windows 上编译需要安装cmake, vs2013(当然也可以是其他版本，只不过作者在build/make_win64_luajit.bat make_win64_luajit.bat脚本使用的是vs2013, 读者可以根据自己本地环境修改里面定义的变量)


关于快速上手及配置教程，参考[lua上手教程](/doc/tutor.md)

## 特性：


1. master使用lua53作为native-lib 天然对int64支持，使用参考项目里这个ulua/Examples/10_Int64 例子


2. luac 支持对bytecode模式的支持,参考[lua生成bytecode](/doc/bytecode.md?_blank)


3. cs2lua 通过wrap文件直接将方法地址和参数列表暴露给lua 让lua高效访问
	
	编辑器里运行Lua-> Clear Wrap Files 清除wrap文件

	运行Lua->Gen Lua Wrap Files 重新生成wrap文件

4. profile 查看lua调用堆栈,lua函数执行时间
	
	编辑器里运行 Lua->Attach Lua Profiler, 运行结果

	![](/doc/img/profile.jpg)

5. 支持IL 层代码注入

	通过新的功能模块中的类名或者方法名加上[Hotfix]标签 而如果忽略某个函数可以使用[HotfixIgnore]，对线上问题快速修复，具体参考[IL注入实现热修](/doc/IL.md)

6. 支持protobuf3
	
	目前主流的lua插件 比如ulua、tolua、slua都是支持protobuf2  c#测如果使用protobuf2 反序列化都是使用反射，产生大量的gc，升级protobuf3还是很有必要的.

	项目使用protobuf3 的例子是ulua/Examples/14_ProtoBuffer， 当然详细的使用文档和注意事项，请点击[这里](/doc/pb.md)查看
	

## 升级变更

关于lua51升级后的更变 请参考[lua51升级变更](/doc/luachanges.md)

关于lua51升级后，c#相应的改动参考这里[这里](/doc/ulua53.md)



## QA:

#### 1. 为什么自己编译lua库？


自己编译lua库，可以为相当于为游戏定制需求。
1，可以移除不必要的库，减少代码量 
2，有些公用的库，比如说cjson 可以同时在lua和GameCore中使用
3，如int64等问题可以根据项目需要决定取舍


#### 2. lua原码加密


一般我们不使用自定义的加密算法去加密lua原码， 而是将lua编译成中间件（bytecode），关于如何生成bytecode, 请参考[lua生成bytecode](/doc/bytecode.md?_blank)

