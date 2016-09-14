#
# Be sure to run `pod lib lint ISRefresh.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ISRefresh'
  s.version          = '0.0.1'
  s.summary          = 'Easy add UIRefreshControl to any view based UIScrollView.'

  s.description      = <<-DESC
Add pull-to-refresh to UIScrollView,UITableView,UICollectionView.
                       DESC

  s.homepage         = 'https://github.com/isaced/ISRefresh'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'isaced' => 'isaced@163.com' }
  s.source           = { :git => 'https://github.com/isaced/ISRefresh.git', :tag => s.version.to_s }

  s.ios.deployment_target = '7.0'

  s.source_files = 'ISRefresh/Classes/**/*'
end
