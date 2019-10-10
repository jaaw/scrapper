require 'rubygems'
require 'nokogiri' 
require 'open-uri'

def money
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
crypto = page.css('a.currency-name-container') 
crypto_name = []
crypto.size.times do |i|
crypto_name << crypto[i].text
end


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
money = page.css('a.price') 
price_number = []
money.size.times do |i|
price_number << money[i].text
end


crypto_number = Hash[crypto_name.zip price_number]
print crypto_number 
end

money