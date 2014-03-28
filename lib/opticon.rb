class Opticon
  attr_reader :docs, :records

  def initialize input
    docs = records = []
    doc  = record  = []
    while line = input.gets
      l = line.chomp.split(',')
      record = {
        :key    => l[0],
        :volume => l[1],
        :path   => l[2],
        :break  => l[3],
        :empty1 => l[4],
        :empty2 => l[5],
        :pages  => l[6],
      }
      if record[:break]
        docs.push doc if doc != []
        doc = []
      end
      doc.push record
      records.push record
    end
    doc.push record
    docs.push doc if doc != []
    @records = records
    @docs = docs
  end

  def beg_end
    b = @docs[0][0][:key]
    e = @docs[-1][-1][:key]
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
