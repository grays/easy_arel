# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "easy_arel/version"

Gem::Specification.new do |s|
  s.name        = "easy_arel"
  s.version     = EasyArel::VERSION
  s.authors     = ["Jason L Perry"]
  s.email       = ["jasper@ambethia.com"]
  s.homepage    = "https://github.com/ambethia/easy_arel"
  s.summary     = %q{Shorthand for `arel_table`}
  s.description = %q{Shorthand references to `arel_table` in ActiveRecord for lazy people, like me.}

  s.rubyforge_project = "easy_arel"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'activerecord', '~> 3'
  s.add_development_dependency 'sqlite3-ruby'
end
