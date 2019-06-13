Gem::Specification.new do |s|
  s.name        = 'merpati'
  s.version     = '0.0.1'
  s.date        = '2019-03-17'
  s.summary     = 'Merpati is a simple utility module to manage twitter data'
  s.description = %q{
    Merpati is a simple utility module to manage twitter data
  }
  s.add_dependency('twitter', '>= 6.2.0')
  s.add_dependency('http')
  s.add_dependency('dotenv')
  s.add_dependency('activesupport')
  s.authors     = 'xyzkab'
  s.email       = '0xyzkab@gmail.com'
  s.files       = Dir['{lib}/**/*', '*.md'] & `git ls-files -z`.split("\0")
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f)}
  s.homepage    = 'https://github.com/xyzkab/merpati'
  s.license     = 'Nonstandard'
end
