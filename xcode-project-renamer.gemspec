# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "xcode-project-renamer/version"

Gem::Specification.new do |s|
  s.name        = "xcode-project-renamer"
  s.version     = Xcode::Project::Renamer::VERSION
  s.authors     = ["Thomas Fankhauser"]
  s.email       = ["tommylefunk@googlemail.com"]
  s.homepage    = ""
  s.summary     = %q{Deep rename your whole XCode project with a single command}
  s.description = %q{Project renaming is a pain with XCode. Use this gem to rename any XCode project in a very simple way}

  s.rubyforge_project = "xcode-project-renamer"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
