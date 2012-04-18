# SexyBookmarks
[![Build Status](https://secure.travis-ci.org/cloverinteractive/sexy_bookmarks.png?branch=master)](http://travis-ci.org/cloverinteractive/sexy_bookmarks)

This plugin provides the installation and utilization of SexyBookmarks in Ruby on Rails - It's still in progress but should work out of the box for you.

SexyBookmarks is a cool plugin for wordpress that includes list of social networks to publish content to by [Shareaholic](http://sexybookmarks.shareaholic.com/)

## Installation
Installing SexyBookmarks is pretty simple and straight forward

### Rails >= 3.1
```ruby
gem 'sexy_bookmarks'
```

Then in the asset pipeline in your `application.css` add:

```
*= require sexy_bookmarks
```

That's it!

### Rails 2.3.x - 3.0.x
```ruby
gem 'sexy_bookmarks', '0.1.1'
```

#### Step 2
Add the following to the top of the controller of the page you want to add SexyBookmarks to.

`uses_sexy_bookmarks`

Then to display the list of links in your page just add this to your view:

```erb
<%= show_sexy_bookmarks :permalink => 'http://mycoolsite.com/my_cool_article', :title => @article.title %>
```

Lastly add the following to the `<head>` element of your application view:

`include_sexy_bookmarks_if_needed`

This will load the CSS needed by SexyBookmarks whenever its needed.

## Configuration
There are a couple of options you can easily tweak in Sexy bookmarks:

1. You can choose which social networks to show
2. You can set different text options for SexyBookmarks
3. You can choose in what actions to load the SexyBookmarks CSS

## The SexyBookmarks parameters
The show_sexy_bookmarks method receives 3 parameters, this is what its signature looks like:

```ruby
show_sexy_bookmarks(content, socials = nil, per_row = 8)
```

* The content parameter is a hash that contains, all the article text options such as title, permalink and post summary

REQUIRED KEYS FOR CONTENT / OPTIONS HASH
`[ :title, :permalink, :post_summary ]`

* The socials parameter is an array that contains a collection of the social networks we wish to show
* Finally the per_row parameter is the number of social network icons that fit in your design, by default SexyBookmarks will use 100% of the space available, knowing how many links can fit is useful to properly show/hide the links upon hover

Only the first parameter is mandatory.

### Choosing your social networks
By default SexyBookmarks will show all the links available, however you can choose what links to show simply by passing the show_sexy_bookmarks an array of networks like this:

```erb
<%= show_sexy_bookmarks( options, [ :facebook, :linkedin, :googlebuzz, :myspace ] )
```

## Loading stylesheets only when necessary
This will only work in rails `3.0` and `2.3`, rails `>= 3.1` uses the asset pipeline.

The uses_sexy_bookmarks method on your controller set an instance variable to true which is the compared to load the CSS in your application layout, this method also takes a parameter:

```ruby
uses_sexy_bookmarks :only => [ :show ]
```

This will ensure that the SexyBookmark CSS is only loaded when you visit the actions in the method's parameter.

## Running the tests

You'll need to simply `git clone`, `cd` and run `rake`

```
git clone git://github.com/cloverinteractive/sexy_bookmarks.git
cd sexy_bookmarks
rake
```

There is a dummy up with a view you can run too, once in the sexy_bookmarks dir do:

```
cd test/dummy
rails s
```

You can now check `localhost:3000` and you should se a blank view with three bookmark options in it.

## Important Notes

In development you will probably be hitting these things with localhost:3000 or similar, some of these do not work with such an address, usually because they try and scrape it or are doing some sort url verificiation on their end.

Below is a list of services that will appear not to work when passed a url of http://localhost:3000  They should work on your production site.

* LinkedIn
* Stumbleupon

Support for installing as rails plugin has been dropped, please use as gem through bundler.

### All supported Social Network options

This is the list of all the suported social networks, thanks @asn for the observation:

* 100zakladok
* bebo
* bitacoras
* blinklist
* blogengage
* blogger
* blogmarks
* bobrdobr
* bonzobox
* boxnet
* buzzster
* current
* delicious
* designbump
* designfloat
* digg
* diigo
* dzone
* ekudos
* evernote
* facebook
* faqpal
* friendfeed
* fwisp
* globalgrind
* googlebookmarks
* googlebuzz
* googlereader
* hackernews
* hatena
* hyves
* identica
* izeby
* jumptags
* kaevur
* linkedin
* memoryru
* meneame
* moemesto
* mylinkvault
* myspace
* n4g
* netvibes
* netvouz
* newsvine
* ning
* nujij
* oknotizie
* orkut
* pfbuzz
* pingfm
* plaxo
* plurk
* posterous
* printfriendly
* propeller
* pusha
* reddit
* scriptstyle
* slashdot
* sphinn
* springpad
* squidoo
* strands
* stumbleupon
* stumpedia
* techmeme
* technorati
* tipd
* tumblr
* twitter
* twittley
* viadeo
* virb
* webblend
* wikio
* wykop
* xerpi
* yahoobuzz
* yandex
* zabox
