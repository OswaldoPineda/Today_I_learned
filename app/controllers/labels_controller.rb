# frozen_string_literal: true

# Service to download ftp files from the server
class LabelsController < ApplicationController
  def index
    @labels = Label.all
    render json: @labels
  end
end
