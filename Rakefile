task :default => :user

desc "Lanzar la aplicacion con el usuario y el numero limite pasados"
task :user, :name, :num do |t, args|
  name = args[:name] || 'timoreilly'
  num = args[:num] || '10'
  puts name
  puts num
  sh "ruby popular.rb #{name} #{num}"
end