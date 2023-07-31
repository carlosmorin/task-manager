require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :controller do

  let(:user) { create :user, password: '123123123' }
  let(:token) { token_generator(user.id) }

  let(:tasks) do
    [
      attributes_for(:task, name: "Add new validation in the user model", due_date: Time.now + 3.days),
      attributes_for(:task, name: "Add new filter in the clients list to find  by gender", due_date: Time.now + 3.days)
    ]
  end

  let(:valid_attributes) do
    {
      name: "Terror",
      description: "Feature category",
      tasks_attributes: tasks
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      description: "Descripción de Terror",
      tasks_attributes: tasks
    }
  end

  before { request.headers['HTTP_AUTHORIZATION'] = token }

  describe "GET #index" do
    it "returns a success response" do
      Category.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end

    it "Filter with existing category" do
      Category.create! valid_attributes
      get :index, params: { query: valid_attributes[:name] }
      expect(JSON.parse(response.body).count).to eq(1)
    end

    it "Filter with unexisting category" do
      Category.create! valid_attributes
      get :index, params: { query: valid_attributes[:name].reverse }
      expect(JSON.parse(response.body).count).to eq(0)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      category = Category.create! valid_attributes
      get :show, params: {id: category.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Category" do
        expect {
          post :create, params: {category: valid_attributes}
        }.to change(Category, :count).by(1)
      end

      it "creates a new Category increment tasks" do
        expect {
          post :create, params: {category: valid_attributes}
        }.to change(Task, :count).by(2)
      end

      it "renders a JSON response with the new category" do

        post :create, params: {category: valid_attributes}
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new category" do

        post :create, params: {category: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          name: "Terror Actualizado",
          description: "Descripción de Terror"
        }
      end

      it "updates the requested category" do
        category = Category.create! valid_attributes
        put :update, params: {id: category.to_param, category: new_attributes}
        category.reload
        expect(category.name).to eq "Terror Actualizado"
      end

      it "renders a JSON response with the category" do
        category = Category.create! valid_attributes

        put :update, params: {id: category.to_param, category: valid_attributes}
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the category" do
        category = Category.create! valid_attributes

        put :update, params: {id: category.to_param, category: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested category" do
      category = Category.create! valid_attributes
      expect {
        delete :destroy, params: {id: category.to_param}
      }.to change(Category, :count).by(-1)
    end
  end

end