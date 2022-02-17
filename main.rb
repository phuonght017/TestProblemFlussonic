require_relative 'license'
require_relative 'flussonic_last_version'

first_lic = License.new('04.07.2021', nil, nil, '21.10')
p first_lic.list_available_versions # -> ["21.07", "21.06"]

second_lic = License.new('04.07.2020', '20.02', '19.01', '20.10')
p second_lic.list_available_versions # -> ["20.02"]

third_lic = License.new('04.03.2019', '20.02', '19.06', '20.10')
p third_lic.list_available_versions # -> []

flussonic_last_version = FlussonicLastVersion.new.get
test_lic = License.new('04.07.2021', '20.02', '19.01', flussonic_last_version)
p flussonic_last_version
p test_lic.list_available_versions
