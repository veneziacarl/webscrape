require 'nokogiri'
require 'open-uri'
require 'pry'

(1..94).each do |page|
  doc = Nokogiri::HTML(open("https://www.icmag.com/ic/showthread.php?t=289990&page=#{page}"))
  doc.css('a.bigusername').each do |link|
    if link.children[0].content == "FatherEarth"
      open('results.md', 'a') do |f|
        f.puts link.parent.parent.next_element.css('div')[0]
      end
    end
  end
end
