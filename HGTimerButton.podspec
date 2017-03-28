Pod::Spec.new do |s|
  s.name         = "HGTimerButton"
  s.version      = "1.0.0"
  s.summary      = "a custom UIButton that contains NSTimer"
  s.homepage     = "https://github.com/xuhonggui/HGTimerButton"
  s.license      = "MIT"
  s.author       = { "xuhonggui" => "593692553@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/xuhonggui/HGTimerButton.git", :tag => s.version }
  s.source_files  = "*.{h,m}"
  s.requires_arc = true
  s.subspec 'HWWeakTimer' do |w|
     w.dependency "HWWeakTimer"
     w.source_files = "*.{h,m}"
  end
end
