require 'open-uri'
require 'nokogiri'

class CAB::Bible
  
  def initialize
    @key          = "3467cb0ae2d504b7"
    @host         = "http://www.esvapi.org/v2/rest/"
  end
  
  def passageQuery(passage="John3:16-17")
    include_passage_references    = "&include-passage-references=true"
    include_verse_numbers         = "&include-verse-numbers=true"
    include_footnotes             = "&include-footnotes=true"
    include_footnote_links        = "&include-footnote-links=true"
    include_headings              = "&include-headings=true"
    include_subheadings           = "&include-subheadings=true"
    include_surrounding_chapters  = "&include-surrounding-chapters=false"
    include_word_ids              = "&include-word-ids=false"
    link_url                      = "&link-url=http://school.barker.edu"
    include_audio_link            = "&include-audio-link=true"
    audio_format                  = "&audio-format=flash"
    audio_version                 = "&audio-version=mm"
    include_short_copyright       = "&include-short-copyright=false"
    include_copyright             = "&include-copyright=false"
    
    @url = "#{@host}passageQuery?key=#{@key}&passage=#{passage}#{include_passage_references}#{include_verse_numbers}#{include_footnotes}#{include_footnote_links}#{include_headings}#{include_subheadings}#{include_surrounding_chapters}#{include_word_ids}#{link_url}#{include_audio_link}#{audio_format}#{include_short_copyright}#{include_copyright}"
    
    Nokogiri::HTML(open(@url))
      
  end
  
  def get
    @doc = Nokogiri::XML(open(@url))
  end
  
end