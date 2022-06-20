require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "RNNativePortals"
  s.version      = package['version']
  s.summary      = package['description']
  s.description  = package['description']
  s.license      = package['license']
  s.author       = package['author']
  s.homepage     = package['repository']
  s.platforms    = { :ios => "10.0" }
  s.source       = { :git => "#{package['repository']}.git", :tag => "#{s.version}" }
  s.source_files  = "ios/**/*.{h,m,mm,swift}"
  s.requires_arc = true


  s.dependency "React-Core"

end

  