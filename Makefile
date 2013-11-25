all:
    ruby -c ArithmeticMeanFilter.rb
    ruby -c BinomialFilter.rb
    ruby -c Filter.rb
    ruby -c FilterCascade.rb
    ruby -c Fixnum.rb
    ruby -c MaxFilter.rb
    ruby -c MinFilter.rb
    ruby -c ScalarLinearFilter.rb

test:
    rspec spec

rdoc:
    rm -r doc
    rdoc