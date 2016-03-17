Pod::Spec.new do |s|

  s.name         = "Google-Maps-iOS-Utils-QuadTree"
  s.version      = "0.1"
  s.summary      = "A QuadTree library for use with Google Maps iOS SDK."
  s.description  = <<-DESC
                   This library enables you to store geographic points in a QuadTree.
                   DESC
  s.homepage     = "https://github.com/googlemaps/google-maps-ios-utils"
  s.license      = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author       = { "Brett Morgan" => "brettmorgan@google.com" }
  s.platform     = :ios, '5.0'
  s.source       = { :git => "https://github.com/thedazed/google-maps-ios-utils.git",
		     :tag => "0.1" }
  s.source_files = '{QuadTree,Clustering,Projection}/**/*.{h,m}'
  s.requires_arc = true
  s.dependency 'GoogleMaps', '~> 1.12.2'
  
  s.pod_target_xcconfig = {
    # issue: @orta: In simple, if a library is not dynamic and you're trying to use it with frameworks you can use it, but you cannot use it as a dependency of something else via CocoaPods.
    # https://github.com/CocoaPods/CocoaPods/issues/3194
    # https://github.com/CocoaPods/CocoaPods/issues/2926
    # https://github.com/CocoaPods/CocoaPods/issues/3289
    # workaround: https://github.com/CocoaPods/CocoaPods/issues/3841#issuecomment-123803940
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/GoogleMaps/Frameworks"',
    'OTHER_LDFLAGS'          => '$(inherited) -undefined dynamic_lookup',

    # issues: ld: -undefined and -bitcode_bundle (Xcode setting ENABLE_BITCODE=YES) cannot be used together
    # we need -undefined for the above workaround, so therefore disabling Bitcode for our component
    'ENABLE_BITCODE'         => 'NO'
  }
  
end
