require 'gem2deb/rake/testtask'

Gem2Deb::Rake::TestTask.new do |t|
  t.libs = ['test']
  t.verbose = true
  t.test_files = FileList['test/**/*_test.rb'] - FileList[
    'test/printers_test.rb',
    'test/call_info_visitor_test.rb',
    'test/printer_graph_test.rb',
    'test/dynamic_method_test.rb',
    'test/yarv_test.rb',
    'test/unique_call_path_test.rb',
  ] - `grep -rl delta.*time test/*.rb`.split
end
