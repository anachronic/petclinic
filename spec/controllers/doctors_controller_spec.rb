require 'rails_helper'

RSpec.describe DoctorsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Doctor. As you add validations to Doctor, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      name: "John Doe",
      phone: "1213432",
      email: "email@example.com"
    }
  }

  let(:invalid_attributes) {
    {
      name: "123",
      phone: "asdvb",
      email: "123"
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DoctorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Doctor.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      doctor = Doctor.create! valid_attributes
      get :show, params: {id: doctor.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      doctor = Doctor.create! valid_attributes
      get :edit, params: {id: doctor.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Doctor" do
        expect {
          post :create, params: {doctor: valid_attributes}, session: valid_session
        }.to change(Doctor, :count).by(1)
      end

      it "redirects to the created doctor" do
        post :create, params: {doctor: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Doctor.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {doctor: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: "Jeff Bezos",
          email: "jeff@amazon.com",
          phone: "+32 123 123 123"
        }
      }

      it "updates the requested doctor" do
        doctor = Doctor.create! valid_attributes
        put :update, params: {id: doctor.to_param, doctor: new_attributes}, session: valid_session
        doctor.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the doctor" do
        doctor = Doctor.create! valid_attributes
        put :update, params: {id: doctor.to_param, doctor: valid_attributes}, session: valid_session
        expect(response).to redirect_to(doctor)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        doctor = Doctor.create! valid_attributes
        put :update, params: {id: doctor.to_param, doctor: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested doctor" do
      doctor = Doctor.create! valid_attributes
      expect {
        delete :destroy, params: {id: doctor.to_param}, session: valid_session
      }.to change(Doctor, :count).by(-1)
    end

    it "redirects to the doctors list" do
      doctor = Doctor.create! valid_attributes
      delete :destroy, params: {id: doctor.to_param}, session: valid_session
      expect(response).to redirect_to(doctors_url)
    end
  end

end
