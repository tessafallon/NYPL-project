task :run_ocrs, [:path] => [:environment] do |t, args|
  Image.run_ocrs(args[:path])
end

desc "run all those methods"
task :do_everything, [:path] => [:environment, :run_ocrs]