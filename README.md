# Task:
1. Write a ruby script that:
    * Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
    * Returns the following:
        * list of webpages with most page views ordered from most pages views to less page views e.g.:\
          /home 90 visits /index 80 visits etc
        * list of webpages with most unique page views also ordered e.g.:\
          /about/2 8 unique views
    * Feel free to make changes or design something if you think it meets the
     criteria above, but would produce better outcomes
          
# Additional work
Added statistic for persons - unique links visited and total hits made from one IP.

# Run:
Result: ruby parser.rb webserver.log\
Tests: rspec -> Covered 100%

# Result:
URLs by number of total visits:\
/about/2 - 90 visits\
/contact - 89 visits\
/index - 82 visits\
/about - 81 visits\
/help_page/1 - 80 visits\
/home - 78 visits\
\
URLs by number of unique visits:\
/help_page/1 - 23 unique visits\
/contact - 23 unique visits\
/home - 23 unique visits\
/index - 23 unique visits\
/about/2 - 22 unique visits\
/about - 21 unique visits\
\
Persons by number of total visits:\
722.247.931.582 - 31 visits\
158.577.775.616 - 31 visits\
etc.\
\
Persons by number of unique visits:\
126.318.035.038 - 6 unique visits\
184.123.665.067 - 6 unique visits\
etc.


