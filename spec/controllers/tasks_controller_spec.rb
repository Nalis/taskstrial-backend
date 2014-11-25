require 'rails_helper'

describe TasksController, :type => :controller do
  let(:task) { FactoryGirl.create(:task) }

  describe "GET #index" do
    let!(:tasks) { [task] }

    context "with id parameters" do
      it "returns a subset of test_models" do
        get :index, {format: :json}, { :task => [ tasks.first.id ] }
        expect(json.count).to eq(1)
      end
    end

  end
end
