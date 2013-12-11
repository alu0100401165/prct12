require "bundler/gem_tasks"

$:.unshift File.dirname(__FILE__) + 'lib'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :default => :spec

desc "Pruebas unitarias de la clase Matriz"
task :spec do
        sh "rspec -I. spec/matriz_spec.rb"
end

desc "Ejecutar con documentacion"
task :doc do
        sh "rspec -I. spec/matriz_spec.rb --format documentation"
end

desc "Run matriz.rb"
task :bin do
  sh "ruby lib/MathsMatrixUllEtsiiLppM08/matriz_dispersa.rb"
end

desc "Ejecucion pruebas unitarias"
task :test do
 sh "ruby -I./lib test/tc_matrices.rb"
end

desc "Run clase matriz en versión DSL.rb"
task :dsl do
  sh "ruby lib/MathsMatrixUllEtsiiLppM08/matricesDSL.rb"
end