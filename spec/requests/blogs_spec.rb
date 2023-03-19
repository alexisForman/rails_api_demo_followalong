require 'swagger_helper'

RSpec.describe 'blogs', type: :request do
  blog = FactoryBot.create(:blog)

  #localhost:3000/blogs
  path '/blogs' do

    post('create blog') do
      description "Creates a blog"
      tags "Blogs"
      consumes "application/json"
      parameter name: :create_blog, in: :body, schema: {
        type: "object",
        properties: {
          title: {type: "string"},
          content: {type: "string"},
          image_path: {type: "string"}
        }
      }

      response(201, 'successful') do
        let!(:create_blog)  { {title: blog.title, content: blog.content, image_path: blog.image_path}}

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        examples "application/json" =>  {
          id: blog.id,
          title: blog.title,
          content: blog.content,
          image_path: blog.image_path,
          created_at: blog.created_at,
          updated_at: blog.updated_at
        }
        run_test!
      end

      response(422, 'unprocessable entity') do
        let!(:create_blog)  { {title: nil, content: nil, image_path: nil}}

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    get('list blogs') do
      description "Shows a list of all blogs"
      tags "Blogs"
      consumes "application/json"
    
      response(200, 'successful') do
        let!(:list_blogs) { Blogs.all }
        Blog.each do |blog|
          blog
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/blogs/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show blog') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update blog') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete blog') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
