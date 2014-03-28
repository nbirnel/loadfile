require  "#{File.dirname(__FILE__)}/../lib/opticon"

describe Opticon do

  before do
    @opt = Opticon.new(File.open("#{File.dirname(__FILE__)}/../sample/sample.opt"))
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

end
