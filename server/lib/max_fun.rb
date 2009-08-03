
require 'nokogiri'
require 'open-uri'
require 'cgi'
require 'digest'

module MaxFun
  def self.scrape
    document = Nokogiri::XML.parse(open("episodes.xml"))
    
    items = document.css("item")
    
    stop_at = Date.parse("2009-05-01")
    
    (items.collect do |item|
      date = Date.parse(item.css("pubDate").first.inner_html)
      if date >= stop_at
      
        description_html = CGI.unescapeHTML(item.css("description").first.inner_html)
        description = Nokogiri::HTML.parse(description_html)
      
        title = item.css("title").first.inner_html
      
        guests = description.css(".field-field-guests .field-item")
        guest_list = ""
        if guests.any?
          guest_list = (guests.collect do |guest|
            guest.text.gsub(/[\n\t\302\240]/, "").gsub("Guests:", "").strip
          end).join(", ")
        end
        
        text = description.css("p")[1].inner_html
      
      
        {:link => item.css("link").first.inner_html,
         :guests => guest_list,
         :title => title,
         :media => description.css(".field.field-type-text.field-field-media-url .field-item.odd").first.inner_html.strip,
         :date => date,
         :description => text,
         :id => self.hash(title),
         :small_img => nil, #{}"http://localhost:3000/shows/new",
         :img => (description.css("img").first.attributes["src"].text if description.css("img").any?)
        }
      end
    end).compact
  end
  
  def self.hash(thing)
    Digest::SHA1.hexdigest(thing)
  end
  
  def self.find_with_id(id_string)
    (self.scrape.select { |a| a[:id] == id_string}).first
  end
end