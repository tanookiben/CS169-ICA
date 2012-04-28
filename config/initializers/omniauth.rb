require 'omniauth-openid'
require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, 'fSH2DY0oC4EiLqBCeQIhYw', 'HMTlb1gHDeoTTOxgYnTT7zag33TkaGmf9ScDbr8'  
  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'openid'
  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end