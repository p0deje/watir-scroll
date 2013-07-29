require "spec_helper"

describe "watir-scoll" do
  describe "#scroll.to" do
    it "scrolls to the top of the page" do
      @browser.scroll.to :bottom
      @browser.scroll.to :top
      visible?(@browser.button(text: 'Top')).should    == true
      visible?(@browser.button(text: 'Bottom')).should == false
    end

    it "scrolls to the center of the page" do
      @browser.scroll.to :center
      visible?(@browser.button(text: 'Top')).should    == false
      visible?(@browser.button(text: 'Bottom')).should == false
    end

    it "scrolls to the bottom of the page" do
      @browser.scroll.to :bottom
      visible?(@browser.button(text: 'Top')).should    == false
      visible?(@browser.button(text: 'Bottom')).should == true
    end

    it "scrolls to element" do
      button = @browser.button(text: 'Bottom')
      @browser.scroll.to button
      visible?(button).should == true
    end

    it "scrolls to coordiantes" do
      button = @browser.button(text: 'Bottom')
      @browser.scroll.to [button.wd.location.x, button.wd.location.y]
      visible?(button).should == true
    end
  end
end
