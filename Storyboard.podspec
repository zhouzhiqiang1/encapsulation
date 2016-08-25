Pod::Spec.new do |s|

  s.name         = "encapsulation"

  s.version      = "0.0.1"

  s.summary      = "Cloud message conversation list ！"

  s.homepage     = "https://guides.cocoapods.org/making/private-cocoapods.html"

  s.ios.deployment_target = '8.0'

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "zhouzhiqiang1" => "zhou83955@sina.com" }

  s.source       = { :git => "https://github.com/zhouzhiqiang1/encapsulation.git", :tag => s.version }

  s.source_files  = "StoryboardEncapsulation/**/*.{h,m}"
  
  s.requires_arc = true
end
