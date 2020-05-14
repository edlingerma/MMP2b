# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Challenges API', type: :request do
  fixtures :challenges, :users
  before {
    @challenge = challenges(:one)
    @user = users(:one)
  }
  path '/challenges.json' do
    get 'list all the challenges' do
      produces 'application/json'

      response(200, 'successful') do
        schema type: :array,
               items: {
                   type: :object,
                   properties: {
                       id: { type: :integer },
                       title: { type: :string },
                       description: { type: :string },
                       created_at: { type: :date },
                       updated_at: { type: :date },
                       owner: { type: :string },
                       activities: {
                           type: :array,
                           items: {
                               type: :object,
                               properties: {
                                   title: { type: :string },
                                   description: { type: :string },
                                   goal: { type: :integer },
                                   progress: { type: :integer },
                                   unit: { type: :string },
                               },
                           },
                       },
                       url: { type: :string }
                   },
               }

        run_test!
      end
    end
  end

  path '/challenges/{id}.json' do
    get 'show challenge' do
      produces 'application/json'
      parameter name: 'id', in: :path, type: :string

      response(200, 'successful') do
        schema type: :object,
               properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   description: { type: :string },
                   created_at: { type: :date },
                   updated_at: { type: :date },
                   owner: { type: :string },
                   activities: {
                       type: :array,
                       items: {
                           type: :object,
                           properties: {
                               title: { type: :string },
                               description: { type: :string },
                               goal: { type: :integer },
                               progress: { type: :integer },
                               unit: { type: :string },
                           },
                       },
                   },
                   url: { type: :string }
               }

        let(:id) do
          c = Challenge.create!(title: 'Laufverein Elsbethen', description: 'Jeder ist willkommen!', owner_id: @user.id)
          c.id
        end

        run_test!
      end
    end
  end
end