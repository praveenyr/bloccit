require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:name){ RandomData.random_sentence}
  let(:description){ RandomData.random_paragraph}
  let(:public){ true }
  let(:topic){ Topic.create!(name: name,description: description)}
  
<<<<<<< HEAD
=======
  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:sponsoredposts) }
  
>>>>>>> assignment-22-rails-topicsandposts
  describe "attributes" do
     it "name,description and public attributes" do
        expect(topic).to have_attributes(name: name, description: description, public: public)
     end
    
     it "is public by default" do
        expect(topic.public).to be(true)
     end
  end    
end
