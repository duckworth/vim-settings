#!/usr/bin/env ruby

git_bundles = [ 
  #"https://github.com/astashov/vim-ruby-debugger.git",
  "https://github.com/msanders/snipmate.vim.git",
  #"https://github.com/scrooloose/nerdtree.git",
  #use wycats modified janus nerdtree
  "https://github.com/wycats/nerdtree.git",  
  "https://github.com/timcharper/textile.vim.git",
  "https://github.com/tpope/vim-cucumber.git",
  "https://github.com/tpope/vim-fugitive.git",
  "https://github.com/tpope/vim-git.git",
  "https://github.com/tpope/vim-haml.git",
  "https://github.com/tpope/vim-markdown.git",
  "https://github.com/tpope/vim-rails.git",
  "https://github.com/tpope/vim-repeat.git",
  "https://github.com/tpope/vim-surround.git",
  "https://github.com/tpope/vim-vividchalk.git",
  "https://github.com/tsaleh/vim-align.git",
  #"https://github.com/tsaleh/vim-shoulda.git",
  "https://github.com/tsaleh/vim-supertab.git",
  #"https://github.com/tsaleh/vim-tcomment.git",
  "https://github.com/vim-scripts/tComment.git",
  "https://github.com/vim-ruby/vim-ruby.git",
  "https://github.com/altercation/vim-colors-solarized.git",
  "https://github.com/tpope/vim-unimpaired.git",
  "https://github.com/kien/ctrlp.vim.git",
  "https://github.com/derekwyatt/vim-scala.git",
  "https://github.com/solarnz/thrift.git",
  "https://github.com/mattn/webapi-vim.git",
  "https://github.com/scrooloose/nerdcommenter.git",
  "https://github.com/vim-scripts/L9.git",
  "https://github.com/vim-scripts/jQuery.git",
  "https://github.com/vim-scripts/dbext.vim.git",
  "https://github.com/vim-scripts/bufexplorer.zip.git",
  #"https://github.com/vim-scripts/vim-json-bundle.git",
	"https://github.com/elzr/vim-json.git",
  "https://github.com/vim-scripts/pig.vim.git",
  "https://github.com/vim-scripts/twilight.git",
  "https://github.com/vim-scripts/vilight.vim.git",
  "https://github.com/vim-scripts/jellybeans.vim.git",
  "https://github.com/solarnz/thrift.vim.git",
  "https://github.com/dln/avro-vim.git",
  "https://github.com/mattn/gist-vim.git",
  "https://github.com/leafgarland/typescript-vim.git",
  "https://github.com/peitalin/vim-jsx-typescript.git"
]

vim_org_scripts = [
  #["IndexedSearch", "7062",  "plugin"],
  #["gist",          "18053", "zip"],
  #["fuzzyfinder",   "13961",   "zip"],
  #["json",          "10853",  "syntax"],
]

other_scripts = [
 # ["thrift", "http://svn.apache.org/repos/asf/thrift/trunk/contrib/thrift.vim",  "syntax"],
  #["avro-idl", "http://svn.apache.org/repos/asf/avro/trunk/share/editors/avro-idl.vim",  "syntax"]
]


require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "Trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  #  next unless should_update name
  puts " Downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.#{script_type == 'zip' ? 'zip' : script_type == 'tar' ? 'tar': 'vim'}")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
  if script_type == 'zip'
    %x(unzip -d #{name} #{local_file})
  end
  if script_type == 'tar'
    %x(mv #{local_file} #{name};cd #{name};tar xzvf *.tar)
  end
end


other_scripts.each do |name, url, script_type|
  #  next unless should_update name
  puts " Downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.#{script_type == 'zip' ? 'zip' : 'vim'}")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open(url).read
  end
  if script_type == 'zip'
    %x(unzip -d #{name} #{local_file})
  end
end

