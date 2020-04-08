# Reddit S&P 500 Post Analyzer

This will grab all of the comments from this post:

[Mod approved/r/FI contest: Guess what the S&P500 will close at on December 31st, 2020.](https://www.reddit.com/r/financialindependence/comments/fwnrpt/mod_approvedrfi_contest_guess_what_the_sp500_will/)

It'll generate a file called `results.csv` with all guesses. That file will have 4 columns:

* Comment Date
* Guess
* Author
* Link to the Comment

A "guess" is anything that meets all of these criteria:

* Is a top level comment
* Contains a number, optionally with a comma.
* The number must be at least 3 digits (yes, I'm ruling out guesses under $100).
* If there are multiple numbers in that comment, the first will be used.

## Installation

In order to run this, you'll need to have Ruby installed. Download all code for this project then open up Terminal (or your command line of choice if you're not on a Mac). Run the following command to install dependencies using the `bundle` command:

```
sp500 (master) $ bundle
Using bundler 2.1.4
Using mime-types-data 3.2019.1009
Using mime-types 3.3.1
Using multi_xml 0.6.0
Using httparty 0.18.0
Bundle complete! 1 Gemfile dependency, 5 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

## Generate a CSV

Open up your Terminal and navigate to this directory. From there, run this command to see all results.

```
sp500 (master) $ ruby create_results.rb
```

That'll generate a `results.csv` file and you're done~
