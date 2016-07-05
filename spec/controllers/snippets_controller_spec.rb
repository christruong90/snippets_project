require 'rails_helper'

def snippet
  @snippet ||= FactoryGirl.create(:snippet)
end

RSpec.describe SnippetsController, type: :controller do

  describe '#create' do
    context "with valid attributes" do

      def valid_request
        post :create, snippet: {title: "new valid title", work: "new work"}
      end

      it "saves a record to the database" do
        count_before = Snippet.count
        valid_request
        count_after  = Snippet.count
        expect(count_after).to eq(count_before + 1)
      end
    end

  end

  describe '#update' do
    context "with valid attributes" do
      def valid_request
        patch :update, id: snippet.id, snippet: {title: "new valid title", work: "new work"}
      end
      it "updates the record in the database" do
        valid_request
        expect(snippet.reload.title).to eq("new valid title")
      end
      it "redirects to the show page" do
        valid_request
        expect(response).to redirect_to(snippet_path(snippet))
      end
      it "sets a flash message" do
        valid_request
        expect(flash[:notice]).to eq("update successful")
      end
    end
    context "with invalid attributes" do
      def invalid_request
        patch :update, id: snippet.id, snippet: {title: ""}
      end
      it "doesnt save the new value to the database" do
        invalid_request
        expect(snippet.reload.title).to_not eq("")
      end
      it "renders the edit template" do
        invalid_request
        expect(response).to render_template(:edit)
      end
    end
  end


end
