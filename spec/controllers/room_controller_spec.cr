require "./spec_helper"

def create_subject
  subject = Room.new
  subject.name = "test"
  subject.save
  subject
end

describe RoomController do
  Spec.before_each do
    Room.clear
  end

  describe RoomController::Index do
    it "renders all the rooms" do
      subject = create_subject
      get "/rooms"
      response.body.should contain "test"
    end
  end

  describe RoomController::Show do
    it "renders a single room" do
      subject = create_subject
      get "/rooms/#{subject.id}"
      response.body.should contain "test"
    end
  end

  describe RoomController::New do
    it "render new template" do
      get "/rooms/new"
      response.body.should contain "New Room"
    end
  end

  describe RoomController::Create do
    it "creates a room" do
      post "/rooms", body: "name=testing"
      subject_list = Room.all
      subject_list.size.should eq 1
    end
  end

  describe RoomController::Edit do
    it "renders edit template" do
      subject = create_subject
      get "/rooms/#{subject.id}/edit"
      response.body.should contain "Edit Room"
    end
  end

  describe RoomController::Update do
    it "updates a room" do
      subject = create_subject
      patch "/rooms/#{subject.id}", body: "name=test2"
      result = Room.find(subject.id).not_nil!
      result.name.should eq "test2"
    end
  end

  describe RoomController::Delete do
    it "deletes a room" do
      subject = create_subject
      delete "/rooms/#{subject.id}"
      result = Room.find subject.id
      result.should eq nil
    end
  end
end
