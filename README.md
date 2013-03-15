

# no320.ios.log

该项目代码是基于CocoaLumberjack这个ios 日志框架的扩展。

## 特性



## 用法说明



### 初始化

 
- 把依赖文件加到项目文件中

把no320.ios.log/文件夹加到项目文件中

注意CocoaLumberjack默认是arc的，如果你的项目是非arc的，需要增加-fobjc-arc说明

参见https://github.com/robbiehanson/CocoaLumberjack/wiki/GettingStarted


![示例](pic_1.png)



### 修改AppDelegate.m文件


- 引入资源文件

```c
	#import "No320LogFileManager.h"
```

- 增加[self setNo320LogConfig];方法

```c
	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
	{
      
	    ....
		[self setNo320LogConfig];
	    ....
	    return YES;
	}
```


## History

v0.1.0

## Contributors

alfred.sang


## License

If you are using ios-test-unit in your project, I'd love to hear about it.  Let me 
know at shiren1118@126.com.

In short, this is the MIT License.

Copyright (c) 2013 no320.com Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
