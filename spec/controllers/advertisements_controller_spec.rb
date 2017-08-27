require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  
  let(:my_ad) { Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 100) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_post] to @posts" do
      get :index
      
      expect(assigns(:advertisements)).to eq([my_ad])
    end
  end

  

end
