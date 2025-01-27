Pod::Spec.new do |s|
    s.name             = 'SwiftUIShowcase'
    s.version          = '0.1.0'
    s.summary          = 'A SwiftUI implementation of MaterialShowcase'
    s.description      = <<-DESC
                        SwiftUIShowcase is a SwiftUI library that helps you highlight 
                        specific views in your app for feature discovery and onboarding.
                        DESC
    s.homepage         = 'https://github.com/bahadirarslan/SwiftUIShowcase'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'bahadiraslan' => 'bahadirarslan@gmail.com' }
    s.source           = { :git => 'https://github.com/bahadirarslan/SwiftUIShowcase.git', 
                          :tag => s.version.to_s }
    
    s.ios.deployment_target = '14.0'
    s.macos.deployment_target = '12.0'
    s.swift_version = '5.7'
    
    s.source_files = 'Sources/SwiftUIShowcase/**/*'
  end