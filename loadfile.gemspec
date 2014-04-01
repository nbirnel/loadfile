require  "#{File.dirname(__FILE__)}/lib/loadfile/version"

Gem::Specification.new do |s|
  s.name        = 'loadfile'
  s.version     = Loadfile::VERSION
  s.date        = '2014-03-28'
  s.required_ruby_version = '>=1.8.7'
  s.summary     = "manipulate electronic evidence discovery loadfiles"
  s.description = "A ruby gem to manipulate
    .opt and .log files for Concordance® / Opticon®,
    .lfp files for Ipro eCap,
    and .dii files for Summation®.
    This software is not made or endorsed by Ipro®, Lexis-Nexis® or Dataflight®."
  s.authors     = ['Noah Birnel']
  s.email       = 'nbirnel@gmail.com'
  s.homepage    = 'http://github.com/nbirnel/loadfile'
  s.files       = [
    'README.md',
    'loadfile.gemspec',
    'lib/loadfile.rb',
    'lib/loadfile/version.rb',
    'lib/opticon/opticon.rb',
    'lib/opticon/opt_parser.rb',
    'spec/loadfile_spec.rb'
  ]
  s.has_rdoc    = true
  s.license     = 'MIT'
end

