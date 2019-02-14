source "https://rubygems.org"
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.0"

gem "bcrypt", "3.1.12"
gem "bootstrap-sass", "3.3.7"
gem "bootsnap", ">= 1.1.0", require: false
gem "kaminari"
gem "bootstrap-kaminari-views"
gem "carrierwave", "1.2.2"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "i18n-js"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "faker", "1.7.3"
gem "figaro"
gem "puma", "~> 3.0"
gem "mini_magick", "4.7.0"
gem "rails", "~> 5.0.7", ">= 5.0.7.1"
gem "rails-i18n"
gem "rails-ujs"
gem "rubocop", "~> 0.54.0", require: false
gem "sass-rails", "~> 5.0"
gem "sqlite3", "1.3.13"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
group :development, :test do
  gem "byebug", platform: :mri
end
group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
group :productiton do
  gem "fog", "1.42"
end
