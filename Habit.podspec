Pod::Spec.new do |s|
  s.name             = "Habit"
  s.version          = "0.1.3"
  s.summary          = "An easy-to-use library to make repeated notifications simpler"
  s.description      = "An easy-to-use little library to make repeated notifications simpler"
  s.homepage         = "https://github.com/DroidsOnRoids/Habit"
  s.license          = 'MIT'
  s.author           = { "Piotr Sochalewski" => "piotr.sochalewski@droidsonroids.pl" }
  s.source           = { :git => "https://github.com/DroidsOnRoids/Habit.git", :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Habit/Classes/**/*'
  s.frameworks = 'UIKit', 'Foundation'
end
