# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner
class ConfirmationsController < ApplicationController
    before_action :set_confirmation, only: [:show]
    def show
        @path
    end

    private

    def set_confirmation
        type = params[:type]
        @challenge_id = Challenge.find(params[:challenge_id]).id
        if(type == 'challenge')
            @item = Challenge.find(params[:id])
            @path = challenge_path
            @method = "delete"
        else
            @item = Request.find(params[:id])
            @path = reject_request_path(@item.id)
            @method = "get"
        end
    end
end
