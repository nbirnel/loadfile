def make_big_opt

  ims_per_doc = 100
  docs_per_fold = 100
  folds_per_vol = 10
  n_volumes = 100

  @volume = 0
  @folder = 0
  @imagen = 0

  def line volume, folder, doc = nil, pp = nil
    @imagen += 1
    imagek = sprintf 'CTRl-%07d', @imagen
    printf "%s,BIG_DATA_%02d,\\IMAGES\\%03d\\%s.tif,%s,,,%s\r\n", imagek, volume, folder, imagek, doc, pp
  end

  n_volumes.times do
    @volume += 1
    @folder = 0
    folds_per_vol.times do
      @folder += 1
      docs_per_fold.times do
        line @volume, @folder, 'Y', ims_per_doc
        (ims_per_doc - 1).times do
          line @volume, @folder
        end
      end
    end
  end

end

make_big_opt
