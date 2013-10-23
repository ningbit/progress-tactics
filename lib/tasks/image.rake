require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'uri'

URL = 'http://www.videogamesprites.net/FinalFantasyTactics/Jobs/'
# JOBS = ["Thief", "Dragoon", "Samurai", "Monk", "Geomancer", "Ninja", "Mystic", "Orator", "TimeMage", "Summoner", "Arithmetician", "Bard", "Dancer", "Mime", "Squire","Knight","Chemist","WhiteMage","BlackMage","Archer"]
JOBS = ["Dancer","Bard"]


def make_absolute( href, root )
  URI.parse(root).merge(URI.parse(href)).to_s
end

namespace :image do
  desc "TODO"
  task :rip => :environment do

    JOBS.each do |job|
      url = URL + job + '/'
      Nokogiri::HTML(open(url+'?ModPagespeed=off')).xpath("//img/@src").each do |src|
        uri = make_absolute(src,url)
        # slice1 = uri.slice(uri.length-5,5)
        # slice2 = uri.slice(uri.length-8,8)
        # if (slice1 == "M.gif" || slice1 == "F.gif" || slice2 == "M-SW.gif" || slice2 == "F-SW.gif")
        slice3 = uri.slice(uri.length-6,6)
        # if (slice3 == "-S.gif")
        slice4 = uri.slice(uri.length-4,4)
        slice5 = uri.slice(uri.length-7,7)
        if (slice4 == ".gif" || slice5 == "-SW.gif" || slice3 == "-S.gif")
          File.open(File.basename(uri.gsub('Mystic','Oracle').gsub('Arithmetician','Calculator').gsub('Orator','Mediator').gsub('Dragoon','Lancer').gsub('WhiteMage','Priest').gsub('BlackMage','Wizard')),'wb'){ |f| f.write(open(uri).read) }
          puts uri
        end
      end
    end

  end

end
