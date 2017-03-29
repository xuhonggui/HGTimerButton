# HGTimerButton
封装NSTimer的UIButton:<br>
<img src="https://github.com/xuhonggui/HGTimerButton/raw/master/Image/image1.png" width=35% heithg=35% />
<img src="https://github.com/xuhonggui/HGTimerButton/raw/master/Image/image2.png" width=35% heithg=35% />
# How to Use
创建HGTimerButton对象，与创建UIButton对象类似:<br>
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
