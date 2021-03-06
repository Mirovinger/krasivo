# coding: utf-8

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    ArticleTag.destroy_all
    
    Article.destroy_all
    
    Article.populate 10..100 do |article|
      article.title = Populator.words(1..5).titleize
      article.text = Populator.sentences(2..30)
      article.date = Time.now
    end
  end
end

namespace :mail do
  desc "Erase and fill database"
  task :distribute => :environment do
    SubscriptionMailer.events_feed_email.deliver
  end
end

namespace :pages do
  desc "Erase and fill database"
  task :populate => :environment do
    Page.create!(:section => 'about', :title => 'О школе', :text => 'О школе')
    Page.create!(:section => 'teach_list', :title => 'Что преподаем', :text => 'Что преподаем')
  end
end