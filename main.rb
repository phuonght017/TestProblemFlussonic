require_relative 'license'
require_relative 'flussonic_last_version'

flussonic_last_version = FlussonicLastVersion.new.get
puts 'First test:'
first_lic = License.new('04.07.2021', nil, nil, '21.10')
p first_lic.list_available_versions
puts 'Second test:'
second_lic = License.new('04.07.2020', '20.02', '19.01', '20.10')
p second_lic.list_available_versions
puts 'Third test:'
third_lic = License.new('04.03.2019', '20.02', '19.06', '20.10')
p third_lic.list_available_versions