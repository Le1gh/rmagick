RSpec.describe Magick::Pixel, '#eql?' do
  before do
    @pixel = Magick::Pixel.from_color('brown')
  end

  it 'works' do
    pixel2 = @pixel
    expect(@pixel.eql?(pixel2)).to be(true)
    pixel2 = Magick::Pixel.new
    expect(@pixel.eql?(pixel2)).to be(false)
  end
end
