# HGTimerButton
封装NSTimer的UIButton，依赖HWWeakTimer库，避免NSTimer强引用导致的内存泄漏，支持纯代码及xib:<br>
<img src="https://github.com/xuhonggui/HGTimerButton/raw/master/Image/image1.png" width=35% heithg=35% />
<img src="https://github.com/xuhonggui/HGTimerButton/raw/master/Image/image2.png" width=35% heithg=35% />
# How to Use
## 使用CocoaPods<br>
```
pod 'HGTimerButton'
```
## 手动导入<br>
将`HGTimerButton`、`HWWeakTimer`文件夹中所有源代码拽入项目中，导入头文件`import "HGTimerButton.h"`<br>
## 示例:<br>
```
HGTimerButton *timerButton = [HGTimerButton buttonWithType:UIButtonTypeCustom];
timerButton.frame = CGRectMake(40, CGRectGetHeight(self.view.frame)/2 - 50, CGRectGetWidth(self.view.frame) - 80, 40);
[timerButton setTitle:@"获取验证码" forState:UIControlStateNormal];
[timerButton setBackgroundColor:[UIColor colorWithRed:0/255.0 green:174.0/255.0 blue:235.0/255.0 alpha:1.0]];
[timerButton addTarget:self action:@selector(timerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
[self.view addSubview:timerButton];
```
设置开始时间:<br>
```
timerButton.startCount = 30;
```
设置倒计时提示:<br>
```
timerButton.disabledTitleFormat = @"重新获取(&s)";
```
调用`start`方法开始:<br>
```
[timerButton start];
```
# License
MIT
