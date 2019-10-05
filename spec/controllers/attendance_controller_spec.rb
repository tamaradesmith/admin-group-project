require 'rails_helper'

RSpec.describe AttendanceController, type: :controller do
   describe '#index' do

    it "renders index template" do
      get :index
      expect(response).to render_template :index
    end

   end

   describe "#show" do
      
      it "should render class attendance" do
         attendance = FactoryBot.create(:attendance)
         get :show, params:{id: attendance.id}
         expect(response).to render_template :show
      end 


      it "should @attendance for shown user" do
         attendance = FactoryBot.create(:attendance)
         get :show, params:{id: attendance.id}
         expect(assigns(:attendance)).to eq(attendance)
      end

   end

   describe "#edit" do

      it "should render edit templete" do
         attendance = FactoryBot.create(:attendance)
         get :edit, params:{id: attendance.id}
         expect(response).to render_template :edit
      end

      it "should get existing attendace params" do
         attendance = FactoryBot.create(:attendance)
         get :edit , params: {id: attendance.id}
         expect(assigns(:attendance)).to eq(attendance)
      end

   end

   describe "#update" do

      before do
         @attendance = FactoryBot.create(:attendance)
      end

      it "update changes to attedance" do 
         new_am = "absent"
         patch :update, params: {id: @attendance.id, attendance:{am: new_am}}
         expect(@attendance.reload.am).to eq(new_am)
      end

      it "should redirect index page" do
         new_am = "absent"
         patch :update, params: {id: @attendance.id, attendance:{am: new_am}}
         expect(response).to redirect_to attendance_index_path

      end

   end


end