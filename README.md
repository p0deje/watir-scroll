### :warning: :warning: :warning: [watir-scroll was merged in Watir](https://github.com/watir/watir/pull/831). Please, upgrade Watir to [6.16](http://watir.com/watir-6-16/) and don't use this gem directly. :warning: :warning: :warning:

# watir-scroll [![Build Status](https://travis-ci.org/p0deje/watir-scroll.svg?branch=master)](https://travis-ci.org/p0deje/watir-scroll) [![Gem Version](https://badge.fury.io/rb/watir-scroll.svg)](http://badge.fury.io/rb/watir-scroll)

Scrolling API for [Watir](http://github.com/watir/watir).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'watir-scroll'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install watir-scroll
```

## Usage

### Scrolling on Browser Window Level

```ruby
browser.scroll.to :top      # scrolls to the top of the page
browser.scroll.to :center   # scrolls to the center of the page
browser.scroll.to :bottom   # scrolls to the bottom of the page
browser.scroll.to [10, 10]  # scrolls to coordinates x and y
browser.scroll.by 10, 10    # scrolls to left and down by 10 pixels
browser.scroll.by -10, -10  # scrolls to right and top by 10 pixels
```

You can also chain the calls:

```ruby
browser.scroll.to(:top).by(0, 100)  # scrolls to the top of the page and 100 pixels down
```

### Scrolling To Elements


```ruby
button = browser.button(text: 'Click')

button.scroll.to          # scrolls element to the top
button.scroll.to :center  # scrolls element to the center
button.scroll.to :bottom  # scrolls element to the bottom
button.scroll.by 10, 10   # scrolls to left and down by 10 pixels
button.scroll.by -10, -10 # scrolls to right and top by 10 pixels
```

You can also chain the calls:

```ruby
button.scroll.to.by(0, 100) # scrolls to the button and 100 pixels down
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
