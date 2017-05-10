require 'active_support/all'

array = [0, 1, 2, 3, 4, 5, 6]

array.from(4)         # [4, 5, 6]
array.to(2)           # [0, 1, 2]
array.in_groups_of(3) # [[0, 1, 2], [3, 4, 5], [6, nil, nil]]
array.split(2)        # [[0, 1], [3, 4, 5, 6]]

apocalypse = DateTime.new(2012, 12, 21, 14, 27, 45)

apocalypse.at_beginning_of_day  # Fri, 21 Dec 2012 00:00:00 +0000
apocalypse.at_end_of_month      # Mon, 31 Dec 2012 23:59:59 +0000
apocalypse.at_end_of_day        # Fri, 21 Dec 2012 23:59:59 +0000 
apocalypse.at_beginning_of_year # Sun, 01 Jan 2012 00:00:00 +0000

apocalypse.advance(years: 4, months: 3, weeks: 2, days: 1) # Wed, 05 Apr 2017 14:27:45 +0000
apocalypse.tomorrow                                        # Sat, 22 Dec 2012 14:27:45 +0000
apocalypse.yesterday                                       # Thu, 20 Dec 2012 14:27:45 +0000

options = { user: 'codeschool', lang: 'fr' }
new_options = { user: 'codeschool', lang: 'fr', password: 'dunno' }

options.diff(new_options) # DEPRECATED
options.stringify_keys    # { "user" => "codeschool", "lang" => "fr" }

options = { lang: 'fr', user: 'codeschool' }
defaults = { lang: 'en', country: 'us' }

options.reverse_merge(defaults) # Set default values for missed keys

new_options = { user: 'codeschool', lang: 'fr', password: 'dunno' }

new_options.except(:password)               # Remove these keys
new_options.assert_valid_keys(:user, :lang) # Throws exception if the hash contains any keys besides those passed

"#{1.ordinalize} place"  # 1st place
"#{2.ordinalize} place"  # 2nd place
"#{23.ordinalize} place" # 23rd place

"user".plurarize    # users
"women".singularize # woman
"octopus".plurarize # octopi

"ruby bits".titleize       # Ruby Bits
"account_options".humanize # Account options
