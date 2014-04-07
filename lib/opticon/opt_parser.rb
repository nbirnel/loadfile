module Loadfile

  ##
  # This class converts an opticon text file or data stream to an instance 
  # of Opticon
  
  class OptParser

    ##
    # Create a new parser for Opticon

    def initialize
      @docs = []
      @doc = []
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
        new_doc if c_record[:break] && $. >1
        @doc.push c_record
      end
      #sloppy
      @docs.push @doc
      Loadfile::Opticon.new @docs
    end

    private

    def new_doc
      @docs.push @doc
      @doc = []
    end
  end

end
