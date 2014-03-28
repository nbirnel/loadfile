##
# classes for manipulating Concordance® Opticon® image loadfiles.

module Opticon

  ##
  # Represent the data in a Concordance® Opticon® image loadfile.

  class Opticon
    attr_reader :records

    ## 
    # Create a new opticon composed of +records+.
    
    def initialize records
      @records = records
    end

    ## 
    # Return the first and last image keys
    
    def beg_end
      b = @records[0][:key]
      e = @records[-1][:key]
      [b, e]
    end

    ##
    # Return a list of begining and end image keys for each document. 
    # FIXME not yet implemented.
    
    def beg_end_list
    end

    ## 
    # Return a count of documents.
    
    def doc_count
      @records.select{|r| r[:break]}.length
    end

    ## 
    # Return a count of images
    
    def image_count
      @records.length
    end

    ## 
    # Return a count of tiffs
    
    def tiff_count
      @records.select{|r| r[:path] =~ /\.tif$/}.length
    end

    ## 
    # Return a count of jpegs
    
    def jpeg_count
      @records.select{|r| r[:path] =~ /\.jpg$/}.length
    end

    ## 
    # Return a list of volumes
    
    def volumes
      @records.map{|r| r[:volume]}.uniq
    end

    ##
    # Return a new opticon data stream, suitable for loading.
    
    def to_s
      l = @records.map{|r| r.values.join ','}
      l.join("\r\n") << "\r\n"
    end

  end

  ##
  # This class converts an opticon text file or data stream to an instance 
  # of Opticon
  
  class Parser

    ##
    # Create a new parser for Opticon

    def initialize
      @records   = []
    end

    ##
    # Parse text from IO object +input+. It is the caller's responsibility to
    # open and close the +input+ correctly.

    def parse input
      c_doc     = []
      while line = input.gets
        l = line.chomp.split(',')
        c_record = {
          :key    => l[0],
          :volume => l[1],
          :path   => l[2],
          :break  => l[3],
          :empty1 => l[4],
          :empty2 => l[5],
          :pages  => l[6],
        }
        @records.push c_record
      end
      Opticon.new  @records
    end

  end

end
