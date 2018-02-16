require "spec_helper"

describe Watir::Element do
  describe "#scroll.to" do
    it "scrolls to element (top)" do
      @browser.button(text: 'Center').scroll.to
      expect(visible?(@browser.button(text: 'Top'))).to eq(false)
      expect(visible?(@browser.button(text: 'Center'))).to eq(true)
      expect(visible?(@browser.button(text: 'Bottom'))).to eq(true)
    end

    it "scrolls to element (center)" do
      @browser.button(text: 'Center').scroll.to :center
      expect(visible?(@browser.button(text: 'Top'))).to eq(false)
      expect(visible?(@browser.button(text: 'Center'))).to eq(true)
      expect(visible?(@browser.button(text: 'Bottom'))).to eq(false)
    end

    it "scrolls to element (bottom)" do
      @browser.button(text: 'Center').scroll.to :bottom
      expect(visible?(@browser.button(text: 'Top'))).to eq(true)
      expect(visible?(@browser.button(text: 'Center'))).to eq(true)
      expect(visible?(@browser.button(text: 'Bottom'))).to eq(false)
    end

    it "scrolls by offset" do
      @browser.button(text: 'Bottom').scroll.to.by(-10000, -10000) # simulate scrolling to top
      expect(visible?(@browser.button(text: 'Top'))).to eq(true)
      expect(visible?(@browser.button(text: 'Center'))).to eq(true)
      expect(visible?(@browser.button(text: 'Bottom'))).to eq(false)
    end

    it "raises error when scroll param is not vaild" do
      expect { @browser.button(text: 'Top').scroll.to(:blah) }.to raise_error(ArgumentError)
    end
  end
end
