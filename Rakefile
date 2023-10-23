require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "src/services"  # テストで必要なパスを追加
  t.test_files = FileList['src/services/**/*_test.rb']  # テストファイルのパターン
  t.verbose = true  # テストの詳細な出力を表示する
end

task default: :test  # デフォルトタスクをテストタスクに設定
