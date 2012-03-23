require 'spec_helper'

describe MoviesController  do
	describe 'Find With Same Director' do
		it 'should call the model method to find movies with same Director' do
			Movie.should_receive(:find_same_director).with("1")
			get :same_director, {:id => 1}
		end	
		it 'should select the Found Results with same Director template for rendering' do
     		Movie.stub(:find_same_director)
     		get :same_director, {:id => 1}
      		response.should render_template('same_director')
		end	
   		it 'should make the Found Results with same Director available to that template' do
			fake_results = [mock('Movie'), mock('Movie')]
			Movie.stub(:find_same_director).and_return(fake_results)
			get :same_director, {:id => 1}			
			# look for controller method to assign @movies
			assigns(:movies).should == fake_results
	    end		
	end	

end
