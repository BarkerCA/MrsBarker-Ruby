require 'open-uri'
require 'nokogiri'

class Bible
  
  attr_reader :nt_books, :ot_books, :books
  
  def initialize
    # https://www.esvapi.org API Key
    @key          = "3467cb0ae2d504b7"
    @host         = "http://www.esvapi.org/v2/rest/"
    #Old Testament Books
    @ot_books = {
    # Lookup Key -> Display Name -> Chapter Count
      :genesis        => ["Genesis", 50],
      :exodus         => ["Exodus", 40],
      :leviticus      => ["Leviticus", 27],
      :numbers        => ["Numbers", 36],
      :deuteronomy    => ["Deuteronomy", 34],
      :joshua         => ["Joshhua", 24],
      :judges         => ["Judges", 21],
      :ruth           => ["Ruth", 4],
      :samuel1        => ["1 Samuel", 31],
      :samuel2        => ["2 Samuel", 24],
      :chronicles1    => ["1 Chronicles", 22],
      :chronicles2    => ["2 Chronicles", 25],
      :ezra           => ["Ezra", 10],
      :nehemiah       => ["Nehemiah", 13],
      :esther         => ["Esther", 10],
      :job            => ["Job", 42],
      :psalms         => ["Psalms", 150],
      :proverbs       => ["Proverbs", 31],
      :ecclesiastes   => ["Ecclesiastes", 12],
      :songofsolomon  => ["Song of Solomon", 8],
      :isaiah         => ["Isaiah", 66],
      :jeremiah       => ["Jeremiah", 52],
      :lamentations   => ["Lamentations", 5],
      :ezekiel        => ["Ezekiel", 48],
      :daniel         => ["Daniel", 12],
      :hosea          => ["Hosea", 14],
      :joel           => ["Joel", 3],
      :amos           => ["Amos", 9],
      :obadiah        => ["Obadiah", 1],
      :jonah          => ["Jonah", 4],
      :micah          => ["Micah", 7],
      :nahum          => ["Nahum", 3],
      :habakkuk       => ["Habakkuk", 3],
      :zephaniah      => ["Zephaniah", 3],
      :haggai         => ["Haggai", 2],
      :zechariah      => ["Zechariah", 14],
      :malachi        => ["Malachi", 4]
    }
    #New Testament Books
    @nt_books = {
    # Lookup Key -> Display Name -> Chapter Count
      :matthew        => ["Matthew", 28],
      :mark           => ["Mark", 16],
      :luke           => ["Luke", 24],
      :john           => ["John", 21],
      :acts           => ["Acts", 28],
      :romans         => ["Romans", 16],
      :corinthians1   => ["1 Corinthians", 16],
      :corinthians2   => ["2 Corinthians", 13],
      :galatians      => ["Galatians", 6],
      :ephesians      => ["Ephesians", 6],
      :philippians    => ["Philippians", 4],
      :colossians     => ["Colossians", 4],
      :thessalonians1 => ["1 Thessalonians", 5],
      :thessalonians2 => ["2 Thessalonians", 3],
      :timothy1       => ["1 Timothy", 6],
      :timothy2       => ["2 Timothy", 4],
      :titus          => ["Titus", 3],
      :philemon       => ["Philemon", 1],
      :hebrews        => ["Hebrews", 13],
      :james          => ["James", 5],
      :peter1         => ["1 Peter", 5],
      :peter2         => ["2 Peter", 3],
      :john1          => ["1 John", 5],
      :john2          => ["2 John", 1],
      :john3          => ["3 John", 1],
      :jude           => ["Jude", 1],
      :revelation     => ["Revelation", 22]
    }

    # Merge Testaments for complete books hash
    books = @ot_books
    @books = books.merge(@nt_books)
  end
  
  def find_book(heading)
    heading_string = heading.to_s
    book = 'begin'
    @books.each do |b|
      if heading_string.match(b[1][0])
        book = b[1][0]
      end
    end
    # Return Book
    book
  end

  def passageQuery(passage="John3:16-17")
    
    # Check for sanitized passage text
    if @passage
      p = @passage
    else
      sanitize_passage(passage)
      p = @passage
    end
    
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
    
    @url = "#{@host}passageQuery?key=#{@key}&passage=#{p}#{include_passage_references}#{include_verse_numbers}#{include_footnotes}#{include_footnote_links}#{include_headings}#{include_subheadings}#{include_surrounding_chapters}#{include_word_ids}#{link_url}#{include_audio_link}#{audio_format}#{include_short_copyright}#{include_copyright}"
    
    Nokogiri::HTML(open(@url))
      
  end
  
  def sanitize_passage(passage)
    #Remove Spaces
    @original_passage = passage
    @passage = passage.gsub(' ', '').downcase
  end

end