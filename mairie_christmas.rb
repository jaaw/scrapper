require 'rubygems'
require 'nokogiri' 
require 'open-uri'


def get_townhall_email


page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
city_names = []
city_emails = []
page.xpath('//td/p/a').each do |node|
city_names << node.text
print city_names
end
city_names.size.times do |nod|
page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/#{city_names[nod].tr("","-")}.html"))
page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/tr[2]').each do |i|
city_emails << i.text
end 
end
print city_emails
names_emails = Hash[city_names.zip city_emails]
print names_emails
	
end


get_townhall_email