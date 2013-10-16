require 'spec_helper'

describe Api::TasksController do
  let!(:task) { create(:task) }

  describe '#index' do
    before do
      get :index
    end

    specify do
      expect(response.body).to eql([task].to_json)
    end
  end

  describe '#show' do
    before do
      get :show, { id: task.id }
    end

    specify do
      expect(json_response['title']).to eql(task.title)
      expect(json_response['content']).to eql(task.content)
    end
  end

  describe '#create' do
    let(:params) do
      { task: { title: 'Created Task', content: 'Dummy' } }
    end

    before do
      post :create, params
    end

    it 'returns the created task' do
      expect(json_response['title']).to eql('Created Task')
      expect(json_response['content']).to eql('Dummy')
    end

  end

  describe '#update' do
    let(:params) do
      { id: task.id, task: { title: 'Title Waka' } }
    end

    before do
      patch :update, params
    end

    specify do
      expect(json_response['title']).to eql('Title Waka')
    end

  end

  describe '#destroy' do
    let(:params) do
      { id: task.id }
    end

    before do
      delete :destroy, params
    end

    specify do
      expect(response.body).to eql(' ')
    end
  end
end
