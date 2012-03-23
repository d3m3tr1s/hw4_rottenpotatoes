require 'spec_helper'
#require 'factories/movie'

FactoryGirl.define do
  factory :movie do
  	id 1
    title 'THX-1138' # default values
    director 'George Lucas'
  end
end

describe Movie  do
	before(:each) do
		@movie = FactoryGirl.create(:movie)
	end	
	describe 'Finding movies with similar Director' do
		context 'with valid Movie ID' do
			it 'should find movie by ID' do
				Movie.should_receive(:find).with(1).and_return(@movie)
				Movie.find_same_director(1)
			end	
			it 'should find Movies with same Director' do
				Movie.should_receive(:find_all_by_director).with('George Lucas').and_return([@movie])
				Movie.find_same_director(1)
			end
		end
		context 'with invalid Movie ID' do
		end	
	end	
end	