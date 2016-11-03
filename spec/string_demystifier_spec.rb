require "spec_helper"
require "trikeapps"

describe Trikeapps::StringDemystifier do

	before(:all) do
    str = "!SSWSWSKCOR !OTNAAAWAA!"
		@string_small = Trikeapps::StringDemystifier.new str
		str = "!YTIRCO!IQIIQIDEMGMMIM FO YMJMMSM!RA !EGEEJEHT ROEOOSOF PAEJEEBEL TN!AIKIITIG ENVNNMNO ,GQGGCGN!ILEKIZIISIRT A RJRRDROF PETOTTJTS LLZLLEL!AMSXSSMS ENODOOSO"
		@string_large = Trikeapps::StringDemystifier.new str
  end

  describe 'rule1' do

    it 'returns a string' do
    	expect(@string_small.rule1).to be_a String
    end

    it 'should not replace if the left and right values are same unless the surrounding character is a space' do
    	str = "!OTNAAAWAA A AXA"
			str_dem = Trikeapps::StringDemystifier.new str
    	expect(str_dem.rule1).to eq '!OTNAAAAAA A AAA'
	  end

    it 'should replace correct value in the middle if the left and right values are same for small_string' do
    	expect(@string_small.rule1).to eq '!SSSSSSKCOR !OTNAAAAAA!'
	  end

	  it 'should replace correct value in the middle if the left and right values are same for big_string' do
    	expect(@string_large.rule1).to eq '!YTIRCO!IIIIIIDEMMMMMM FO YMMMMMM!RA !EEEEEEHT ROOOOOOF PAEEEEEEL TN!AIIIIIIG ENNNNNNO ,GGGGGGN!ILEKIIIIIIRT A RRRRRROF PETTTTTTS LLLLLLL!AMSSSSSS ENOOOOOO'
	  end

  end

  describe 'rule2' do

  	it 'returns a string' do
    	expect(@string_small.rule2).to be_a String
    end

	  it 'should replace any consecutive 6 character as 1 character in the small_string' do
    	expect(@string_small.rule2(@string_small.rule1)).to eq '!SKCOR !OTNA!'
	  end

	  it 'should replace any consecutive 6 character as 1 character in the large_string' do
    	expect(@string_large.rule2(@string_large.rule1)).to eq '!YTIRCO!IDEM FO YM!RA !EHT ROF PAEL TN!AIG ENO ,GN!ILEKIRT A ROF PETS LL!AMS ENO'
	  end

  end

  describe 'rule3' do
  	it 'returns a string' do
    	expect(@string_small.rule3).to be_a String
    end

    it 'should replace any consecutive 6 character as 1 character in the small_string' do
    	expect(@string_large.rule3(@string_small.rule2(@string_small.rule1))).to eq 'ANTO ROCKS'
	  end

	   it 'should replace any consecutive 6 character as 1 character in the large_string' do
    	expect(@string_large.rule3(@string_large.rule2(@string_large.rule1))).to eq 'ONE SMALL STEP FOR A TRIKELING, ONE GIANT LEAP FOR THE ARMY OF MEDIOCRITY'
	  end


  end

  describe 'Demystify' do

  	it 'should return correct output after running all rules for small_string' do
  		expect(@string_small.demystify).to eq 'ANTO ROCKS'
	  end

  	it 'should return correct output after running all rules for large_string' do
  		expect(@string_large.demystify).to eq 'ONE SMALL STEP FOR A TRIKELING, ONE GIANT LEAP FOR THE ARMY OF MEDIOCRITY'
	  end
  end


end
