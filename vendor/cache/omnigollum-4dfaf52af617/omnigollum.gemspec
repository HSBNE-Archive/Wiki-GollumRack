# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "omnigollum"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Arran Cudbard-Bell", "Tenshi Hinanawi"]
  s.date = "2013-04-09"
  s.description = "Omnigollum adds support for OmniAuth in Gollum. It executes an OmniAuth::Builder proc/block to figure out which providers you've configured, then passes it on to omniauth to create the actual omniauth configuration.\n\nSee https://github.com/arr2036/omnigollum for usage instructions.\n"
  s.email = "cockmomgler@gmail.com"
  s.extra_rdoc_files = ["Readme.md", "LICENSE"]
  s.files = ["Readme.md", "LICENSE", "lib/omnigollum.rb", "public/images", "public/images/bitly_logo.png", "public/images/blogger_logo.png", "public/images/facebook_logo.png", "public/images/github_logo.png", "public/images/google_logo.png", "public/images/omniauth_logo.png", "public/images/open_id_logo.png", "public/images/twitter_logo.png", "public/images/youtube_logo.png", "templates/Login.mustache", "views/login.rb"]
  s.homepage = "https://github.com/arr2036/omnigollum"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Omnigollum makes it easy to use OmniAuth with Gollum"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gollum>, [">= 0"])
      s.add_runtime_dependency(%q<omniauth>, [">= 0"])
      s.add_runtime_dependency(%q<mustache>, [">= 0"])
    else
      s.add_dependency(%q<gollum>, [">= 0"])
      s.add_dependency(%q<omniauth>, [">= 0"])
      s.add_dependency(%q<mustache>, [">= 0"])
    end
  else
    s.add_dependency(%q<gollum>, [">= 0"])
    s.add_dependency(%q<omniauth>, [">= 0"])
    s.add_dependency(%q<mustache>, [">= 0"])
  end
end
