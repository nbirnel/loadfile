class Opticon
  attr_reader :docs, :records

  def initialize input
    docs      = []
    c_doc     = []
    records   = []
    c_record  = {}
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
      if c_record[:break]
        docs.push c_doc if c_doc != []
        c_doc = []
      end
      c_doc.push   c_record
      records.push c_record
    end
    c_doc.push c_record
    docs.push c_doc if c_doc != []
    @records = records
    @docs = docs
  end

  def beg_end
    b = @records[0][:key]
    e = @records[-1][:key]
    [b, e]
  end

  def doc_count
    @docs.length
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
