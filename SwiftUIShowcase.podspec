Pod::Spec.new do |s|
    s.name             = 'SwiftUIShowcase'
    s.version          = '0.1.0'
    s.summary          = 'SwiftUI için özellik tanıtım (showcase) kütüphanesi'
    s.description      = <<-DESC
                        SwiftUI uygulamalarında yeni özellikleri kullanıcılara tanıtmak için kullanılan bir kütüphane.
                        DESC
    s.homepage         = 'https://github.com/KULLANICI_ADI/SwiftUIShowcase'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'ADINIZ' => 'EMAIL@ADRESINIZ.com' }
    s.source           = { :git => 'https://github.com/KULLANICI_ADI/SwiftUIShowcase.git', 
                          :tag => s.version.to_s }
    
    s.ios.deployment_target = '14.0'
    s.macos.deployment_target = '12.0'
    s.swift_version = '5.7'
    
    s.source_files = 'Sources/SwiftUIShowcase/**/*'
  end