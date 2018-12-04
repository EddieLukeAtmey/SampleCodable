# platform :ios, '11.0'
platform :osx, '10.10'

workspace 'SampleCodable'

# Thanks for pods + CLI https://github.com/CocoaPods/CocoaPods/issues/3707
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
        # config.build_settings['MACH_O_TYPE'] = 'staticlib'
        config.build_settings['DYLIB_INSTALL_NAME_BASE'] = target.product_name
        config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
    end
  end
end

def sharedPods
    use_frameworks!

    # Pods for Coinage
    pod 'CodableAlamofire'
end

target 'SampleCodable' do
    sharedPods
    pod 'SwiftyJSON'
#  pod 'SwiftDate', '~> 5.0'
end

target 'SampleRequest' do
	project 'SampleRequest/SampleRequest'

    sharedPods
end
