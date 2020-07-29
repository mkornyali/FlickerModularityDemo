# Uncomment the next line to define a global platform for your project
 platform :ios, '12.0'
workspace 'ModularityFlickerDemo'
def network_pods 
  pod 'Moya'
end

def image_pods 
  pod 'Kingfisher', '~> 5.0'
end
target 'ModularityFlickerDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  # use_frameworks!
network_pods
image_pods
  # Pods for ModularityFlickerDemo

  target 'ModularityFlickerDemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ModularityFlickerDemoUITests' do
    # Pods for testing
  end

end

target 'SearchName' do
  project 'SearchName/SearchName.project'
  network_pods
end

target 'BaseModule' do
  project 'BaseModule/BaseModule.project'
  network_pods
end

target 'PhotosModule' do
  project 'PhotosModule/PhotosModule.project'
  network_pods
end
