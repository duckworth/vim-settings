#!/usr/bin/env ruby

git_bundles = [ 
  #"git://github.com/astashov/vim-ruby-debugger.git",
  "git://github.com/msanders/snipmate.vim.git",
  #"git://github.com/scrooloose/nerdtree.git",
  #use wycats modified janus nerdtree
  "git://github.com/wycats/nerdtree.git",  
  "git://github.com/timcharper/textile.vim.git",
  "git://github.com/tpope/vim-cucumber.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/tpope/vim-git.git",
  "git://github.com/tpope/vim-haml.git",
  "git://github.com/tpope/vim-markdown.git",
  "git://github.com/tpope/vim-rails.git",
  "git://github.com/tpope/vim-repeat.git",
  "git://github.com/tpope/vim-surround.git",
  "git://github.com/tpope/vim-vividchalk.git",
  "git://github.com/tsaleh/vim-align.git",
  "git://github.com/tsaleh/vim-shoulda.git",
  "git://github.com/tsaleh/vim-supertab.git",
  #"git://github.com/tsaleh/vim-tcomment.git",
  "git://github.com/vim-scripts/tComment.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/altercation/vim-colors-solarized.git",
  "git://github.com/tpope/vim-unimpaired.git",
  "git://github.com/kien/ctrlp.vim.git",
  "git://github.com/derekwyatt/vim-scala.git",
	"git://github.com/solarnz/thrift.git",
	"git://github.com/mattn/webapi-vim.git",
	"git://github.com/mattn/gist-vim.git"
]

vim_org_scripts = [
  #["IndexedSearch", "7062",  "plugin"],
  #["gist",          "18053", "zip"],
  ["jquery",        "15752", "syntax"],
  ["dbext",         "17851",  "zip"],
  ["bufexplorer",   "14208",   "zip"],
  #["fuzzyfinder",   "13961",   "zip"],
  ["l9",  					"13948",   "zip"],
  ["nerdcommenter", "14455",   "zip"],
  ["wikipedia",  	  "16886",   "tar"],
  ["json",          "10853",  "syntax"],
  ["pig",           "10654",  "syntax"],
  ["twilight",      "16547",  "colors"],
  ["vilight",       "16574",  "colors"],
  ["jellybeans",    "17225",  "colors"]
]

other_scripts = [
 # ["thrift", "http://svn.apache.org/repos/asf/thrift/trunk/contrib/thrift.vim",  "syntax"],
  ["avro-idl", "http://svn.apache.org/repos/asf/avro/trunk/share/editors/avro-idl.vim",  "syntax"]
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

