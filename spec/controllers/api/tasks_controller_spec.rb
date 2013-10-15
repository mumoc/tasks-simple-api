require 'spec_helper'

describe Api::TasksController do
  describe '#index' do
    let(:tasks) { [] }

    before do
      get :index, format: :json
    end

    it 'retrieves the task list' do
      expect(response).to be_success
      expect(json_response).to eql(tasks)
    end
  end
end
