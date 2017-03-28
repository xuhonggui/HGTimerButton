# HGTimerButton
封装NSTimer的UIButton
# How to Use
创建HGTimerButton对象，与创建UIButton对象类似:<br>
```
HGTimerButton *timerButton = [HGTimerButton buttonWithType:UIButtonTypeCustom];
[timerButton setTitle:@"获取验证码" forState:UIControlStateNormal];
timerButton.titleLabel.font = [UIFont systemFontOfSize:16];
[timerButton addTarget:self action:@selector(timerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
[self.view addSubview:timerButton];
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
