### Copyright 2020 Pixar

###
###    Licensed under the Apache License, Version 2.0 (the "Apache License")
###    with the following modification; you may not use this file except in
###    compliance with the Apache License and the following modification to it:
###    Section 6. Trademarks. is deleted and replaced with:
###
###    6. Trademarks. This License does not grant permission to use the trade
###       names, trademarks, service marks, or product names of the Licensor
###       and its affiliates, except as required to comply with Section 4(c) of
###       the License and to reproduce the content of the NOTICE file.
###
###    You may obtain a copy of the Apache License at
###
###        http://www.apache.org/licenses/LICENSE-2.0
###
###    Unless required by applicable law or agreed to in writing, software
###    distributed under the Apache License with the above modification is
###    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
###    KIND, either express or implied. See the Apache License for the specific
###    language governing permissions and limitations under the Apache License.
###

proj_name = 'ruby-jss'
lib_dir = 'jss'

require "./lib/#{lib_dir}/version"

Gem::Specification.new do |s|
  # General
  s.description = <<-EOD
    The ruby-jss gem provides the JSS module, a framework for interacting with the REST API
    of the Jamf Software Server (JSS), the core of Jamf Pro, an enterprise/education
    tool for managing Apple devices, from Jamf Software LLC.
    JSS API objects are implemented as Ruby classes, and interact with each oher to
    allow simpler automation of Jamf-related tasks. For details see the README file."
  EOD
  s.name        = proj_name
  s.version     = JSS::VERSION
  s.license     = 'Nonstandard'
  s.date        = Time.now.utc.strftime('%Y-%m-%d')
  s.summary     = 'A Ruby interface to the Jamf Pro REST API'
  s.authors     = ['Chris Lasell', 'Aurica Hayes']
  s.email       = 'ruby-jss@pixar.com'
  s.homepage    = 'http://pixaranimationstudios.github.io/ruby-jss/'

  s.files = Dir['lib/**/*.rb']
  s.files << '.yardopts'
  s.files += Dir['data/**/*']
  s.files += Dir['test/**/*']

  s.executables << 'cgrouper'
  s.executables << 'netseg-update'
  s.executables << 'jamfHelperBackgrounder'

  # Dependencies
  s.required_ruby_version = '>= 2.0.0'

  # http://plist.rubyforge.org/  MIT License (no dependencies)
  s.add_runtime_dependency 'plist', '~> 3.1'
  # https://github.com/tmtm/ruby-mysql Ruby License (no dependencies)
  s.add_runtime_dependency 'ruby-mysql', '~> 2.9', '>= 2.9.12'
  # https://github.com/rest-client/rest-client & dependencies: MIT License
  s.add_runtime_dependency 'rest-client', '>= 2.0.0', '< 2.1'
  # https://github.com/ruby-ldap/ruby-net-ldap MIT License (no dependencies)
  s.add_runtime_dependency 'net-ldap', '~> 0.16'
  # https://github.com/stitchfix/immutable-struct MIT License (no dependencies)
  s.add_runtime_dependency 'immutable-struct', '~> 2.3', '>= 2.3.0'
  # https://github.com/aetherknight/recursive-open-struct MIT License (no dependencies)
  s.add_runtime_dependency 'recursive-open-struct', '~> 1.1', '>= 1.1.0'

  # Rdoc
  s.extra_rdoc_files = ['README.md', 'LICENSE.txt', 'CHANGES.md', 'THANKS.md']
  s.rdoc_options << '--title' << 'JSS' << '--line-numbers' << '--main' << 'README.md'
end
