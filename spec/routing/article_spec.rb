require 'rails_helper'

RSpec.describe '/articles routes' do

  it 'routes to articles#index' do
    aggregate_failures do
      # expect(get '/articles').to route_to(controller: 'articles', action: index) 
      expect(get '/articles').to route_to('articles#index') # Same as above, shortend controller/action syntax    
      expect(get '/articles?page[number]=3').to route_to('articles#index', 'page' => { 'number' => '3' }) # Syntax for dynamic parameters      
    end
  end

  it 'routes to article with passed id' do
    expect(get '/articles/1').to route_to('articles#show', id: '1')
  end
end