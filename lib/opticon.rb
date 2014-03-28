module Opticon

  class Opticon
    attr_reader :records

    def initialize records
      @records = records
    end

    def beg_end
      b = @records[0][:key]
      e = @records[-1][:key]
      [b, e]
    end

    def doc_count
      @records.select{|r| r[:break]}.length
    end

    def image_count
      @records.length
    end

    def tiff_count
      @records.select{|r| r[:path] =~ /\.tif$/}.length
    end

    def jpeg_count
      @records.select{|r| r[:path] =~ /\.jpg$/}.length
    end

    def volumes
      @records.map{|r| r[:volume]}.uniq
    end

  end

  class Parser

    def initialize
      @records   = []
    end

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
