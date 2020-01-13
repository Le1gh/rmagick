RSpec.describe Magick::Image, '#mime_type' do
  before do
    @img = Magick::Image.new(100, 100)
    gc = Magick::Draw.new

    gc.stroke_width(5)
    gc.circle(50, 50, 80, 80)
    gc.draw(@img)

    @hat = Magick::Image.read(FLOWER_HAT).first
    @p = Magick::Image.read(IMAGE_WITH_PROFILE).first.color_profile
  end

  it 'works' do
    img2 = @img.copy
    img2.format = 'GIF'
    expect { img2.mime_type }.not_to raise_error
    expect(img2.mime_type).to eq('image/gif')
    img2.format = 'JPG'
    expect(img2.mime_type).to eq('image/jpeg')
    expect { img2.mime_type = 'image/jpeg' }.to raise_error(NoMethodError)
  end
end
