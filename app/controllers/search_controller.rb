class SearchController < ActionController::Base
  protect_from_forgery with: :exception

  if ENV['SEARCH_HTTP_BASIC_AUTH_ENABLED'] == 'true'
    http_basic_authenticate_with name: ENV['SEARCH_HTTP_BASIC_AUTH_NAME'], password: ENV['SEARCH_HTTP_BASIC_AUTH_PASSWORD']
  end

  def index
    @query = params.permit(:query)[:query].to_s.gsub(/[^a-zA-Z\s']+/, '').gsub(/\s{2}/, ' ').strip.downcase

    if @query.present?
      Search.create!(query: @query, ip: request.remote_ip, path: request.fullpath)

      @people = Person.not_deleted.ransack(name_cont: ' ' + @query).result
    end
  end
end
