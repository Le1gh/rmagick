RSpec.describe Magick::ImageList, "#deconstruct" do
  before do
    @ilist = Magick::ImageList.new
  end

  it "works" do
    @ilist.read(IMAGES_DIR + '/Button_0.gif', IMAGES_DIR + '/Button_1.gif')
    ilist2 = nil
    expect { ilist2 = @ilist.deconstruct }.not_to raise_error
    expect(ilist2).to be_instance_of(Magick::ImageList)
    expect(ilist2.length).to eq(2)
    expect(ilist2.scene).to eq(0)
  end
end
