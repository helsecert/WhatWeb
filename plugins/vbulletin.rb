##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.5 # 2016-08-19 # Bhavin Senjaliya <bhavin.senjaliya@gmail.com>
# Added cookies
##
# Version 0.4 # 2014-01-07 @csalazar
# 5 new version detection matches
##
# Version 0.2
# removed :certainty=>100 & :name
# Version 0.3
# Uses :version=>//

Plugin.define do
name "VBulletin"
author "Andrew Horton"
version "0.5"
description "VBulletin is a PHP forum."


matches [
{:ghdb=>'"Powered by vBulletin" inurl:newreply.php'},

{:regexp=>/<meta name="generator" content="vBulletin/}, #"

{:certainty=>75, :regexp=>/\* vBulletin [0-9a-z.]+ CSS/},

{:name=>"vbulletin_global.js", :regexp=>/<script type="text\/javascript" src="[a-z0-9.\/]*vbulletin_global.js/},

{:certainty=>75, :text=>'vb_bullet.gif"'}, #' comment for gedit syntax hilighting

{:regexp=>/Powered by(:)? vBulletin(&reg;)? Version/},

{:certainty=>50, :regexp=>/Copyright &copy;2000 - [0-9]+, Jelsoft Enterprises Ltd./},

{:version=>/Powered by(:)? vBulletin(&reg;)? Version ([0-9a-z.]+)/, :offset=>2,  :name=>"version" },
{:version=>/<meta name="generator" content="vBulletin ([0-9a-z.]+)" \/>/,  :name=>"version" },
{:version=>/\* vBulletin ([0-9a-z.]+) CSS/,  :name=>"version" },


{:version=>/clientscript\/vbulletin_md5\.js,qv=(\d+)\.pagespeed\..*?js">/,  :name=>"version" },
{:version=>/clientscript\/vbulletin-core\.js\?v=(\d+)/,  :name=>"version" },
{:version=>/\/vbulletin\/clientscript\/guestforum\.js\?v=(\d+)/,  :name=>"version" },
{:version=>/clientscript\/vbulletin_global\.js\?v=(\d+)/,  :name=>"version" },
{:version=>/\/vbulletin_read_marker\.js\?v=(\d+)/,  :name=>"version" },

# Cookie
{ :search => "headers[set-cookie]", :regexp => /bblastactivity/, :name=>"bblastactivity cookie" },
{ :search => "headers[set-cookie]", :regexp => /bblastvisit/, :name=>"bblastvisit cookie" },
{ :search => "headers[set-cookie]", :regexp => /bbsessionhash/, :name=>"bbsessionhash cookie" },


]

 
# <meta name="generator" content="vBulletin 3.8.3" />
# <style type="text/css" id="vbulletin_css">
# <script type="text/javascript" src="clientscript/vbulletin_menu.js?v=383"></script>
# <script type="text/javascript" src="clientscript/vbulletin_md5.js?v=383"></script>
# <td class="vbmenu_control">
# // Main vBulletin Javascript Initialization


# <meta name="generator" content="vBulletin 3.7.3" />
# <meta name="generator" content="vBulletin 3.8.2" />
# <meta name="generator" content="vBulletin 3.0.0" />

# * vBulletin 3.7.3 CSS
# * vBulletin 3.8.2 CSS

# <script type="text/javascript" src="clientscript/vbulletin_global.js?v=373"></script>
# <input type="hidden" name="vb_login_md5password" />

# vb_bullet.gif

# Powered by: vBulletin Version 2.0.3<br>
# Powered by: vBulletin Version 2.3.2<br> 
# Powered by vBulletin&reg; Version 3.7.3<br />Copyright &copy;2000 - 2009, Jelsoft Enterprises Ltd.
# vBulletin&reg; Copyright &copy;2000 - 2009, Jelsoft Enterprises Ltd.
# Copyright &copy;2000 - 2009, Jelsoft Enterprises Ltd.
# Powered by: vBulletin Version 3.0.0<br />Copyright &copy;2000 - 2009, Jelsoft Enterprises Ltd.



end

