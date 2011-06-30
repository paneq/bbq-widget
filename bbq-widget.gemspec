# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bbq-widget/version"

Gem::Specification.new do |s|
  s.name        = "bbq-widget"
  s.version     = Bbq::Widget::VERSION
  s.authors     = ["Robert Pankowecki"]
  s.email       = ["robert.pankowecki@gmail.com", "rpa@gavdi.com"]
  s.homepage    = "https://github.com/paneq/bbq-widget"
  s.summary     = %q{Easily scope user interactions with site using bbq widgets}
  s.description = %q{Easily scope user interactions with site using bbq widgets}

  s.rubyforge_project = "bbq-widget"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "bbq", "~> 0.0.2.beta.1"

  s.add_development_dependency "sqlite3", "~> 1.3.3"
end
