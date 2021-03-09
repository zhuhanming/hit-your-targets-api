require 'rails_helper'

RSpec.describe 'Subtodos API' do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:todo) { create(:todo, user_id: user.id) }
  let!(:subtodos) { create_list(:subtodo, 20, todo_id: todo.id) }
  let(:todo_id) { todo.id }
  let(:id) { subtodos.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /todos/:todo_id/subtodos
  describe 'GET /todos/:todo_id/subtodos' do
    before { get "/todos/#{todo_id}/subtodos", params: {}, headers: headers }

    context 'when todo exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all todo subtodos' do
        expect(json.size).to eq(20)
      end
    end

    context 'when todo does not exist' do
      let(:todo_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  # Test suite for GET /todos/:todo_id/subtodos/:id
  describe 'GET /todos/:todo_id/subtodos/:id' do
    before { get "/todos/#{todo_id}/subtodos/#{id}", params: {}, headers: headers }

    context 'when todo subtodo exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the subtodo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end
    end

    context 'when todo subtodo does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Subtodo/)
      end
    end
  end

  # Test suite for PUT /todos/:todo_id/subtodos
  describe 'POST /todos/:todo_id/subtodos' do
    let(:valid_attributes) { { 
      title: 'Visit Narnia', 
      start_time: rand(10.years).seconds.ago, 
      end_time: rand(10.years).seconds.ago, 
      completed: false 
    }.to_json }

    context 'when request attributes are valid' do
      before { post "/todos/#{todo_id}/subtodos", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/todos/#{todo_id}/subtodos", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /todos/:todo_id/subtodos/:id
  describe 'PUT /todos/:todo_id/subtodos/:id' do
    let(:valid_attributes) { { title: 'Mozart' }.to_json }

    before { put "/todos/#{todo_id}/subtodos/#{id}", params: valid_attributes, headers: headers }

    context 'when subtodo exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the subtodo' do
        updated_subtodo = Subtodo.find(id)
        expect(updated_subtodo.title).to match(/Mozart/)
      end
    end

    context 'when the subtodo does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Subtodo/)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /todos/:id' do
    before { delete "/todos/#{todo_id}/subtodos/#{id}", params: {}, headers: headers }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end