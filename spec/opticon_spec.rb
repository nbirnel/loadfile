require  "#{File.dirname(__FILE__)}/../lib/opticon"

describe Opticon do

  describe Opticon::Opticon do

    before do
      @parser = Opticon::Parser.new
      @sample = "#{File.dirname(__FILE__)}/../sample/sample.opt"
      @io = File.new(@sample,'r')
      @opt = @parser.parse @io
    end

    it 'returns a beg - end' do
      @opt.beg_end.should eq ["CTRL-000001", "CTRL-000018"]
    end

    it 'returns a document count' do
      @opt.doc_count.should eq 3
    end

    it 'returns an image count' do
      @opt.image_count.should eq 18
    end

    it 'returns a tiff count' do
      @opt.tiff_count.should eq 17
    end

    it 'returns a jpeg count' do
      @opt.jpeg_count.should eq 1
    end

    it 'returns an list of volumes' do
      @opt.volumes.should eq ["SAMPLE_VOLUME_001", "SAMPLE_VOLUME_002"]
    end

    it 'prints itself' do
      @opt.to_s.length.should eq 1122
    end

    it 'returns a beg-end list' do
      pending
      @opt.beg_end_list.should eq 'foo'
    end

    it 'returns an Ipro lfp' do
      pending
    end

    it 'returns a Summation dii' do
      pending
    end


  end

end
