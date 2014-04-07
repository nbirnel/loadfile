##
# classes for manipulating electronic evidence discovery loadfiles

module Loadfile

  ##
  # Represent the data in a Concordance® Opticon® image loadfile.

  class Opticon
    attr_reader :docs

    ## 
    # Create a new opticon composed of +docs
    
    def initialize docs
      @docs = docs
    end

    def records
      @docs.flatten
    end
    ## 
    # Return the first and last image keys
    
    def beg_end
      b = records[0][:key]
      e = records[-1][:key]
      [b, e]
    end

    ##
    # Return a list of begining and end image keys for each document. 
    # FIXME not yet implemented.
    
    def beg_end_list
      @docs.each do |d|
        "#{d.first[:key]}, #{d.last[:key]}"
      end
    end

    ## 
    # Return a count of documents.
    
    def doc_count
      @docs.length
    end

    ## 
    # Return a count of images
    
    def image_count
      records.length
    end

    ## 
    # Return a count of tiffs
    
    def tiff_count
      records.select{|r| r[:path] =~ /\.tif$/}.length
    end

    ## 
    # Return a count of jpegs
    
    def jpeg_count
      records.select{|r| r[:path] =~ /\.jpg$/}.length
    end

    ## 
    # Return a list of volumes
    
    def volumes
      records.map{|r| r[:volume]}.uniq
    end

    ##
    # Return a new opticon data stream, suitable for loading.
    
    def to_s
      l = records.map{|r| r.values.join ','}
      l.join("\r\n") << "\r\n"
    end

  end

end
