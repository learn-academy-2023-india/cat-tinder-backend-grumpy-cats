require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      # Make a request
      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end
end

describe "POST /create" do
  it "creates a cat" do
    # The params we are going to send with the request
    cat_params = {
      cat: {
        name: 'Buster',
        age: 4,
        enjoys: 'Meow Mix, and plenty of sunshine.',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      }
    }

    # Send the request to the server
    post '/cats', params: cat_params

    # Assure that we get a success back
    expect(response).to have_http_status(200)

    # Look up the cat we expect to be created in the db
    cat = Cat.first

    # Assure that the created cat has the correct attributes
    expect(cat.name).to eq 'Buster'
  end

  it 'returns a 422 status code' do
    invalid_cat_params = {
      cat: {
        name: nil,
        age: nil,
        enjoys: nil,
        image: nil
      }
    }

    post '/cats', params: invalid_cat_params
    expect(response).to have_http_status(422)
  end

  describe "PATCH /update" do
    it "updates a cat" do
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      # create a cat
      post '/cats', params: cat_params
  
      # updated cat params
      updated_cat_params = {
        cat: {
          name: 'Buster Brown',
          age: 6,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      cat = Cat.first
      # make a request to the cat update endpoint
      patch "/cats/#{cat.id}", params: updated_cat_params

      expect(response).to have_http_status(200)
  
      updated_cat = Cat.first
      
      expect(updated_cat.name).to eq('Buster Brown')
      expect(updated_cat.age).to eq(6)
      expect(updated_cat.enjoys).to eq('Meow Mix, and plenty of sunshine.')
      expect(updated_cat.image).to eq('https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')
    end
    it 'returns a 422 status code' do
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      # create a cat
      post '/cats', params: cat_params

      invalid_cat_params = {
        cat: {
          name: nil,
          age: nil,
          enjoys: nil,
          image: nil
        }
      }

      cat = Cat.first
      patch "/cats/#{cat.id}", params: invalid_cat_params

      expect(response).to have_http_status(422)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a cat' do
      cat = Cat.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      # make a request to the cat delete endpoint
      delete "/cats/#{cat.id}"

      expect(response).to have_http_status(:no_content)
      expect(Cat.find_by(id: cat.id)).to be_nil
    end
  end
end
